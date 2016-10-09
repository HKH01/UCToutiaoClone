//
//  UCTTabBarController.m
//  UCToutiaoClone
//
//  Created by lzy on 16/10/8.
//  Copyright © 2016年 lzy. All rights reserved.
//

#import "UCTTabBarController.h"
#import "UCTHomeTabBarItem.h"
#import "UCTSubscribeTabBarItem.h"
#import "UCTVideoTabBarItem.h"
#import "UCTMineTabBarItem.h"
#import "UIView+Utils.h"
#import "Masonry.h"

@interface UCTTabBarController ()
@property (strong, nonatomic) UIView *customTabBar;
@property (strong, nonatomic) NSMutableArray *tabBarItemList;
@end

@implementation UCTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect tabBarRect = self.tabBar.frame;
    [self.tabBar removeFromSuperview];
    
    self.customTabBar = [[UIView alloc] init];
    [_customTabBar setBackgroundColor:[UIColor whiteColor]];
    [_customTabBar setFrame:tabBarRect];
    [self.view addSubview:_customTabBar];
    
    //item size由item自己决定
    UCTHomeTabBarItem *homeTabBarItem = [[UCTHomeTabBarItem alloc] init];
    UCTSubscribeTabBarItem *subscribeTabBarItem = [[UCTSubscribeTabBarItem alloc] init];
    UCTVideoTabBarItem *videoTabBarItem = [[UCTVideoTabBarItem alloc] init];
    UCTMineTabBarItem *mineTabBarItem = [[UCTMineTabBarItem alloc] init];
//    UCTHomeTabBarItem *homeTabBarItem3 = [[UCTHomeTabBarItem alloc] init];
    [self.tabBarItemList addObject:homeTabBarItem];
    [self.tabBarItemList addObject:subscribeTabBarItem];
    [self.tabBarItemList addObject:videoTabBarItem];
    [self.tabBarItemList addObject:mineTabBarItem];
//    [self.tabBarItemList addObject:homeTabBarItem2];
//    [self.tabBarItemList addObject:homeTabBarItem3];
    
    
    CGFloat viewWidth = self.view.bounds.size.width;
    for (UCTAnimTabBarItem *barItem in _tabBarItemList) {
//        [barItem updateHeight:_customTabBar.frame.size.height];
//        CGPoint itemCenter = [self centerOfTabBarItem:barItem];
        CGFloat itemCenterX = [self centerXOfTabBarItem:barItem];
//        [barItem setCenter:itemCenter];
        [_customTabBar addSubview:barItem];
        [barItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(_customTabBar);
            make.centerY.equalTo(_customTabBar);
            make.centerX.equalTo(@(itemCenterX - viewWidth/2));
        }];
    }
}

- (CGPoint)centerOfTabBarItem:(UCTAnimTabBarItem *)item {
    NSUInteger index = [_tabBarItemList indexOfObject:item];
    CGFloat drawerWidth = self.view.bounds.size.width / _tabBarItemList.count;
    CGFloat centerX = (index+0.5) * drawerWidth;
    return CGPointMake(centerX, _customTabBar.frame.size.height/2);
}

- (CGFloat)centerXOfTabBarItem:(UCTAnimTabBarItem *)item {
    NSUInteger index = [_tabBarItemList indexOfObject:item];
    CGFloat drawerWidth = self.view.bounds.size.width / _tabBarItemList.count;
    CGFloat centerX = (index+0.5) * drawerWidth;
    return centerX;
}

- (NSMutableArray *)tabBarItemList {
    if (nil == _tabBarItemList) {
        _tabBarItemList = [NSMutableArray array];
    }
    return _tabBarItemList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
