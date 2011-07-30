//
//  Controller.m
//
//  Created by Mike Barker on 10/27/09.
//  Copyright 2009 Consultant. All rights reserved.
//

#import "Controller.h"

@implementation Controller
@synthesize polyShape;
- (void) awakeFromNib {
    NSLog(@"Controller awakeFromNib");
    
    // Initialize the polyShape
    [self restoreSettings];
    
    // Get numberOfSides from user defaults
    if ((polyShape.numberOfSides <= polyShape.minimumNumberOfSides) &&
        (polyShape.numberOfSides >= polyShape.maximumNumberOfSides)) {
        polyShape.numberOfSides = polyShape.minimumNumberOfSides;
    }
    
    NSLog(@"My polygon: %@", polyShape);
    
    // Update the view
    [self updateInterface];
}
- (void) updateInterface {
    
    if ( polyShape.numberOfSides <= polyShape.minimumNumberOfSides) {
        decreaseButton.enabled = NO;
    } else {
        decreaseButton.enabled = YES;
    }
    
    if (polyShape.numberOfSides >= polyShape.maximumNumberOfSides) {
        increaseButton.enabled = NO;
    } else {
        increaseButton.enabled = YES;
    }

    numberOfSidesLabel.text = [NSString stringWithFormat: @"%d",polyShape.numberOfSides];
    nameLabel.text = polyShape.name;
    [polyView setNeedsDisplay];
    
}
- (void) saveSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setInteger:polyShape.numberOfSides forKey:@"polyShape.numberOfSides"];
    [defaults setInteger:polyOutlineStyle.selectedSegmentIndex forKey:@"polyOutlineStyle.selectedSegmentIndex"];
    [defaults setInteger:polyChangeSides.selectedSegmentIndex forKey:@"polyChangeSides.selectedSegmentIndex"];

}
- (void) restoreSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    polyShape.numberOfSides = [defaults integerForKey:@"polyShape.numberOfSides"];
    polyOutlineStyle.selectedSegmentIndex = [defaults integerForKey:@"polyOutlineStyle.selectedSegmentIndex"];
    polyChangeSides.selectedSegmentIndex  = [defaults integerForKey:@"polyChangeSides.selectedSegmentIndex"];
}
- (IBAction) decrease:(id)sender {
    NSLog(@"Decrease was pressed...");
    polyShape.numberOfSides = polyShape.numberOfSides - 1;
    [self updateInterface];
}
- (IBAction) increase:(id)sender {
    NSLog(@"Increase was pressed...");
    polyShape.numberOfSides = polyShape.numberOfSides + 1;
    [self updateInterface];
}
- (IBAction) advancedOptionsChanged:(id)sender {
    
    CGRect polyFrame = polyView.frame;
    CGRect optionsFrame = optionsView.frame;
    float optionsViewAlpha;
    int polyViewOffset;
    
    // Set optionsView alpha and polyView's offset
    // used to show or hide the advanced options.
    if ([(UISwitch*)sender isOn]) {
        optionsViewAlpha = 1.0;
        polyViewOffset = optionsFrame.size.height + 10;
    } else {
        optionsViewAlpha = 0.0;
        polyViewOffset = (optionsFrame.size.height + 10) * -1;
    }

    // assume polygonView and optionsView
    [UIView beginAnimations:@"advancedAnimations" context:nil];
    [UIView setAnimationDuration:0.3];
    
    // make optionsView visible (alpha is currently 0.0) 
    optionsView.alpha = optionsViewAlpha;
    
    // move the polygonView down 
    polyFrame.origin.y += polyViewOffset; 
    polyView.frame = polyFrame;
    
    // Run the animation
    [UIView commitAnimations];
}
- (IBAction) polyChangeSidesChanged:(id)sender {
    NSLog(@"polyChangeSidesChanged, selected segment is: %d",polyChangeSides.selectedSegmentIndex);
    if (polyChangeSides.selectedSegmentIndex == 0) {
        increaseButton.enabled = YES;
        increaseButton.hidden = NO;
        decreaseButton.enabled = YES;
        decreaseButton.hidden = NO;
        sidesSlider.enabled = NO;
        sidesSlider.hidden = YES;
    } else {
        increaseButton.enabled = NO;
        increaseButton.hidden = YES;
        decreaseButton.enabled = NO;
        decreaseButton.hidden = YES;
        sidesSlider.enabled = YES;
        sidesSlider.hidden = NO;
        [sidesSlider setValue:polyShape.numberOfSides animated:YES];
    }
    [polyView setNeedsDisplay];    

}
- (IBAction) polyOutlineStyleChanged:(id)sender {
    NSLog(@"polyOutlineStyleChanged, selected segment is: %d",polyOutlineStyle.selectedSegmentIndex);
    polyView.lineDash = (polyOutlineStyle.selectedSegmentIndex == 0) ? NO : YES;
    [polyView setNeedsDisplay];    
}
- (IBAction) sidesSliderChanged:(id)sender {
    polyShape.numberOfSides = sidesSlider.value;
    [self updateInterface];
}
@end
