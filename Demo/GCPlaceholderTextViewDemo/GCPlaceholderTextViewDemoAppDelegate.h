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

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet GCPlaceholderTextViewDemoViewController *viewController;

@end
