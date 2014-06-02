//
//  GCPlaceholderTextView.m
//  GCLibrary
//
//  Created by Guillaume Campagna on 10-11-16.
//  Copyright 2010 LittleKiwi. All rights reserved.
//

#import "GCPlaceholderTextView.h"

@interface GCPlaceholderTextView ()

@property (weak, nonatomic, readonly) NSString *realText;

- (void)beginEditing:(NSNotification *)notification;
- (void)endEditing:(NSNotification *)notification;

@end

@implementation GCPlaceholderTextView

#pragma mark
#pragma mark - Initialization

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];

	_placeholder      = nil;
	_placeholderColor = nil;
	_realTextColor    = nil;
}

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		[self setup];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer {
    if((self = [super initWithFrame:frame textContainer:textContainer])) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if((self = [super initWithCoder:aDecoder])) {
        [self setup];
    }
    return self;
}

- (id)init {
    if((self = [super init])) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEditing:) name:UITextViewTextDidBeginEditingNotification object:self];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    
	self.realTextColor    = self.textColor;
	self.placeholderColor = ((self.realTextColor == nil)?[UIColor colorWithWhite:0.0 alpha:0.3]:[self.realTextColor colorWithAlphaComponent:0.3]);
}

#pragma mark
#pragma mark - Setter/Getters

- (void)setPlaceholder:(NSString *)aPlaceholder {
	if ([self.realText isEqualToString:_placeholder] && ![self isFirstResponder]) {
		self.text = aPlaceholder;
	}
	if (aPlaceholder != _placeholder) {
		_placeholder = aPlaceholder;
	}

	[self endEditing:nil];
}

- (void)setPlaceholderColor:(UIColor *)aPlaceholderColor {
	_placeholderColor = aPlaceholderColor;

	if ([super.text isEqualToString:self.placeholder]) {
		self.textColor = self.placeholderColor;
	}
}

- (NSString *)text {
	if ([self.realText isEqualToString:self.placeholder]) {
        return @"";
    };
	return self.realText;
}

- (void)setText:(NSString *)text {
	if (([text isEqualToString:@""] || text == nil) && ![self isFirstResponder]) {
		super.text = self.placeholder;
        self.textColor = self.placeholderColor;
	}
	else {
		super.text = text;
        self.textColor = self.realTextColor;
	}
}

- (NSString *)realText {
	return super.text;
}

- (void)beginEditing:(NSNotification *)notification {
	if ([self.realText isEqualToString:self.placeholder] && [self.textColor isEqual:self.placeholderColor]) {
		super.text     = nil;
		self.textColor = self.realTextColor;
	}
}

- (void)endEditing:(NSNotification *)notification {
	if ([self.realText isEqualToString:@""] || self.realText == nil) {
		super.text     = self.placeholder;
		self.textColor = self.placeholderColor;
	}
}

- (void)setTextColor:(UIColor *)textColor {
	if ([self.realText isEqualToString:self.placeholder]) {
		if ([textColor isEqual:self.placeholderColor]) {
			super.textColor = textColor;
		}
		else {
			self.realTextColor = textColor;
		}
	}
	else {
		self.realTextColor = textColor;
		super.textColor = textColor;
	}
}

@end
