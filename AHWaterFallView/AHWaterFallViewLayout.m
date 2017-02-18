//
//  AHWaterFallViewLayout.m
//  AHWaterFallViewDemo
//
//  Created by Aalen on 2017/2/18.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "AHWaterFallViewLayout.h"

#import "AHWaterFallViewItem.h"

static const NSUInteger kColumns = 3;
static const CGFloat kSideGap = 8.0;
static const CGFloat kItemGap = 4.0;

@implementation AHWaterFallViewLayout

- (instancetype)init
{
	if(self = [super init])
	{
		
	}
	return self;
}

- (void)prepareLayout
{
	[super prepareLayout];
}

- (CGSize)collectionViewContentSize
{
	CGSize size = self.collectionView.bounds.size;
	CGFloat columnOneHeight = kSideGap, columnTwoHeight = kSideGap, columnThreeHeight = kSideGap;
//	NSUInteger index = 0;
	for(AHWaterFallViewItem *item in _data)
	{
		CGFloat height = item.size.height;
		if(columnOneHeight <= columnTwoHeight && columnOneHeight <= columnThreeHeight)
		{
			item.center = CGPointMake(kSideGap + item.size.width * 0.5, columnOneHeight + item.size.height * 0.5);
			columnOneHeight += height + kSideGap;
		}
		else if(columnTwoHeight < columnOneHeight && columnTwoHeight <= columnThreeHeight)
		{
			item.center = CGPointMake(2 * kSideGap + item.size.width + item.size.width * 0.5, columnTwoHeight + item.size.height * 0.5);
			columnTwoHeight += height + kSideGap;
		}
		else// if(columnThreeHeight < columnOneHeight && columnThreeHeight < columnTwoHeight)
		{
			item.center = CGPointMake(3 * kSideGap + 2 * item.size.width + item.size.width * 0.5, columnThreeHeight + item.size.height * 0.5);
			columnThreeHeight += height + kSideGap;
		}
//		index++;
	}
	size.height = columnOneHeight < columnTwoHeight ? (columnTwoHeight < columnThreeHeight ? columnThreeHeight : columnTwoHeight) : (columnOneHeight < columnThreeHeight ? columnThreeHeight : columnOneHeight);
	return size;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
	NSMutableArray *attributes = [[NSMutableArray alloc] initWithCapacity: _data.count];
	for(NSUInteger i = 0;i < _data.count;i++)
	{
		[attributes addObject: [self layoutAttributesForItemAtIndexPath: [NSIndexPath indexPathForRow: i inSection: 0]]];
	}
	return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
	AHWaterFallViewItem *item = _data[indexPath.row];
	UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath: indexPath];
	attributes.size = item.size;
	attributes.center = item.center;
	return attributes;
}
/*
- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
	return nil;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
	return nil;
}
*/
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
	return YES;
}

@end
