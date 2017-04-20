//
//  UIInsetsLabel.m
//  UIInsetsLabel
//
//  Created by SMC-MAC on 15/12/21.
//  Copyright © 2015年 SMC-MAC. All rights reserved.
//

#import "UIInsetsLabel.h"

@implementation UIInsetsLabel

- (instancetype)init
{
    if (self = [super init]) {
        [self setEdgeInsets:UIEdgeInsetsZero];
    }
    return self;
}

- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets{
    _textEdgeInsets = edgeInsets;
    _top    = edgeInsets.top;
    _left   = edgeInsets.left;
    _bottom = edgeInsets.bottom;
    _right  = edgeInsets.right;
}

- (void)setTop:(CGFloat)top {
    _top = top;
    _textEdgeInsets.top = _top;
}

- (void)setLeft:(CGFloat)left {
    _left = left;
    _textEdgeInsets.left = _left;
}

- (void)setBottom:(CGFloat)bottom {
    _bottom = bottom;
    _textEdgeInsets.bottom = _bottom;
}

- (void)setRight:(CGFloat)right {
    _right = right;
    _textEdgeInsets.right = _right;
}

- (void)setTextEdgeInsets:(UIEdgeInsets)textEdgeInsets {
    [self setEdgeInsets:textEdgeInsets];
}

/**
 *  重绘Label
 *
 *  @param rect Label的Frame
 */
- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textEdgeInsets)];
}

/**
 *  根据这个Size，Label自适应大小
 *
 *  @return 返回Label的大小
 */
- (CGSize)intrinsicContentSize
{
    CGSize contentSize = [super intrinsicContentSize];
    
    return CGSizeMake(contentSize.width + _textEdgeInsets.left + _textEdgeInsets.right,
                      contentSize.height + _textEdgeInsets.top + _textEdgeInsets.bottom);
}

- (CGRect)frame {
    CGRect fm = [super frame];
    
    fm.origin.y  = fm.origin.y - _top;
    fm.origin.x  = fm.origin.x - _left;
    fm.size = [self intrinsicContentSize];
    
    return fm;
}

#pragma mark -- Corner Radius
/**
 *  设置label的圆角半径大小
 *
 *  @param cornerRadius 圆角半径
 */
-(void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0?YES:NO;
}

@end
