//
//  YZHUIButton.m
//  YZHUIButton
//
//  Created by yuan on 2017/7/14.
//  Copyright © 2017年 yuan. All rights reserved.
//

#import "YZHUIButton.h"
#import "Macro.h"

@interface YZHUIButton ()

@property (nonatomic, copy) YZHUIButtonActionBlock actionBlock;
@end

@implementation YZHUIButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self _layoutImageTitleView];
    
//    [self _alignContentView];
}

-(void)_layoutImageTitleView
{
    CGSize contentSize = self.bounds.size;
    
    CGSize imageSize = self.currentImage.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGFloat IX = 0;
    CGFloat IY = 0;
    CGFloat IW = 0;
    CGFloat IH = 0;
    
    CGFloat TX = 0;
    CGFloat TY = 0;
    CGFloat TW = 0;
    CGFloat TH = 0;
    
    CGFloat itemSpaceV = 0;
    CGFloat itemSpaceH = 0;
    
    NSInteger layoutStyle = TYPE_AND(self.layoutStyle, NSButtonLayoutStyleCustomMask);
    if (layoutStyle) {
        if (layoutStyle == NSButtonLayoutStyleCustomRatio) {
            TX = self.titleEdgeInsetsRatio.left * contentSize.width;
            TY = self.titleEdgeInsetsRatio.top * contentSize.height;
            TW = (1 - self.titleEdgeInsetsRatio.left - self.titleEdgeInsetsRatio.right) * contentSize.width;
            TH = (1 - self.titleEdgeInsetsRatio.top - self.titleEdgeInsetsRatio.bottom) * contentSize.height;
            
            IX = self.imageEdgeInsetsRatio.left * contentSize.width;
            IY = self.imageEdgeInsetsRatio.top * contentSize.height;
            IW = (1 - self.imageEdgeInsetsRatio.left - self.imageEdgeInsetsRatio.right) * contentSize.width;
            IH = (1 - self.imageEdgeInsetsRatio.top - self.imageEdgeInsetsRatio.bottom) * contentSize.height;
        }
        else if (layoutStyle == NSButtonLayoutStyleCustomInset)
        {
            TX = self.titleEdgeInsetsRatio.left;
            TY = self.titleEdgeInsetsRatio.top;
            TW = self.titleEdgeInsetsRatio.right;
            TH = self.titleEdgeInsetsRatio.bottom;
            
            IX = self.imageEdgeInsetsRatio.left;
            IY = self.imageEdgeInsetsRatio.top;
            IW = self.imageEdgeInsetsRatio.right;
            IH = self.imageEdgeInsetsRatio.bottom;
        }
    }
    else
    {
        if (TYPE_AND(self.layoutStyle, NSButtonLayoutStyleSpaceMask) == NSButtonLayoutStyleEQSpace) {
            itemSpaceV = (contentSize.height - imageSize.height - titleSize.height) / 3;
            itemSpaceH = (contentSize.width - imageSize.width - titleSize.width) / 3;
        }
        else if (TYPE_AND(self.layoutStyle, NSButtonLayoutStyleSpaceMask) == NSButtonLayoutStyleCustomSpace)
        {
            itemSpaceV = self.imageTitleSpace;
            itemSpaceH = self.imageTitleSpace;
        }
        
        switch (TYPE_AND(self.layoutStyle, NSButtonLayoutStyleMask)) {
            case NSButtonLayoutStyleLR:
            {
                IX = (contentSize.width-(imageSize.width + titleSize.width + itemSpaceH))/2;
                IY = (contentSize.height-imageSize.height)/2;
                TY = (contentSize.height - titleSize.height)/2;
                
                if (TYPE_AND(self.contentAlignment, NSButtonContentAlignmentLeft)) {
                    IX = 0;
                    
                }
                else if (TYPE_AND(self.contentAlignment, NSButtonContentAlignmentRight))
                {
                    IX = contentSize.width - TW - itemSpaceH - IW;
                }
                
                if (TYPE_AND(self.contentAlignment, NSButtonContentAlignmentUp)) {
                    if (imageSize.height > titleSize.height) {
                        IY = 0;
                        TY = (imageSize.height - titleSize.height)/2;
                    }
                    else
                    {
                        IY = (titleSize.height - imageSize.height)/2;
                        TY = 0;
                    }
                }
                else if (TYPE_AND(self.contentAlignment, NSButtonContentAlignmentDown))
                {
                    if (imageSize.height > titleSize.height) {
                        IY = contentSize.height - imageSize.height;
                        TY = IY + (imageSize.height - titleSize.height)/2;
                    }
                    else
                    {
                        TY = contentSize.height - titleSize.height;
                        IY = TY + (titleSize.height - imageSize.height)/2;
                    }
                }
                
                IW = imageSize.width;
                IH = imageSize.height;
                
                TX = IX + IW + itemSpaceH;
                TW = titleSize.width;
                TH = titleSize.height;
                break;
            }
            case NSButtonLayoutStyleRL:
            {
                TX = (contentSize.width-(imageSize.width + titleSize.width + itemSpaceH))/2;
                TY = (contentSize.height-titleSize.height)/2;
                TW = titleSize.width;
                TH = titleSize.height;
                
                IX = TX + TW + itemSpaceH;
                IY = (contentSize.height - imageSize.height)/2;
                IW = imageSize.width;
                IH = imageSize.height;
                break;
            }
            case NSButtonLayoutStyleUD:
            {
                IX = (contentSize.width - imageSize.width)/2;
                IY = (contentSize.height - (imageSize.height + titleSize.height + itemSpaceV))/2;
                IW = imageSize.width;
                IH = imageSize.height;
                
                TX = (contentSize.width - titleSize.width)/2;
                TY = IY + IH + itemSpaceV;
                TW = titleSize.width;
                TH = titleSize.height;
                break;
            }
            case NSButtonLayoutStyleDU:
            {
                TX = (contentSize.width - titleSize.width)/2;
                TY = (contentSize.height - (imageSize.height + titleSize.height + itemSpaceV))/2;
                TW = titleSize.width;
                TH = titleSize.height;
                
                IX = (contentSize.width - imageSize.width)/2;
                IY = TY + TH + itemSpaceV;
                IW = imageSize.width;
                IH = imageSize.height;
                break;
            }
            default:
                break;
        }
    }

    self.imageView.frame = CGRectMake(IX, IY, IW, IH);

    self.titleLabel.frame = CGRectMake(TX, TY, TW, TH);
    
//    NSLog(@"irect=%@,lrect=%@",NSStringFromCGRect(self.imageView.frame), NSStringFromCGRect(self.titleLabel.frame));
}

//-(void)_alignContentView
//{
//    if (self.contentAlignment == NSButtonContentAlignmentCenter) {
//        return;
//    }
//    switch (self.contentAlignment) {
//        case NSButtonContentAlignmentLeft:
//        {
//            
//            break;
//        }
//        case NSButtonContentAlignmentRight:
//        {
//            break;
//        }
//        case NSButtonContentAlignmentUp:
//        {
//            break;
//        }
//        case NSButtonContentAlignmentDown:
//        {
//            
//            break;
//        }
//        default:
//            break;
//    }
//}

//- (CGRect)backgroundRectForBounds:(CGRect)bounds
//{
//    NSLog(@"bounds=%@",NSStringFromCGRect(bounds));
//    return bounds;
//}
//
//-(CGRect)contentRectForBounds:(CGRect)bounds
//{
//    NSLog(@"bounds=%@",NSStringFromCGRect(bounds));
//    return bounds;
//}
//
//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
////    NSLog(@"contentRect=%@",NSStringFromCGRect(contentRect));
//    NSLog(@"title=%@",self.currentTitle);
//    
//    NSLog(@"titleAttr=%@",self.currentAttributedTitle);
//    
//    CGSize imgSize = self.currentImage.size;
//    CGFloat x = imgSize.width;
//    CGFloat y = 0;
//    CGFloat w = contentRect.size.width - imgSize.width;
//    CGFloat h = contentRect.size.height;
//    return CGRectMake(x, y,  w, h);
//    
////    return contentRect;
////    return self.titleLabel.frame;
//}
//
//- (CGRect)imageRectForContentRect:(CGRect)contentRect
//{
////    NSLog(@"imagerect=%@",NSStringFromCGRect(self.imageView.frame));
//    NSLog(@"contentRect=%@",NSStringFromCGRect(contentRect));
//    NSLog(@"imageSize=%@",NSStringFromCGSize(self.currentImage.size));
////    return contentRect;
////    return self.imageView.frame;
//    CGSize imgSize = self.currentImage.size;
//    CGFloat x = 0;
//    CGFloat y = (contentRect.size.height-imgSize.height)/2;
//    CGFloat w = imgSize.width;
//    CGFloat h = imgSize.height;
//    
//    return CGRectMake(x, y, w, h);
//}

-(void)addControlEvent:(UIControlEvents)controlEvents actionBlock:(YZHUIButtonActionBlock)actionBlock
{
    self.actionBlock = actionBlock;
    [self addTarget:self action:@selector(controlAction:) forControlEvents:controlEvents];
}

-(void)controlAction:(YZHUIButton*)titleButton
{
    if (self.actionBlock) {
        self.actionBlock(titleButton);
    }
}
@end
