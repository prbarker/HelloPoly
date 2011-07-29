//
//  PolygonShape.h
//  WhatATool
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
@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property(readonly) float angleInDegrees;
@property(readonly) float angleInRadians;
@property(readonly) NSString *name;

-(id)init;
-(id)initWithNumberOfSides: (int)sides andMinimumNumberOfSides: (int)minSides andMaximumNumberOfSides: (int)maxSides;
-(NSString *)description;
-(void)dealloc;
@end
