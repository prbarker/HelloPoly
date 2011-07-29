//
//  Controller.h
//
//  Created by Mike Barker on 10/27/09.
//  Copyright 2009 Consultant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"
#import "OptionsView.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel  *numberOfSidesLabel;
    IBOutlet UILabel  *angleLabel;
    IBOutlet UILabel  *maximumSidesLabel;
    IBOutlet UILabel  *minimumSidesLabel;
    IBOutlet UILabel  *nameLabel;
    IBOutlet UISwitch *advancedOptions;
    IBOutlet UISegmentedControl *polyChangeSides;
    IBOutlet UISegmentedControl *polyOutlineStyle;
    IBOutlet PolygonView *polyView;
    IBOutlet OptionsView *optionsView;
    IBOutlet PolygonShape *polyShape;
    IBOutlet UISlider *sidesSlider;
}
@property(readonly) PolygonShape *polyShape;

- (void) awakeFromNib;
- (void) updateInterface;
- (void) restoreSettings;
- (void) saveSettings;
- (IBAction) decrease:(id)sender;
- (IBAction) increase:(id)sender;
- (IBAction) advancedOptionsChanged:(id)sender;
- (IBAction) polyChangeSidesChanged:(id)sender;
- (IBAction) polyOutlineStyleChanged:(id)sender;
- (IBAction) sidesSliderChanged:(id)sender;

@end
