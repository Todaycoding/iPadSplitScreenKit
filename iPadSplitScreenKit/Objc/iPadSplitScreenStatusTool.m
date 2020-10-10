//
//  ZDScreenStatusTool.m
//  
//
//  Created by DevDragonLi on 9/10/2020.
//

#import "iPadSplitScreenStatusTool.h"

@interface iPadSplitScreenStatusTool ()

@property (nonatomic, assign, getter=isFullScreen) BOOL fullScreen;

@property (nonatomic, assign) BOOL interfaceOrientationLandscape;

@property (nonatomic, assign) SplitScreenInterfaceType currentScreenInterfaceType;


@end


@implementation iPadSplitScreenStatusTool

+ (instancetype)tool {
    static iPadSplitScreenStatusTool *tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc] init];
    });
    return tool;
}

@end
