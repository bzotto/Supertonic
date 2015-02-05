//
//  Interval.m
//  Supertonic
//
//  Created by Ben Zotto on 1/27/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import "Interval.h"

@interface Interval ()
@property (nonatomic, assign) int number;
@property (nonatomic, assign) IntervalQuality quality;
@end

@implementation Interval
+ (Interval *)intervalFromString:(NSString *)string
{
    if (string.length != 2) {
        NSLog(@"interval string must be two characters, failed to parse '%@'", string);
        return nil;
    }
    
    IntervalQuality quality;
    switch ([string characterAtIndex:0]) {
        case 'P': quality = IntervalQualityPerfect; break;
        case 'M': quality = IntervalQualityMajor; break;
        case 'm': quality = IntervalQualityMinor; break;
        case 'A': quality = IntervalQualityAugmented; break;
        case 'd': quality = IntervalQualityDiminished; break;
        default:
            NSLog(@"unknown interval quality '%@'", [string substringToIndex:1]);
            return nil;
    }
    
    int number = [[string substringFromIndex:1] intValue];
    if (number <= 0 || number > 8) {
        NSLog(@"unknown interval number '%@'", [string substringFromIndex:1]);
        return nil;
    }
    
    return [[Interval alloc] initWithNumber:number quality:quality];
}

- (id)initWithNumber:(int)number quality:(IntervalQuality)quality
{
    self = [super init];
    if (self) {
        self.number = number;
        self.quality = quality;
        if ([self semitones] < 0) {
            NSLog(@"Invalid interval %@", [self name]);
            return nil;
        }
    }
    return self;
}

- (int)semitones
{
    switch (self.quality) {
        case IntervalQualityPerfect:
            switch (self.number) {
                case 1:
                    return 0;
                case 4:
                    return 5;
                case 5:
                    return 7;
                case 8:
                    return 12;
            }
            break;
        case IntervalQualityMajor:
            switch (self.number) {
                case 2:
                    return 2;
                case 3:
                    return 4;
                case 6:
                    return 9;
                case 7:
                    return 11;
            }
            break;
        case IntervalQualityMinor:
            switch (self.number) {
                case 2:
                    return 1;
                case 3:
                    return 3;
                case 6:
                    return 8;
                case 7:
                    return 10;
            }
            break;
        case IntervalQualityAugmented:
            switch (self.number) {
                case 1:
                    return 1;
                case 2:
                    return 3;
                case 3:
                    return 5;
                case 4:
                    return 6;
                case 5:
                    return 8;
                case 6:
                    return 10;
                case 7:
                    return 12;
            }
            break;
        case IntervalQualityDiminished:
            switch (self.number) {
                case 2:
                    return 0;
                case 3:
                    return 2;
                case 4:
                    return 4;
                case 5:
                    return 6;
                case 6:
                    return 7;
                case 7:
                    return 9;
                case 8:
                    return 11;
            }
    }
    // Invalid interval.
    return -1;
}

- (NSString *)name
{
    NSString * qualityString = nil;
    switch (self.quality) {
        case IntervalQualityPerfect: qualityString = @"P"; break;
        case IntervalQualityMajor: qualityString = @"M"; break;
        case IntervalQualityMinor: qualityString = @"m"; break;
        case IntervalQualityAugmented: qualityString = @"A"; break;
        case IntervalQualityDiminished: qualityString = @"d"; break;
    }
    return [NSString stringWithFormat:@"%@%d", qualityString, self.number];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; %@>", [self class], self, self.name];
}
@end
