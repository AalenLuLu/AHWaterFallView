//
//  AHWaterFallViewProxy.m
//  AHWaterFallViewDemo
//
//  Created by Aalen on 2017/2/18.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "AHWaterFallViewProxy.h"

#import "AHWaterFallViewLayout.h"
#import "AHWaterFallViewItem.h"
#import "DemoCell.h"

static NSString * const kCellIdentifer = @"cell";

@interface AHWaterFallViewProxy () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) AHWaterFallViewLayout *layout;
@property (strong, nonatomic) NSMutableArray<AHWaterFallViewItem *> *data;

@end

@implementation AHWaterFallViewProxy

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
	if(self = [super init])
	{
		_collectionView = collectionView;
		
		_layout = [[AHWaterFallViewLayout alloc] init];
		_collectionView.collectionViewLayout = _layout;
		_collectionView.dataSource = self;
		_collectionView.delegate = self;
		
		[_collectionView registerClass: [DemoCell class] forCellWithReuseIdentifier: kCellIdentifer];
	}
	return self;
}

- (void)setDisplayData:(NSArray<AHWaterFallViewItem *> *)data
{
	if(nil == _data)
	{
		_data = [[NSMutableArray alloc] initWithCapacity: data.count];
	}
	else
	{
		[_data removeAllObjects];
	}
	[_data addObjectsFromArray: data];
	_layout.data = _data;
}

#pragma mark data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return _data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	AHWaterFallViewItem *item = _data[indexPath.row];
	DemoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: kCellIdentifer forIndexPath: indexPath];
	[cell setDisplayData: item];
	return cell;
}

#pragma mark delegate

@end
