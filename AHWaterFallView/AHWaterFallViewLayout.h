//
//  AHWaterFallViewLayout.h
//  AHWaterFallViewDemo
//
//  Created by Aalen on 2017/2/18.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AHWaterFallViewItem;

@interface AHWaterFallViewLayout : UICollectionViewLayout

@property (strong, nonatomic) NSArray<AHWaterFallViewItem *> *data;

@end
