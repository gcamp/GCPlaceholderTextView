//
//  GCPlaceholderTextViewDemoViewController.h
//  GCPlaceholderTextViewDemo
//
//  Created by Guillaume Campagna on 11-04-22.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCPlaceholderTextView.h"

@interface GCPlaceholderTextViewDemoViewController : UIViewController 

@property (nonatomic, strong) IBOutlet GCPlaceholderTextView *textView;

- (IBAction)finish:(id)sender;
- (IBAction)refreshText:(id)sender;

@end
