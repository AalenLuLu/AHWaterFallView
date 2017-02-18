//
//  AHWaterFallViewItem.m
//  AHWaterFallViewDemo
//
//  Created by Aalen on 2017/2/18.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "AHWaterFallViewItem.h"

@implementation AHWaterFallViewItem

- (instancetype)init
{
	if(self = [super init])
	{
		CGFloat width = ([UIScreen mainScreen].bounds.size.width - 8.0 * 4) / 3;
		CGFloat height = 100.0 + ((random() % 80) * (random() % 2 * (-1)));
		_size = CGSizeMake(width, height);
	}
	return self;
}

@end
