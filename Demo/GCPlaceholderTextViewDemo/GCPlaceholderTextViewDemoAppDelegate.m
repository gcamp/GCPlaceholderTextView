//
//  GCPlaceholderTextViewDemoAppDelegate.m
//  GCPlaceholderTextViewDemo
//
//  Created by Guillaume Campagna on 11-04-22.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import "GCPlaceholderTextViewDemoAppDelegate.h"

#import "GCPlaceholderTextViewDemoViewController.h"

@implementation GCPlaceholderTextViewDemoAppDelegate

@synthesize window=_window;
@synthesize viewController=_viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
