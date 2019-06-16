//
//  ViewController.m
//  YZHUIHoverViewDemo
//
//  Created by yuan on 2017/9/7.
//  Copyright © 2017年 yuan. All rights reserved.
//

#import "ViewController.h"
#import "YZHUIHoverView.h"
#import "Macro.h"
#import "UIImage+fixOrientation.h"

#define CAMERA_FUNCTION_BUTTON_BG_COLOR    RGB_WITH_INT_WITH_NO_ALPHA(0X2196f3)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpHoverViewTest];
}

-(void)setUpHoverViewTest
{
    CGFloat width = 60;
    YZHUIHoverView *hoverView = [[YZHUIHoverView alloc] initWithFrame:CGRectMake(100, 100, width, width)];
    hoverView.backgroundColor = CAMERA_FUNCTION_BUTTON_BG_COLOR;
//    hoverView.hoverImage = [UIImage imageNamed:@"Right"];
//    hoverView.hoverButton.backgroundColor = PURPLE_COLOR;
    hoverView.delayToNormalTimeInterval = -1;
    hoverView.autoAdjustNormalPosition = YES;
    hoverView.actionItemWidth = 60;
    hoverView.hoverButton.backgroundColor = RED_COLOR;
    [hoverView.hoverButton setTitle:@"开始" forState:UIControlStateNormal];
    hoverView.flexDirection = YZHUIHoverViewFlexDirectionAny;//YZHUIHoverViewFlexDirectionDown | YZHUIHoverViewFlexDirectionUp | YZHUIHoverViewFlexDirectionLeft;
    
    hoverView.hoverAction = ^(YZHUIHoverView *hoverView, YZHHoverActionModel *actionModel, NSInteger index) {
        NSLog(@"index=%ld",index);
    };
    
//    hoverView.autoAdjustNormalPosition = NO;
    
    //    UIImageTitleButton *titleBtn= [hoverView addHoverActionWithImageName:@"Crop" title:@"裁剪" hoverActionBlock:^(NSString *title) {
    //        NSLog(@"-------title=%@",title);
    //    }];
    //    titleBtn.tintColor = WHITE_COLOR;
    //    [titleBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    //
    //    titleBtn = [hoverView addHoverActionWithImageName:@"Left" title:@"旋转" hoverActionBlock:^(NSString *title) {
    //        NSLog(@"-------title=%@",title);
    //    }];
    //    titleBtn.tintColor = WHITE_COLOR;
    //    [titleBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    
    UIImage *cropImage = [UIImage renderImage:@"Crop"];
    YZHHoverActionModel *titleAction = [hoverView addHoverActionWithImage:cropImage title:@"裁剪" hoverActionBlock:^(YZHUIHoverView *hoverView, YZHHoverActionModel *actionModel, NSInteger index) {
        NSLog(@"-------title=%@",actionModel.hoverTitle);
    }];
//    titleBtn.tintColor = WHITE_COLOR;
//    [titleBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    UIImage *rotateImage = [UIImage renderImage:@"Left"];
    titleAction = [hoverView addHoverActionWithImage:rotateImage title:@"旋转" hoverActionBlock:^(YZHUIHoverView *hoverView, YZHHoverActionModel *actionModel, NSInteger index) {
        NSLog(@"-------title=%@",actionModel.hoverTitle);
    }];
//    titleBtn.tintColor = WHITE_COLOR;
//    [titleBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    
    
    UIImage *doneImage = [UIImage renderImage:@"Done"];
    titleAction = [hoverView addHoverActionWithImage:doneImage title:@"完成" hoverActionBlock:^(YZHUIHoverView *hoverView, YZHHoverActionModel *actionModel, NSInteger index) {
        NSLog(@"-------title=%@",actionModel.hoverTitle);
    }];
//    titleBtn.tintColor = WHITE_COLOR;
//    [titleBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    
    UIImage *backImage = [UIImage renderImage:@"Back"];
    titleAction = [hoverView addHoverActionWithImage:backImage title:@"返回" hoverActionBlock:^(YZHUIHoverView *hoverView, YZHHoverActionModel *actionModel, NSInteger index) {
        NSLog(@"-------title=%@",actionModel.hoverTitle);
    }];
//    titleBtn.tintColor = WHITE_COLOR;
//    [titleBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    
    UIImage *cancelImage = [UIImage renderImage:@"Cancel"];
    titleAction = [hoverView addHoverActionWithImage:cancelImage title:@"取消" hoverActionBlock:^(YZHUIHoverView *hoverView, YZHHoverActionModel *actionModel, NSInteger index) {
        NSLog(@"-------title=%@",actionModel.hoverTitle);
    }];
//    titleBtn.tintColor = WHITE_COLOR;
//    [titleBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [hoverView showInView:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
