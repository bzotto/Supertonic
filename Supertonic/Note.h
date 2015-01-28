//
//  Note.h
//  Supertonic
//
//  Created by Ben Zotto on 1/19/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Semitone_C,
    Semitone_CSharpDFlat,
    Semitone_D,
    Semitone_DSharpEFlat,
    Semitone_E,
    Semitone_F,
    Semitone_FSharpGFlat,
    Semitone_G,
    Semitone_GSharpAFlat,
    Semitone_A,
    Semitone_ASharpBFlat,
    Semitone_B,
} Semitone;

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
    Accidental_DoubleFlat  = -2,
    Accidental_Flat        = -1,
    Accidental_Natural     = 0,
    Accidental_Sharp       = 1,
    Accidental_DoubleSharp = 2
} Accidental;

@interface Note : NSObject
@property (nonatomic, readonly) NoteName noteName;
@property (nonatomic, readonly) Accidental accidental;
+ (Note *)noteWithString:(NSString *)name;
- (id)initWithNoteName:(NoteName)name accidental:(Accidental)accidental;
- (Semitone)semitone;
- (NSString *)string;
@end
