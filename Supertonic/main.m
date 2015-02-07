//
//  main.m
//  Supertonic
//
//  Created by Ben Zotto on 1/27/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
#import "Interval.h"
#import "MajorScale.h"
#import "NaturalMinorScale.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray * notes = @[ @"C", @"Db", @"F", @"G", @"A"];
        for (NSString * notename in notes) {
            Note * note = [Note noteWithName:notename];
            MajorScale * scale = [MajorScale scaleWithTonic:note];
            Scale * relativeMinor = [scale relativeMinorScale];
            NSMutableString * str = [NSMutableString string];
            [str appendFormat:@"%@: ", relativeMinor.name];
            for (int i = 1; i <= relativeMinor.degreeCount; i++) {
                [str appendFormat:@"%@ ", [relativeMinor noteForDegree:i].name];
            }
            NSLog(@"%@", str);
        }
    }
    return 0;
}
