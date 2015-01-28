//
//  main.m
//  Supertonic
//
//  Created by Ben Zotto on 1/27/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Note * note = [Note noteWithString:@"Bb"];
        NSLog(@"Note: %@", note.string);
    
    }
    return 0;
}
