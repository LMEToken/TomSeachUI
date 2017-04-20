//
//  UIInsetsLabel.h
//  UIInsetsLabel
//
//  Created by SMC-MAC on 15/12/21.
//  Copyright © 2015年 SMC-MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface UIInsetsLabel : UILabel

/**
 *  边缘间隔
 */
@property (nonatomic, assign) IBInspectable CGFloat top;
@property (nonatomic, assign) IBInspectable CGFloat left;
@property (nonatomic, assign) IBInspectable CGFloat bottom;
@property (nonatomic, assign) IBInspectable CGFloat right;

/**
 *  圆角
 */
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

/**
 *  由于IBInspectable不支持UIEdgeInsets属性，
 *  可通过代码设置，替换以上四个属性值
 */
@property (nonatomic) UIEdgeInsets textEdgeInsets;

@end
