//
//  ZDScreenStatusTool.m
//  
//
//  Created by DevDragonLi on 9/10/2020.
//

#import "iPadSplitScreenStatusTool.h"

NSString * _Nonnull const SplitScreenChangeNotification = @"kSplitScreenChangeNotification";


@interface iPadSplitScreenStatusTool ()

@property (nonatomic, assign, getter=isFullScreen) BOOL fullScreen;

@property (nonatomic, assign) BOOL interfaceOrientationLandscape;

@property (nonatomic, assign) SplitScreenInterfaceType currentScreenInterfaceType;

@property (nonatomic, assign) CGFloat currentScreenWidth;

@property (nonatomic, assign) CGFloat currentScreenHeight;

@end


@implementation iPadSplitScreenStatusTool

+ (instancetype)defaultool {
    static iPadSplitScreenStatusTool *tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc] init];
        [tool updateCurrentInterfaceOrientation];
    });
    return tool;
}

- (void)updateCurrentInterfaceOrientation {
    // 此方式仅限于iPad 机型判断横竖屏
    CGFloat fullWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat fullHeight = UIScreen.mainScreen.bounds.size.height;
    self.interfaceOrientationLandscape = fullWidth > fullHeight;
}

- (void)updateCurrentInterfaceSize:(CGSize)currentsize {
    if (CGSizeEqualToSize(currentsize, CGSizeZero)) {
        return;
    }
    self.currentScreenWidth = currentsize.width;
    self.currentScreenHeight = currentsize.height;
}

- (void)updateScreenInterfaceAttributes {
    
    CGFloat fullWidth = UIScreen.mainScreen.bounds.size.width;
    
    if(self.interfaceOrientationLandscape) {
        if (self.currentScreenWidth < (fullWidth * 0.40)) {
            self.currentScreenInterfaceType = SplitPadLandscapeThirdScreen;
        } else if (self.currentScreenWidth < fullWidth * 0.60) {
            self.currentScreenInterfaceType = SplitPadLandscapeHalfScreen;
        } else if (self.currentScreenWidth < (fullWidth * 0.80)) {
            self.currentScreenInterfaceType = SplitPadLandscapeTwoThirdScreen;
        } else if (self.currentScreenWidth == fullWidth) {
            self.currentScreenInterfaceType = SplitPadLandscapeFullScreen;
        } else {
            self.currentScreenInterfaceType = SplitUnknown;
        }
    } else {
        if (self.currentScreenWidth < (fullWidth * 0.50)) {
            self.currentScreenInterfaceType = SplitPadPortraitThirdScreen;
        } else if (self.currentScreenWidth < fullWidth * 0.70) {
            self.currentScreenInterfaceType = SplitPadPortraitTwoThirdScreen;
        } else if (self.currentScreenWidth == fullWidth) {
            self.currentScreenInterfaceType = SplitPadPortraitFullScreen;
        } else {
            self.currentScreenInterfaceType = SplitUnknown;
        }
    }
    self.fullScreen = (self.currentScreenInterfaceType < SplitPadCheckFullScreen);
}

@end
