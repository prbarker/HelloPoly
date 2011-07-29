//
//  PolygonView.h
//
//  Created by Mike Barker on 10/28/09.
//  Copyright 2009 Consultant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface PolygonView : UIView {
    IBOutlet PolygonShape *polyShape;
    int numberOfSides;
    BOOL lineDash;
}
@property int numberOfSides;
@property BOOL  lineDash;

- (void)awakeFromNib;
- (void)drawRect:(CGRect)rect;

@end
