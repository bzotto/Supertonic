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
+ (Note *)noteWithString:(NSString *)string
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
    Accidental accidental = Accidental_Natural;
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

- (Semitone)semitone
{
    // Start by mapping the base note onto its semitone.
    int semitone;
    switch (self.noteName) {
        case NoteName_C:
            semitone = Semitone_C;
            break;
        case NoteName_D:
            semitone = Semitone_D;
            break;
        case NoteName_E:
            semitone = Semitone_E;
            break;
        case NoteName_F:
            semitone = Semitone_F;
            break;
        case NoteName_G:
            semitone = Semitone_G;
            break;
        case NoteName_A:
            semitone = Semitone_A;
            break;
        case NoteName_B:
            semitone = Semitone_B;
            break;
    }
    // Adjust it by the accidental, then mod it back into the octave.
    semitone += self.accidental;
    if (semitone < 0) {
        semitone = SEMITONES_IN_OCTAVE - semitone;
    }
    if (semitone > Semitone_B) {
        semitone -= SEMITONES_IN_OCTAVE;
    }
    return semitone;
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
        case Accidental_DoubleFlat:
            [string appendString:@"bb"];
            break;
        case Accidental_Flat:
            [string appendString:@"b"];
            break;
        case Accidental_Sharp:
            [string appendString:@"#"];
            break;
        case Accidental_DoubleSharp:
            [string appendString:@"##"];
            break;
        default:
            ;
    }
    
    return string;
}
@end