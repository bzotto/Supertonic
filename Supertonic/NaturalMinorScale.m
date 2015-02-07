//
//  NaturalMinorScale.m
//  Supertonic
//
//  Created by Ben Zotto on 2/6/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import "NaturalMinorScale.h"

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
    return [NSString stringWithFormat:@"%@ Minor", self.tonic.name];
}

- (int)degreeCount
{
    return 8;
}

- (Note *)noteForDegree:(int)degree
{
    return [self.scaleNotes objectAtIndex:degree];
}
@end
