//
//  PolygonShape.m
//
//  Created by Mike Barker on 10/27/09.
//  Copyright 2009 Michael Barker, Consultant. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

+ (NSArray*) pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    
    float radius = 0.95 * center.x;
    
    NSMutableArray *result = [NSMutableArray array];
    
    float angle = (2.0 * M_PI) / numberOfSides;
    float exteriorAngle = M_PI - angle;
    float rotationDelta = angle - (0.5 * exteriorAngle);
    
    for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
        float newAngle = (angle * currentAngle) - rotationDelta;
        float curX = cos(newAngle) * radius;
        float curY = sin(newAngle) * radius;
        [result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, center.y + curY)]];
    } 
    return result;
}
- (void) setNumberOfSides: (int)sides {
    if (sides < minimumNumberOfSides) {
        NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed",sides, minimumNumberOfSides);
    } else if (sides > maximumNumberOfSides) {
        NSLog(@"Invalid number of sides: %d is more than the maxiumum of %d allowed",sides, maximumNumberOfSides);
    } else {
        numberOfSides = sides;
    }
}
- (float) angleInDegrees {
    return (180 * (numberOfSides - 2)) / numberOfSides; 
}
- (float) angleInRadians { 
    return self.angleInDegrees * (M_PI/180); 
}
- (NSString*) name {
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
                                  @"Tridecagon",   @"13",
                                  nil];
    
    return [polygonNames valueForKey:[[NSNumber numberWithInt:numberOfSides] stringValue]];
}
- (id) init {
    self = [super init];
    if (self) {
        [self initWithNumberOfSides:3];
    }
    return self;
}
- (id) initWithNumberOfSides: (int)sides {
    self = [super init];
    if (self) {
        self.minimumNumberOfSides = 3;
        self.maximumNumberOfSides = 13;
        self.numberOfSides = sides;
    }
    return self;
}
- (NSString*) description {
    return [NSString stringWithFormat:@"Hello, I am a %d-sided polygon (aka %@) with angles of %.2f (%f radians).",
            self.numberOfSides, self.name, self.angleInDegrees, self.angleInRadians];
}
- (void) dealloc {
    NSLog(@"Dealocating a %@ polygon.", self.name);
    [super dealloc];
}
@end
