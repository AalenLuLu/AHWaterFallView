//
//  ViewController.m
//  AHWaterFallViewDemo
//
//  Created by Aalen on 2017/2/18.
//  Copyright © 2017年 Aalen. All rights reserved.
//

#import "ViewController.h"

#import "AHWaterFallViewProxy.h"
#import "DemoModel.h"

@interface ViewController ()

@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) AHWaterFallViewProxy *proxy;
@property (strong, nonatomic) DemoModel *model;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.view addSubview: self.collectionView];
	_model = [[DemoModel alloc] init];
	_proxy = [[AHWaterFallViewProxy alloc] initWithCollectionView: _collectionView];
	[_proxy setDisplayData: [_model getDisplayData]];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (UICollectionView *)collectionView
{
	if(nil == _collectionView)
	{
		_collectionView = [[UICollectionView alloc] initWithFrame: self.view.bounds collectionViewLayout: [[UICollectionViewLayout alloc] init]];
		_collectionView.backgroundColor = [UIColor whiteColor];
	}
	return _collectionView;
}

@end
