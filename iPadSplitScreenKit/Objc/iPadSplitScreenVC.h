//
//  iPadSplitScreenVC.h
//  iPadSplitScreenKit
//
//  Created by DevDragonLi on 27/9/2020.

#import <UIKit/UIKit.h>
#import <iPadSplitScreenKit/iPadSplitScreenStatusTool.h>

@interface iPadSplitScreenVC : UIViewController

#pragma mark ---iPad adapter Main function

/// 当前界面共同视图/逻辑添加此处【仅调用一次】
/// 【原：viewDidLoad公用/调通UI/逻辑迁移至此函数】
/// 【Example：界面的CollectionView为大小屏的通用视图，则此处添加，不需要ipadFullScreen和ipadSmallScreen函数处理】
- (void)ipadCommonSetup;

/// iPad 全屏模式【仅调用一次】
- (void)ipadFullScreen;

/// iPad 小屏模式【仅调用一次】
- (void)ipadSmallScreen;

/// 小屏幕切换到大屏幕【处理逻辑】
- (void)ipadSmallToFullScreenConfigurations;

/// 大屏幕切换到小屏幕【处理逻辑】
- (void)ipadFullToSmallScreenConfigurations;

/// 每次屏幕改变均调用此函数【分屏操作，横竖屏改变，子类控制器可通过此函数获取时机】
/// @param changeType changeType
/// @param currentSize currentSize 
- (void)ipadInterfaceOrientationChanged:(ZDInterfaceChangeType)changeType
                            currentSize:(CGSize)currentSize;

@end

