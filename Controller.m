//
//  Controller.m
//
//  Created by Mike Barker on 10/27/09.
//  Copyright 2009 Consultant. All rights reserved.
//

#import "Controller.h"

@implementation Controller
- (void)updateInterface {
    
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

    if (polyShape.numberOfSides != numberOfSidesLabel.text.integerValue) {
        numberOfSidesLabel.text = [NSString stringWithFormat: @"%d",polyShape.numberOfSides];
        nameLabel.text = polyShape.name;
        angleLabel.text = [NSString stringWithFormat: @"%.0f degres", polyShape.angleInDegrees];
    }


}
- (IBAction)decrease:(id)sender {
    NSLog(@"Decrease was pressed...");
    polyShape.numberOfSides = polyShape.numberOfSides - 1;
    [self updateInterface];
}

- (IBAction)increase:(id)sender {
    NSLog(@"Increase was pressed...");
    polyShape.numberOfSides = polyShape.numberOfSides + 1;
    [self updateInterface];
}
- (void)awakeFromNib {
    polyShape.minimumNumberOfSides = 3;
    polyShape.maximumNumberOfSides = 12;
    polyShape.numberOfSides = numberOfSidesLabel.text.integerValue;
    [self updateInterface];
    NSLog(@"My polygon: %@", polyShape);
}

@end
