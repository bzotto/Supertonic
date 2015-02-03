//
//  Note.h
//  Supertonic
//
//  Created by Ben Zotto on 1/19/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Interval.h"

typedef enum {
    Pitch_C,
    Pitch_CSharpDFlat,
    Pitch_D,
    Pitch_DSharpEFlat,
    Pitch_E,
    Pitch_F,
    Pitch_FSharpGFlat,
    Pitch_G,
    Pitch_GSharpAFlat,
    Pitch_A,
    Pitch_ASharpBFlat,
    Pitch_B,
} Pitch;

typedef enum {
    NoteName_C,
    NoteName_D,
    NoteName_E,
    NoteName_F,
    NoteName_G,
    NoteName_A,
    NoteName_B
} NoteName;

typedef enum {
    AccidentalDoubleFlat  = -2,
    AccidentalFlat        = -1,
    AccidentalNatural     = 0,
    AccidentalSharp       = 1,
    AccidentalDoubleSharp = 2
} Accidental;

@interface Note : NSObject
@property (nonatomic, readonly) NoteName noteName;
@property (nonatomic, readonly) Accidental accidental;
+ (Note *)noteFromString:(NSString *)name;
- (id)initWithNoteName:(NoteName)name accidental:(Accidental)accidental;
- (Pitch)canonicalPitch;
- (NSString *)string;
@end
