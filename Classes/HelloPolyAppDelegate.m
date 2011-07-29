//
//  HelloPolyAppDelegate.m
//  HelloPoly
//
//  Created by Mike Barker on 10/27/09.
//  Copyright Michael Barker, Consultant 2009. All rights reserved.
//

#import "HelloPolyAppDelegate.h"

@implementation HelloPolyAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
