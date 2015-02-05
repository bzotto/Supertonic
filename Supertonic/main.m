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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray * notes = @[ @"C", @"Db", @"F", @"G", @"A", @"Cbb"]; // Cbb doesn't work
        for (NSString * notename in notes) {
            Note * note = [Note noteWithName:notename];
            NSLog(@"%@ major: %@ %@ %@ %@ %@ %@ %@ %@", note.name,
                  [[note noteByAddingInterval:[Interval intervalWithName:@"P1"]] name],
                  [[note noteByAddingInterval:[Interval intervalWithName:@"M2"]] name],
                  [[note noteByAddingInterval:[Interval intervalWithName:@"M3"]] name],
                  [[note noteByAddingInterval:[Interval intervalWithName:@"P4"]] name],
                  [[note noteByAddingInterval:[Interval intervalWithName:@"P5"]] name],
                  [[note noteByAddingInterval:[Interval intervalWithName:@"M6"]] name],
                  [[note noteByAddingInterval:[Interval intervalWithName:@"M7"]] name],
                  [[note noteByAddingInterval:[Interval intervalWithName:@"P8"]] name]);
        }
    }
    return 0;
}
