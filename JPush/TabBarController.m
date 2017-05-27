//
//  TabBarController.m
//  极光IM测试
//
//  Created by Mac on 16/8/13.
//  Copyright © 2016年 yhb. All rights reserved.
//

#import "TabBarController.h"
#import "FriendListVC.h"
#import "ConversationLitsVC.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    FriendListVC *v1=[FriendListVC new];
    ConversationLitsVC *v2=[ConversationLitsVC new];
    [self setTabBarWithVC:v1 andTitle:@"好友列表" andNormalImage:nil andSelectedImage:nil];
    [self setTabBarWithVC:v2 andTitle:@"消息列表" andNormalImage:nil andSelectedImage:nil];
}


#pragma mark ---自定义标签栏
-(void)setTabBarWithVC:(UIViewController *)vc
                                andTitle:(NSString *)title
        andNormalImage:(UIImage *)n_image
      andSelectedImage:(UIImage *)s_image
{
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    vc.tabBarItem.title=title;
    vc.title=title;
    vc.tabBarItem.image=[n_image  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage=[s_image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}

//统一标签栏样式
+(void)initialize{
    
    UITabBarItem *tab=[UITabBarItem appearance];
    //mutableCopy将不可变数组变为可变数组
    
    //选中前字体和颜色
    NSMutableDictionary *norlDic=@{}.mutableCopy;
    norlDic[NSFontAttributeName]=[UIFont systemFontOfSize:10];
    norlDic[NSForegroundColorAttributeName]=[UIColor grayColor];
    [tab setTitleTextAttributes:norlDic forState:UIControlStateDisabled];
    
    //选中后字体和颜色
    NSMutableDictionary *selectedDic=@{}.mutableCopy;
    selectedDic[NSFontAttributeName]=[UIFont systemFontOfSize:10];
    selectedDic[NSForegroundColorAttributeName]=[UIColor colorWithRed:0.33 green:0.79 blue:0.76 alpha:1];
    [tab setTitleTextAttributes:selectedDic forState:UIControlStateSelected];
    
    //导航栏字体和颜色
    NSMutableDictionary *navDic=@{}.mutableCopy;
    navDic[NSFontAttributeName]=[UIFont systemFontOfSize:18];
    navDic[NSForegroundColorAttributeName]=[UIColor whiteColor];
    [[UINavigationBar appearance]setTitleTextAttributes:navDic];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0.33 green:0.79 blue:0.76 alpha:1]];
    //设置标签栏颜色
    [[UITabBar appearance]setBarTintColor:[UIColor whiteColor]];
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
