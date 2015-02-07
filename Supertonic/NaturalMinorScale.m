//
//  NaturalMinorScale.m
//  Supertonic
//
//  Created by Ben Zotto on 2/6/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import "NaturalMinorScale.h"
#import "MajorScale.h"

@interface NaturalMinorScale ()
@property (nonatomic, strong) NSArray * scaleNotes;
@end

@implementation NaturalMinorScale
- (id)initWithTonic:(Note *)tonic
{
    self = [super initWithTonic:tonic];
    if (self) {
        self.scaleNotes = @[
                            [self.tonic noteByAddingInterval:[Interval intervalWithName:@"P1"]],
                            [self.tonic noteByAddingInterval:[Interval intervalWithName:@"M2"]],
                            [self.tonic noteByAddingInterval:[Interval intervalWithName:@"m3"]],
                            [self.tonic noteByAddingInterval:[Interval intervalWithName:@"P4"]],
                            [self.tonic noteByAddingInterval:[Interval intervalWithName:@"P5"]],
                            [self.tonic noteByAddingInterval:[Interval intervalWithName:@"m6"]],
                            [self.tonic noteByAddingInterval:[Interval intervalWithName:@"m7"]],
                            [self.tonic noteByAddingInterval:[Interval intervalWithName:@"P8"]]
                            ];
    }
    return self;
}

- (NSString *)name
{
    return [NSString stringWithFormat:@"%@ minor", self.tonic.name];
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

- (MajorScale *)relativeMajorScale
{
    // Relative major is built from the 3rd degree of any major scale.
    return [MajorScale scaleWithTonic:[self noteForDegree:3]];
}
@end
