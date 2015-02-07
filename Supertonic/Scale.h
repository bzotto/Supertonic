//
//  Scale.h
//  Supertonic
//
//  Created by Ben Zotto on 2/6/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

//
// "It's like La Scala in here." --Billy Joel
//
// A scale is a sequence of notes. It is a narrower concept than "key".
// A scale has a number of degrees, and generally uses octave equivalence to
// repeat that sequence of degrees for each octave.
//

@interface Scale : NSObject
@property (nonatomic, readonly) Note * tonic;
+ (instancetype)scaleWithTonic:(Note *)tonic;
- (id)initWithTonic:(Note *)tonic;
- (NSString *)name;
- (int)degreeCount;
- (Note *)noteForDegree:(int)degree;
@end
