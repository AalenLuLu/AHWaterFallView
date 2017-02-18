//
//  DemoModel.m
//  AHWaterFallViewDemo
//
//  Created by Aalen on 2017/2/18.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "DemoModel.h"

#import "AHWaterFallViewItem.h"

@implementation DemoModel

- (NSArray<AHWaterFallViewItem *> *)getDisplayData
{
	NSMutableArray *array = [[NSMutableArray alloc] init];
	for(int i = 0;i < 50;i++)
	{
		AHWaterFallViewItem *item = [[AHWaterFallViewItem alloc] init];
		item.value = i;
		[array addObject: item];
	}
	return array;
}

@end
