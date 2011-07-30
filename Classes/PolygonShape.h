//
//  PolygonShape.h
//
//  Created by Mike Barker on 10/27/09.
//  Copyright 2009 Michael Barker, Consultant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject {
    int numberOfSides;
    int minimumNumberOfSides;
    int maximumNumberOfSides;
}

@property(nonatomic) int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property(readonly) float angleInDegrees;
@property(readonly) float angleInRadians;
@property(readonly) NSString *name;

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;
- (id)init;
- (id)initWithNumberOfSides: (int)sides;
- (NSString *)description;
- (void)dealloc;

@end
