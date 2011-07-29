//
//  HelloPolyAppDelegate.h
//  HelloPoly
//
//  Created by Mike Barker on 10/27/09.
//  Copyright Michael Barker, Consultant 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Controller.h"

@interface HelloPolyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IBOutlet Controller *controller;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
- (void)applicationDidFinishLaunching:(UIApplication *)application;
- (void)applicationWillTerminate:(UIApplication *)application;
@end

