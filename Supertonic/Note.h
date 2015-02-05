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
    NaturalNote_C,
    NaturalNote_D,
    NaturalNote_E,
    NaturalNote_F,
    NaturalNote_G,
    NaturalNote_A,
    NaturalNote_B
} NaturalNote;

typedef enum {
    AccidentalDoubleFlat  = -2,
    AccidentalFlat        = -1,
    AccidentalNatural     = 0,
    AccidentalSharp       = 1,
    AccidentalDoubleSharp = 2
} Accidental;

@interface Note : NSObject
@property (nonatomic, readonly) NaturalNote natural;
@property (nonatomic, readonly) Accidental accidental;
+ (Note *)noteWithName:(NSString *)name;
- (id)initWithNaturalNote:(NaturalNote)naturalNote accidental:(Accidental)accidental;
- (Pitch)canonicalPitch;
- (Note *)noteByAddingInterval:(Interval *)interval;
- (NSString *)name;
@end
