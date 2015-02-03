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

        Note * note1 = [Note noteFromString:@"Bb"];
        Note * note2 = [Note noteFromString:@"A#"];
        Interval * interval = [Interval intervalFromString:@"m2"];
        NSLog(@"Note1: %@ Note2: %@ Interval: %@", note1.string, note2.string, interval.string);
        if (note1.canonicalPitch != note2.canonicalPitch) {
            NSLog(@"Mismatched canonical pitch");
        }
    }
    return 0;
}
