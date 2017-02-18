//
//  DemoCell.m
//  AHWaterFallViewDemo
//
//  Created by Aalen on 2017/2/18.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "DemoCell.h"

#import "AHWaterFallViewItem.h"

@interface DemoCell ()

@property (strong, nonatomic) UILabel *label;

@end

@implementation DemoCell

- (instancetype)initWithFrame:(CGRect)frame
{
	if(self = [super initWithFrame:frame])
	{
		self.layer.borderWidth = 0.5;
		self.layer.borderColor = [UIColor blackColor].CGColor;
		self.contentView.layer.backgroundColor = [UIColor yellowColor].CGColor;
		_label = [[UILabel alloc] initWithFrame: self.contentView.bounds];
		_label.layer.borderWidth = 0.5;
		_label.textAlignment = NSTextAlignmentCenter;
		[self.contentView addSubview: _label];
	}
	return self;
}

- (void)setDisplayData:(AHWaterFallViewItem *)data
{
	_label.text = [[NSString alloc] initWithFormat: @"%ld", data.value];
	_label.frame = CGRectMake(0, 0, data.size.width, data.size.height);
}

@end
