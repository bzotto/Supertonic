//
//  Note.m
//  Supertonic
//
//  Created by Ben Zotto on 1/19/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import "Note.h"

#define SEMITONES_IN_OCTAVE     12
#define NATURAL_NOTES_IN_OCTAVE 7

@interface Note ()
@property (nonatomic, assign) NaturalNote natural;
@property (nonatomic, assign) Accidental accidental;
@end

@implementation Note
+ (Note *)noteWithName:(NSString *)name
{
    // expect up to three characters.
    if (name.length > 3 || name.length < 1) {
        return nil;
    }
    NaturalNote natural;
    // base note
    switch ([name characterAtIndex:0]) {
        case 'C': natural = NaturalNote_C; break;
        case 'D': natural = NaturalNote_D; break;
        case 'E': natural = NaturalNote_E; break;
        case 'F': natural = NaturalNote_F; break;
        case 'G': natural = NaturalNote_G; break;
        case 'A': natural = NaturalNote_A; break;
        case 'B': natural = NaturalNote_B; break;
        default: return nil;
    }
    // accidental
    Accidental accidental = AccidentalNatural;
    for (int i = 1; i < name.length; i++) {
        switch([name characterAtIndex:i]) {
            case 'b': accidental--; break;
            case '#': accidental++; break;
            default: return nil;
        }
    }
    
    return [[Note alloc] initWithNaturalNote:natural accidental:accidental];
}

- (id)initWithNaturalNote:(NaturalNote)natural accidental:(Accidental)accidental
{
    natural = natural % NATURAL_NOTES_IN_OCTAVE;
    if (accidental < AccidentalDoubleFlat || accidental > AccidentalDoubleSharp) {
        NSLog(@"Invalid accidental.");
        return nil;
    }
    
    self = [super init];
    if (self) {
        self.natural = natural;
        self.accidental = accidental;
    }
    return self;
}

- (Pitch)canonicalPitch
{
    // Start by mapping the base note onto its semitone.
    int pitch;
    switch (self.natural) {
        case NaturalNote_C:
            pitch = Pitch_C;
            break;
        case NaturalNote_D:
            pitch = Pitch_D;
            break;
        case NaturalNote_E:
            pitch = Pitch_E;
            break;
        case NaturalNote_F:
            pitch = Pitch_F;
            break;
        case NaturalNote_G:
            pitch = Pitch_G;
            break;
        case NaturalNote_A:
            pitch = Pitch_A;
            break;
        case NaturalNote_B:
            pitch = Pitch_B;
            break;
    }
    // Adjust it by the accidental, then mod it back into the octave.
    pitch += self.accidental;
    if (pitch < 0) {
        pitch += SEMITONES_IN_OCTAVE;
    }
    if (pitch > Pitch_B) {
        pitch -= SEMITONES_IN_OCTAVE;
    }
    return pitch;
}

- (Note *)noteByAddingInterval:(Interval *)interval
{
    // Start by finding the natural note name we're looking for. That will be
    // the current note name, with the interval's number added to it. This MUST
    // be the natural note, regardless of how many accidentals need to be applied.
    // Remember whether we overflowed the octave to get there.
    BOOL overflow = NO;
    NaturalNote natural = self.natural + (interval.number - 1);
    if (natural > NaturalNote_B) {
        overflow = YES;
        natural = natural % NATURAL_NOTES_IN_OCTAVE;
    }
    
    // Next create a temporary note that represents this natural note with no accidentals
    // applied.
    Note * temp = [[Note alloc] initWithNaturalNote:natural accidental:AccidentalNatural];
    Pitch naturalPitch = [temp canonicalPitch];
    // If we're building this based on the next octave up, apply an octave's worth of
    // semitones to get us back into range.
    if (overflow) {
        naturalPitch += SEMITONES_IN_OCTAVE;
    }
    
    // Find the target pitch we're looking for, which is our canonical pitch incremented
    // by the number of semitones in the interval. Our (named) result must have this
    // pitch. This computation is not done mod an octave for simplicity, so targetPitch
    // may not look meaningful in the debugger if we're above the first octave.
    Pitch targetPitch = [self canonicalPitch] + [interval semitones];
    
    // We know the natural note name that the result must have, and we know the pitch
    // that the result must have. We just need to calculate which accidental gets us
    // from the former to the latter. Do this by computing the difference between the
    // pitches.
    int pitchDifference = naturalPitch - targetPitch;

    // The result note is the natural note modulated by the accidental (inverse of the
    // pitch difference we just computed).
    return [[Note alloc] initWithNaturalNote:natural accidental:(pitchDifference * -1)];
}

- (NSString *)name
{
    NSMutableString * string = [NSMutableString string];
    switch (self.natural) {
        case NaturalNote_C:
            [string appendString:@"C"];
            break;
        case NaturalNote_D:
            [string appendString:@"D"];
            break;
        case NaturalNote_E:
            [string appendString:@"E"];
            break;
        case NaturalNote_F:
            [string appendString:@"F"];
            break;
        case NaturalNote_G:
            [string appendString:@"G"];
            break;
        case NaturalNote_A:
            [string appendString:@"A"];
            break;
        case NaturalNote_B:
            [string appendString:@"B"];
            break;
    }
    
    switch (self.accidental) {
        case AccidentalDoubleFlat:
            [string appendString:@"bb"];
            break;
        case AccidentalFlat:
            [string appendString:@"b"];
            break;
        case AccidentalSharp:
            [string appendString:@"#"];
            break;
        case AccidentalDoubleSharp:
            [string appendString:@"##"];
            break;
        default:
            ;
    }
    
    return string;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; %@>", [self class], self, self.name];
}
@end