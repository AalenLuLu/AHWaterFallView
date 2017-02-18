//
//  AHWaterFallViewProxy.h
//  AHWaterFallViewDemo
//
//  Created by Aalen on 2017/2/18.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AHWaterFallViewItem;

@interface AHWaterFallViewProxy : NSObject

@property (strong, readonly, nonatomic) UICollectionView *collectionView;

- (instancetype)initWithCollectionView: (UICollectionView *)collectionView;

- (void)setDisplayData: (NSArray<AHWaterFallViewItem *> *)data;

@end
