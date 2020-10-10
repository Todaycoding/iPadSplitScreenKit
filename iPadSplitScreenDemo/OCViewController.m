//
//  OCViewController.m
//  iPadSplitScreenDemo
//
//  Created by DevDragonLi on 9/10/2020.
//

#import "OCViewController.h"
//#import "iPadSplitScreenDemo-Swift.h"

@interface OCViewController ()

@property (nonatomic, strong) UIButton *fullScreenButton;

@property (nonatomic, strong) UILabel *smallScreenLabel;

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)isFullScreenCheckDemo {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (SPLITISFULLSCREEN) {
            NSLog(@"当前为全屏UI模式");
        } else {
            NSLog(@"当前为小屏UI模式");
        }
    });
}


- (void)ipadSmallScreen {
    [self.view addSubview:self.smallScreenLabel];
    NSLog(@"OCViewController：ipadSmallScreen");
}

- (void)ipadFullScreen {
    [self.view addSubview:self.fullScreenButton];
    NSLog(@"OCViewController：ipadFullScreen");
}

- (void)ipadSmallToFullScreenConfigurations {
    NSLog(@"ipadSmallToFullScreenConfigurations");
    self.smallScreenLabel.hidden = YES;
    self.fullScreenButton.hidden = NO;
}

- (void)ipadFullToSmallScreenConfigurations {
    NSLog(@"ipadFullToSmallScreenConfigurations");
    self.fullScreenButton.hidden = YES;
    self.smallScreenLabel.hidden = NO;
}


#pragma mark --- demo UI

- (UIButton *)fullScreenButton {
    if (_fullScreenButton == nil) {
        _fullScreenButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _fullScreenButton.frame = CGRectMake(100, 100, 200, 200);
        _fullScreenButton.backgroundColor = [UIColor redColor];
    }
    return _fullScreenButton;
}

- (UILabel *)smallScreenLabel {
    if (_smallScreenLabel == nil) {
        _smallScreenLabel = [UILabel new];
        _smallScreenLabel.frame = CGRectMake(60, 60, 100, 100);
        _smallScreenLabel.backgroundColor = [UIColor greenColor];
    }
    return _smallScreenLabel;
}

@end
