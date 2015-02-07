//
//  Scale.m
//  Supertonic
//
//  Created by Ben Zotto on 2/6/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import "Scale.h"

@interface Scale ()
@property (nonatomic, strong) Note * tonic;
@end

@implementation Scale
+ (instancetype)scaleWithTonic:(Note *)tonic
{
    return [[[self class] alloc] initWithTonic:tonic];
}

- (id)initWithTonic:(Note *)tonic
{
    self = [super init];
    if (self) {
        self.tonic = tonic;
    }
    return self;
}

- (NSString *)name
{
    return nil;
}

- (int)degreeCount
{
    return 0;
}

- (Note *)noteForDegree:(int)degree
{
    return nil;
}
@end
