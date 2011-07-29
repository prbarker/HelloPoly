//
//  Controller.h
//
//  Created by Mike Barker on 10/27/09.
//  Copyright 2009 Consultant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel  *numberOfSidesLabel;
    IBOutlet UILabel *angleLabel;
    IBOutlet UILabel *maximumSidesLabel;
    IBOutlet UILabel *minimumSidesLabel;
    IBOutlet UILabel *nameLabel;
    IBOutlet PolygonShape *polyShape;
}
- (void)updateInterface;
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
- (void)awakeFromNib;
@end
