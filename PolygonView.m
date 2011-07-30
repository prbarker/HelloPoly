//
//  PolygonView.m
//
//  Created by Mike Barker on 10/28/09.
//  Copyright 2009 Consultant. All rights reserved.
//

#import "PolygonView.h"

@implementation PolygonView

@synthesize numberOfSides;
@synthesize lineDash;

- (void)awakeFromNib {
    NSLog(@"PolygonView awakeFromNib");
}
- (void)drawRect:(CGRect)rect {
    // Get the bounds of the parent view
    CGRect bounds = [self bounds];
    
    // Get the graphics context
	CGContextRef context = UIGraphicsGetCurrentContext();

    // Create a gradient to fill the view
    CGGradientRef myGradient;
    CGColorSpaceRef myColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 0.000, 0.000, 0.000, 1.000,   // Start color - black
                              1.000, 0.200, 0.000, 1.000 }; // End color - red
    
    myColorspace = CGColorSpaceCreateDeviceRGB();
    myGradient = CGGradientCreateWithColorComponents (myColorspace, components,
                                                      locations, num_locations);
    
    // Paint a linear gradiant across the whole view
    CGPoint myStartPoint, myEndPoint;
    myStartPoint.x = 0.0;
    myStartPoint.y = 0.0;
    myEndPoint.x = bounds.size.width;
    myEndPoint.y = 0.0;
    CGContextDrawLinearGradient (context, myGradient, myStartPoint, myEndPoint, 0);

    // Draw a black border aound the view
    [[UIColor blackColor] set];
    UIRectFrame(bounds);
    
    // Get the points for the polygon
    NSArray *points = [PolygonShape pointsForPolygonInRect:bounds numberOfSides:polyShape.numberOfSides];
    
    // Create the path to be drawn
    CGContextBeginPath(context);
    
    CGPoint point  = [[points objectAtIndex:0] CGPointValue];
    
    CGContextMoveToPoint(context, point.x, point.y);
    
    for (NSUInteger pointIndex = 1; pointIndex < points.count; pointIndex++) {
        point = [[points objectAtIndex:pointIndex] CGPointValue];
        CGContextAddLineToPoint(context, point.x, point.y);
    }
    
    CGContextClosePath(context);

    // Setup the colors to be used for drawing the polygon path
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0.8 green:0.6 blue:0.41 alpha:1.0] CGColor]);
    if (lineDash) {
        const CGFloat lengths[] = {10.0,5.0};
        CGContextSetLineDash(context, 3.0, lengths, 2);
    }
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithWhite:0.000 alpha:0.600] CGColor]);
    CGContextSetLineWidth(context, 4.0);
    
    // Draw the polygon with a stroke and fill into the view
    CGContextDrawPath(context,kCGPathFillStroke);
    
    // Release Gradient and Colorspace
    CGGradientRelease(myGradient);
    CGColorSpaceRelease(myColorspace);
    
}

@end
