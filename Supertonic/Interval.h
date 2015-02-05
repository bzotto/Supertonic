//
//  Interval.h
//  Supertonic
//
//  Created by Ben Zotto on 1/27/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    IntervalQualityPerfect,   // "perfectly consonant" (trad)
    IntervalQualityMajor,
    IntervalQualityMinor,
    IntervalQualityAugmented,
    IntervalQualityDiminished
} IntervalQuality;

@interface Interval : NSObject
@property (nonatomic, readonly) int number;
@property (nonatomic, readonly) IntervalQuality quality;
+ (Interval *)intervalWithName:(NSString *)name;
- (int)semitones;
- (NSString *)name;
@end
