//
//  PolygonShape.m
//  WhatATool
//
//  Created by Mike Barker on 10/27/09.
//  Copyright 2009 Michael Barker, Consultant. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

-(void) setNumberOfSides: (int)sides
{
    if (sides < minimumNumberOfSides) {
        NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed",sides, minimumNumberOfSides);
    } else if (sides > maximumNumberOfSides) {
        NSLog(@"Invalid number of sides: %d is more than the maxiumum of %d allowed",sides, maximumNumberOfSides);
    } else {
        numberOfSides = sides;
    }
}
-(void) setMinimumNumberOfSides: (int)minSides
{
    if (minSides <= 2) {
        NSLog(@"Invalid minumum number of sides: %d must be more than 2",minSides);
    } else {
        minimumNumberOfSides = minSides;
    }
}
-(void) setMaximumNumberOfSides: (int)maxSides
{
    if (maxSides > 12) {
        NSLog(@"Invalid maximum number of sides: %d must be more than 12",maxSides);
    } else {
        maximumNumberOfSides = maxSides;
    }
}
-(float) angleInDegrees
{
    return (180 * (numberOfSides - 2)) / numberOfSides; 
}
-(float) angleInRadians
{ 
    return self.angleInDegrees * (M_PI/180); 
}
-(NSString*) name
{
    NSDictionary *polygonNames = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"Triangle",      @"3",
                                  @"Quadrilateral", @"4",
                                  @"Pentagon",      @"5",
                                  @"Hexagon",       @"6",
                                  @"Heptagon",      @"7",
                                  @"Octagon",       @"8",
                                  @"Enneagon",      @"9",
                                  @"Decagon",      @"10",
                                  @"Hendecagon",   @"11",
                                  @"Dodecagon",    @"12",
                                  nil];
    
    return [polygonNames valueForKey:[[NSNumber numberWithInt:numberOfSides] stringValue]];
}
-(id)init
{
    self = [super init];
    if (self) {
        [self initWithNumberOfSides:3 andMinimumNumberOfSides:3 andMaximumNumberOfSides:3];
    }
    return self;
}
-(id)initWithNumberOfSides: (int)sides andMinimumNumberOfSides: (int)minSides andMaximumNumberOfSides: (int)maxSides
{
    self = [super init];
    if (self) {
        self.minimumNumberOfSides = minSides;
        self.maximumNumberOfSides = maxSides;
        self.numberOfSides = sides;
    }
    return self;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"Hello, I am a %d-sided polygon (aka %@) with angles of %.2f (%f radians).",
            self.numberOfSides, self.name, self.angleInDegrees, self.angleInRadians];
}
-(void)dealloc
{
    NSLog(@"Dealocating a %@ polygon.", self.name);
    [super dealloc];
}
@end
