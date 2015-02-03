//
//  Note.m
//  Supertonic
//
//  Created by Ben Zotto on 1/19/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import "Note.h"

#define SEMITONES_IN_OCTAVE 12

@interface Note ()
@property (nonatomic, assign) NoteName noteName;
@property (nonatomic, assign) Accidental accidental;
@end

@implementation Note
+ (Note *)noteFromString:(NSString *)string
{
    // expect up to three characters.
    if (string.length > 3 || string.length < 1) {
        return nil;
    }
    NoteName name;
    // base note
    switch ([string characterAtIndex:0]) {
        case 'C': name = NoteName_C; break;
        case 'D': name = NoteName_D; break;
        case 'E': name = NoteName_E; break;
        case 'F': name = NoteName_F; break;
        case 'G': name = NoteName_G; break;
        case 'A': name = NoteName_A; break;
        case 'B': name = NoteName_B; break;
        default: return nil;
    }
    // accidental
    Accidental accidental = AccidentalNatural;
    for (int i = 1; i < string.length; i++) {
        switch([string characterAtIndex:i]) {
            case 'b': accidental--; break;
            case '#': accidental++; break;
            default: return nil;
        }
    }
    
    return [[Note alloc] initWithNoteName:name accidental:accidental];
}

- (id)initWithNoteName:(NoteName)name accidental:(Accidental)accidental
{
    self = [super init];
    if (self) {
        self.noteName = name;
        self.accidental = accidental;
    }
    return self;
}

- (Pitch)canonicalPitch
{
    // Start by mapping the base note onto its semitone.
    int pitch;
    switch (self.noteName) {
        case NoteName_C:
            pitch = Pitch_C;
            break;
        case NoteName_D:
            pitch = Pitch_D;
            break;
        case NoteName_E:
            pitch = Pitch_E;
            break;
        case NoteName_F:
            pitch = Pitch_F;
            break;
        case NoteName_G:
            pitch = Pitch_G;
            break;
        case NoteName_A:
            pitch = Pitch_A;
            break;
        case NoteName_B:
            pitch = Pitch_B;
            break;
    }
    // Adjust it by the accidental, then mod it back into the octave.
    pitch += self.accidental;
    if (pitch < 0) {
        pitch = SEMITONES_IN_OCTAVE - pitch;
    }
    if (pitch > Pitch_B) {
        pitch -= SEMITONES_IN_OCTAVE;
    }
    return pitch;
}

- (NSString *)string
{
    NSMutableString * string = [NSMutableString string];
    switch (self.noteName) {
        case NoteName_C:
            [string appendString:@"C"];
            break;
        case NoteName_D:
            [string appendString:@"D"];
            break;
        case NoteName_E:
            [string appendString:@"E"];
            break;
        case NoteName_F:
            [string appendString:@"F"];
            break;
        case NoteName_G:
            [string appendString:@"G"];
            break;
        case NoteName_A:
            [string appendString:@"A"];
            break;
        case NoteName_B:
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
    return [NSString stringWithFormat:@"<%@: %p; %@>", [self class], self, self.string];
}
@end