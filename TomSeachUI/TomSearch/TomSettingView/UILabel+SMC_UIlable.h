//
//  UILabel+SMC_UIlable.h
//  ViewModelTest
//
//  Created by weiping.tan on 16/10/12.
//  Copyright © 2016年 SSaaS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SMC_UIlable)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
@end
