//
//  GCPlaceholderTextView.h
//  GCLibrary
//
//  Created by Guillaume Campagna on 10-11-16.
//  Copyright 2010 LittleKiwi. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface GCPlaceholderTextView : UITextView 

@property(nonatomic, strong) IBInspectable NSString *placeholder;

@property (nonatomic, strong) IBInspectable UIColor *realTextColor; //UI_APPEARANCE_SELECTOR
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor; //UI_APPEARANCE_SELECTOR

// I don't know what's 'UI_APPEARANCE_SELECTOR' means,
// but if i don't remove it,
// `realTextColor` and `placeholderColor` property won't show in the Storyboard;

@end
