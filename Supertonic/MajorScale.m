//
//  MajorScale.m
//  Supertonic
//
//  Created by Ben Zotto on 2/6/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import "MajorScale.h"
#import "NaturalMinorScale.h"

@interface MajorScale ()
@property (nonatomic, strong) NSArray * scaleNotes;
@end

@implementation MajorScale
- (id)initWithTonic:(Note *)tonic
{
    self = [super initWithTonic:tonic];
    if (self) {
        self.scaleNotes = @[
                           [self.tonic noteByAddingInterval:[Interval intervalWithName:@"P1"]],
                           [self.tonic noteByAddingInterval:[Interval intervalWithName:@"M2"]],
                           [self.tonic noteByAddingInterval:[Interval intervalWithName:@"M3"]],
                           [self.tonic noteByAddingInterval:[Interval intervalWithName:@"P4"]],
                           [self.tonic noteByAddingInterval:[Interval intervalWithName:@"P5"]],
                           [self.tonic noteByAddingInterval:[Interval intervalWithName:@"M6"]],
                           [self.tonic noteByAddingInterval:[Interval intervalWithName:@"M7"]],
                           [self.tonic noteByAddingInterval:[Interval intervalWithName:@"P8"]]
                           ];
    }
    return self;
}

- (NSString *)name
{
    return [NSString stringWithFormat:@"%@ major", self.tonic.name];
}

- (int)degreeCount
{
    return 8;
}

- (Note *)noteForDegree:(int)degree
{
    if (degree <= 0 || degree > [self degreeCount]) {
        return nil;
    }
    // Degrees are traditionally 1-indexed.
    return [self.scaleNotes objectAtIndex:(degree-1)];
}

- (NaturalMinorScale *)relativeMinorScale
{
    // Relative minor is built from the 6th degree of any major scale.
    return [NaturalMinorScale scaleWithTonic:[self noteForDegree:6]];
}
@end
