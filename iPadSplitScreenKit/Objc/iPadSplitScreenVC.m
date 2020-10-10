//
//  iPadSplitScreenVC.m
//  iPadSplitScreenKit
//
//  Created by DevDragonLi on 27/9/2020.

#import "iPadSplitScreenVC.h"

#define kCHECKISFULLSCREENVALUE 100

@interface iPadSplitScreenVC ()

@property(nonatomic, assign, getter=isiPadfullScreenViewLoaded) BOOL iPadfullScreenViewLoaded;

@property(nonatomic, assign, getter=isiPadsmallScreenViewLoaded) BOOL iPadsmallScreenViewLoaded;

@property (nonatomic, assign) SplitScreenInterfaceType lastScreenInterfaceType;

@end

@implementation iPadSplitScreenVC

- (instancetype)init {
    if (self = [super init]) {
        [self split_updateCurrentInterfaceOrientation];
        self.lastScreenInterfaceType = SplitUnknown;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self split_updateViewLayoutDependenciesWithCurrentSize:self.view.frame.size];
}

#pragma mark ---iPad adapter functions

/// 小屏幕切换到大屏幕【处理逻辑】
- (void)ipadSmallToFullScreenConfigurations {
    
}

/// 大屏幕切换到小屏幕【处理逻辑】
- (void)ipadFullToSmallScreenConfigurations {
    
}

/// ipad 全屏展示
- (void)ipadFullScreen {
    NSString *assertMsg = [NSString stringWithFormat:@"%@【%@】",@"❌：Please implement `ipadFullScreen Function` With", NSStringFromClass([self class])];
    NSAssert(NO, assertMsg);
}
/// ipad 小屏幕展示
- (void)ipadSmallScreen {
    NSString *assertMsg = [NSString stringWithFormat:@"%@【%@】",@"❌：Please implement `ipadSmallScreen Function` With", NSStringFromClass([self class])];
    NSAssert(NO, assertMsg);
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    if (!self.isViewLoaded) {
        return;
    }
    
    [self split_updateViewLayoutDependenciesWithCurrentSize:size];
}

- (void)split_updateViewLayoutDependenciesWithCurrentSize:(CGSize)currentSize {
    [self split_updateCurrentInterfaceOrientation];
    [iPadSplitScreenStatusTool.tool setValue:[NSNumber numberWithFloat:currentSize.width] forKey:@"currentScreenWidth"];
    [self split_screenWithCurrentSize:currentSize];
}

- (void)split_updateCurrentInterfaceOrientation {
    iPadSplitScreenStatusTool.tool.updateCurrentInterfaceOrientation;
}

- (void)split_screenWithCurrentSize:(CGSize)currentSize {
    
    CGFloat fullWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat currentScreenWidth = currentSize.width;
    
    if(iPadSplitScreenStatusTool.tool.interfaceOrientationLandscape) {
        if (currentScreenWidth < (fullWidth * 0.40)) {
            [self split_handleDisplayElementsWithChangedType:SplitPadLandscapeThirdScreen];
        } else if (currentScreenWidth < fullWidth * 0.60) {
            [self split_handleDisplayElementsWithChangedType:SplitPadLandscapeHalfScreen];
        } else if (currentScreenWidth < (fullWidth * 0.80)) {
            [self split_handleDisplayElementsWithChangedType:SplitPadLandscapeTwoThirdScreen];
        } else if (currentScreenWidth == fullWidth) {
            [self split_handleDisplayElementsWithChangedType:SplitPadLandscapeFullScreen];
        }
    } else {
        if (currentScreenWidth < (fullWidth * 0.50)) {
            [self split_handleDisplayElementsWithChangedType:SplitPadPortraitThirdScreen];
        } else if (currentScreenWidth < fullWidth * 0.70) {
            [self split_handleDisplayElementsWithChangedType:SplitPadPortraitTwoThirdScreen];
        } else if (currentScreenWidth == fullWidth) {
            [self split_handleDisplayElementsWithChangedType:SplitPadPortraitFullScreen];
        }
    }
}

- (void)split_handleDisplayElementsWithChangedType:(SplitScreenInterfaceType)changedScreenInterfaceType {
    BOOL fullScreen = (changedScreenInterfaceType < kCHECKISFULLSCREENVALUE);
    [iPadSplitScreenStatusTool.tool setValue:[NSNumber numberWithBool:fullScreen] forKey:@"fullScreen"];
    
    [iPadSplitScreenStatusTool.tool setValue:[NSNumber numberWithInteger:changedScreenInterfaceType] forKey:@"currentScreenInterfaceType"];
    
    if (self.lastScreenInterfaceType == SplitUnknown) {
        [self split_configLastScreenType];
        if (SPLITISFULLSCREEN) {
            [self split_configScreenWithIsFull:YES];
        } else {
            [self split_configScreenWithIsFull:NO];
        }
        
        return;
    }
    BOOL isLastFullScreen = (self.lastScreenInterfaceType < kCHECKISFULLSCREENVALUE);
    [self split_configLastScreenType];
    if (isLastFullScreen == SPLITISFULLSCREEN) {
        return;
    }
    
    if (isLastFullScreen) {
        [self ipadFullToSmallScreenConfigurations];
        if (!self.isiPadsmallScreenViewLoaded) {
            [self split_configScreenWithIsFull:NO];
        }
    } else {
        [self ipadSmallToFullScreenConfigurations];
        if (!self.iPadfullScreenViewLoaded) {
            [self split_configScreenWithIsFull:YES];
        }
    }
}

- (void)split_configScreenWithIsFull:(BOOL)isFullScreen {
    if (isFullScreen) {
        [self ipadFullScreen];
        self.iPadfullScreenViewLoaded = YES;
    } else {
        [self ipadSmallScreen];
        self.iPadsmallScreenViewLoaded = YES;
    }
}

- (void)split_configLastScreenType {
    self.lastScreenInterfaceType = iPadSplitScreenStatusTool.tool.currentScreenInterfaceType;
}

@end
