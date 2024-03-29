//
//  YZHUIButton.h
//  YZHUIButton
//
//  Created by yuan on 2017/7/14.
//  Copyright © 2017年 yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NSButtonContentAlignment)
{
    NSButtonContentAlignmentCenter  = 0,
    NSButtonContentAlignmentLeft    = (1 << 0),
    NSButtonContentAlignmentRight   = (1 << 1),
    NSButtonContentAlignmentUp      = (1 << 2),
    NSButtonContentAlignmentDown    = (1 << 3),
};

typedef NS_ENUM(NSInteger, NSButtonLayoutStyle)
{
    NSButtonLayoutStyleMask           = 0X3,
    NSButtonLayoutStyleLR             = 0,
    NSButtonLayoutStyleRL             = 1,
    NSButtonLayoutStyleUD             = 2,
    NSButtonLayoutStyleDU             = 3,
    //自定义image和title的space，有6个bit位
    NSButtonLayoutStyleSpaceMask      = 0XFC,
    //自定义image和title的space，以及上（左）下（右）等距
    NSButtonLayoutStyleEQSpace        = (1 << 2),
    //自定义image和tile的space，
    NSButtonLayoutStyleCustomSpace    = (1 << 3),
    
    NSButtonLayoutStyleCustomMask     = 0XF00,
    NSButtonLayoutStyleCustomRatio    = 0X100,
    NSButtonLayoutStyleCustomInset    = 0X200,
    
};

@class YZHUIButton;
typedef void(^YZHUIButtonActionBlock)(YZHUIButton *button);


@interface YZHUIButton : UIButton

@property (nonatomic, assign) NSButtonLayoutStyle layoutStyle;
@property (nonatomic, assign) CGFloat imageTitleSpace;

//UIButtonImageTitleLayoutStyleCustom时才有效
@property (nonatomic, assign) UIEdgeInsets imageEdgeInsetsRatio;
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsetsRatio;

@property (nonatomic, assign) NSButtonContentAlignment contentAlignment;
//@property (nonatomic, assign) CGFloat contentAlignmentSpace;

-(void)addControlEvent:(UIControlEvents)controlEvents actionBlock:(YZHUIButtonActionBlock)actionBlock;

@end
