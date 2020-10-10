//
//  iPadSplitScreenVC.m
//  iPadSplitScreenKit
//
//  Created by DevDragonLi on 27/9/2020.

/*
 iPad 屏幕横竖屏演算细节：
 横屏
 1/3： < 0.40
 1/2： 0.40 < 0.6
 2/3：0.6  < 1.0
 竖屏
 小：0.5
 大：0.7
 横屏数据
 375  678    981   1366  pro
 0.274  0.496  0.71 1.00
 
 320     507     694       1024  mini
 0.3125   0.495   0.677       1.00
 
 竖屏
 320     438   768  mini
 0.41    0.57  1.00
 */

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
    [self split_screenWithCurrentSize:currentSize];
}

- (void)split_updateCurrentInterfaceOrientation {
    NSNumber *statusBarOrientationValue = [NSNumber numberWithBool:UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)];
    [iPadSplitScreenStatusTool.tool setValue:statusBarOrientationValue forKey:@"interfaceOrientationLandscape"];
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
        if (iPadSplitScreenStatusTool.tool.fullScreen) {
            [self ipadFullScreen];
            self.iPadfullScreenViewLoaded = YES;
        } else {
            [self ipadSmallScreen];
            self.iPadsmallScreenViewLoaded = YES;
        }
        
        return;
    }
    BOOL isLastFullScreen = (self.lastScreenInterfaceType < kCHECKISFULLSCREENVALUE);
    [self split_configLastScreenType];
    if (isLastFullScreen == iPadSplitScreenStatusTool.tool.fullScreen) {
        return;
    }
    
    if (isLastFullScreen) {
        [self ipadFullToSmallScreenConfigurations];
        if (!self.isiPadsmallScreenViewLoaded) {
            [self ipadSmallScreen];
            self.iPadsmallScreenViewLoaded = YES;
        }
    } else {
        [self ipadSmallToFullScreenConfigurations];
        if (!self.iPadfullScreenViewLoaded) {
            [self ipadFullScreen];
            self.iPadfullScreenViewLoaded = YES;
        }
    }
}

- (void)split_configLastScreenType {
    self.lastScreenInterfaceType = iPadSplitScreenStatusTool.tool.currentScreenInterfaceType;
}

@end
