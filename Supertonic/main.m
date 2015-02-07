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
            Scale * scale = [NaturalMinorScale scaleWithTonic:note];
            NSMutableString * str = [NSMutableString string];
            [str appendFormat:@"%@: ", scale.name];
            for (int i = 0; i < scale.degreeCount; i++) {
                [str appendFormat:@"%@ ", [scale noteForDegree:i].name];
            }
            NSLog(@"%@", str);
        }
    }
    return 0;
}
