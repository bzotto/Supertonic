//
//  MajorScale.h
//  Supertonic
//
//  Created by Ben Zotto on 2/6/15.
//  Copyright (c) 2015 Ben Zotto. All rights reserved.
//

#import "Scale.h"
@class NaturalMinorScale;

@interface MajorScale : Scale
- (NaturalMinorScale *)relativeMinorScale;
@end
