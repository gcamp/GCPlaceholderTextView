//
//  GCPlaceholderTextViewDemoViewController.m
//  GCPlaceholderTextViewDemo
//
//  Created by Guillaume Campagna on 11-04-22.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import "GCPlaceholderTextViewDemoViewController.h"

@implementation GCPlaceholderTextViewDemoViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.textView.placeholderColor = UIColor.redColor;
	self.textView.placeholder      = NSLocalizedString(@"This is a placeholder",);
}

- (IBAction)finish:(id)sender {
	[self.textView resignFirstResponder];
}

- (IBAction)refreshText:(id)sender {
	self.textView.text = @"";
}

@end
