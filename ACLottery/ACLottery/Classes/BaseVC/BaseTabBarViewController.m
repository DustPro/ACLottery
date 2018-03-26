//
//  BaseTabBarViewController.m
//  ACLottery
//
//  Created by aochen on 26/03/2018.
//  Copyright © 2018 aoChen. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNavViewController.h"
#import "MainViewController.h"
#import "BuyViewController.h"
#import "LotteryViewController.h"
#import "MeViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
+ (instancetype)tabbar
{
    BaseTabBarViewController *tab = [[BaseTabBarViewController alloc] initWithControllers];
    return tab;
}

- (instancetype)initWithControllers
{
    if (self = [super init])
    {
        [self addChildVC:[[MainViewController alloc] init] image:@"tab_home_nor" seletedImage:@"tab_home_press" title:@"大厅"];
        [self addChildVC:[[BuyViewController alloc] init] image:@"tab_assit_nor"  seletedImage:@"tab_assit_press"  title:@"购买"];
        [self addChildVC:[[LotteryViewController alloc] init] image:@"tab_mes_nor"  seletedImage:@"tab_mes_press"  title:@"开奖"];
        [self addChildVC:[[MeViewController alloc] init] image:@"tab_me_nor"  seletedImage:@"tab_me_press"  title:@"我的"];
    }
    return self;
}


- (void)addChildVC:(UIViewController *)childVC image:(NSString *)image seletedImage:(NSString *)selectedImage title:(NSString *)title
{
    // 设置tabbar相关属性
    childVC.title = title;
    [childVC.tabBarItem setImage:[[self scaleImage:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childVC.tabBarItem setSelectedImage:[[self scaleImage:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [childVC.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [childVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    
    // 包装导航条
    BaseNavViewController *nav = [[BaseNavViewController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

- (UIImage *)scaleImage:(NSString *)imageName
{
    UIImage *img = [UIImage imageNamed:imageName];
    CGFloat width = 23.6;
    
    CGSize origin = img.size;
    origin.height = width / origin.width * origin.height;
    origin.width = width;
    
    UIGraphicsBeginImageContextWithOptions(origin, NO, [UIScreen mainScreen].scale);
    [img drawInRect:CGRectMake(0, 0, origin.width, origin.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
