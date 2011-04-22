//
//  GCPlaceholderTextViewDemoAppDelegate.h
//  GCPlaceholderTextViewDemo
//
//  Created by Guillaume Campagna on 11-04-22.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCPlaceholderTextViewDemoViewController;

@interface GCPlaceholderTextViewDemoAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GCPlaceholderTextViewDemoViewController *viewController;

@end
