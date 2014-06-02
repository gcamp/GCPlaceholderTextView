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

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEditing:) name:UITextViewTextDidBeginEditingNotification object:self];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    
	self.realTextColor    = self.textColor;
	self.placeholderColor = [UIColor lightGrayColor];
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
	NSString *text = super.text;
	if ([text isEqualToString:self.placeholder]) {
        return @"";
    };
	return text;
}

- (void)setText:(NSString *)text {
	if (([text isEqualToString:@""] || text == nil) && ![self isFirstResponder]) {
		super.text = self.placeholder;
	}
	else {
		super.text = text;
	}

	if ([super.text isEqualToString:self.placeholder] || super.text == nil) {
		self.textColor = self.placeholderColor;
	}
	else {
		self.textColor = self.realTextColor;
	}
}

- (NSString *)realText {
	return super.text;
}

- (void)beginEditing:(NSNotification *)notification {
	if ([self.realText isEqualToString:self.placeholder]) {
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
