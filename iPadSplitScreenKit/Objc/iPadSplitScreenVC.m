//
//  iPadSplitScreenVC.m
//  iPadSplitScreenKit
//
//  Created by DevDragonLi on 27/9/2020.

#import "iPadSplitScreenVC.h"

@interface iPadSplitScreenVC ()

@property(nonatomic, assign, getter=isiPadfullScreenViewLoaded) BOOL iPadfullScreenViewLoaded;

@property(nonatomic, assign, getter=isiPadsmallScreenViewLoaded) BOOL iPadsmallScreenViewLoaded;

@property(nonatomic, assign, getter=isiPadCommonSetuped) BOOL iPadCommonSetuped;

@property (nonatomic, assign) SplitScreenInterfaceType lastScreenInterfaceType;

@end

@implementation iPadSplitScreenVC

- (instancetype)init {
    if (self = [super init]) {
        self.lastScreenInterfaceType = SplitUnknown;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self split_updateViewLayoutDependenciesWithCurrentSize:self.view.frame.size];
}

#pragma mark ---iPad adapter functions

- (void)ipadCommonSetup {}

- (void)ipadSmallToFullScreenConfigurations {}

- (void)ipadFullToSmallScreenConfigurations {}

- (void)ipadInterfaceOrientationChanged:(ZDInterfaceChangeType)changeType currentSize:(CGSize)currentSize {}

- (void)ipadFullScreen {
    NSString *assertMsg = [NSString stringWithFormat:@"%@【%@】",@"❌：Please implement `ipadFullScreen Function` With", NSStringFromClass([self class])];
    NSAssert(NO, assertMsg);
}

- (void)ipadSmallScreen {
    NSString *assertMsg = [NSString stringWithFormat:@"%@【%@】",@"❌：Please implement `ipadSmallScreen Function` With", NSStringFromClass([self class])];
    NSAssert(NO, assertMsg);
}

- (void)split_privateIpadCommonSetup {
    if (!self.isiPadCommonSetuped) {
        [self ipadCommonSetup];
        self.iPadCommonSetuped = YES;
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    if (self.isViewLoaded) {
        [self ipadInterfaceOrientationChanged:ZDInterfaceChangedEarliest currentSize:size];
        [self split_updateViewLayoutDependenciesWithCurrentSize:size];
    }
}

- (void)split_updateViewLayoutDependenciesWithCurrentSize:(CGSize)currentSize {
    
    [iPadSplitScreenStatusTool.defaultool updateCurrentInterfaceOrientation];
    [iPadSplitScreenStatusTool.defaultool updateCurrentInterfaceSize:currentSize];
    [iPadSplitScreenStatusTool.defaultool updateScreenInterfaceAttributes];
    
    [self ipadInterfaceOrientationChanged:ZDInterfaceChanging currentSize:currentSize];
    
    [self split_privateIpadCommonSetup];
    
    if (self.lastScreenInterfaceType == SplitUnknown) {
        [self split_configLastScreenType];
        if (SPLITISFULLSCREEN) {
            [self split_configScreenWithIsFull:YES];
        } else {
            [self split_configScreenWithIsFull:NO];
        }
        
        return;
    }
    
    BOOL isLastFullScreen = (self.lastScreenInterfaceType < SplitPadCheckFullScreen);
    [self split_configLastScreenType];
    if (isLastFullScreen == SPLITISFULLSCREEN) {
        [self ipadInterfaceOrientationChanged:ZDInterfaceChangeLatter currentSize:currentSize];
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
    
    [self ipadInterfaceOrientationChanged:ZDInterfaceChangeLatter currentSize:currentSize];
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
    self.lastScreenInterfaceType = iPadSplitScreenStatusTool.defaultool.currentScreenInterfaceType;
}

@end
