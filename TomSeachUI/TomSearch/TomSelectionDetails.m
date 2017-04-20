//
//  BYSelectionDetails.m
//  BYDailyNews
//
//  Created by bassamyan on 15/1/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TomSelectionDetails.h"
@implementation TomSelectionDetails

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeMainContent];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)makeMainContent
{
    
    NSString *plistPath1 = [[NSBundle mainBundle] pathForResource:@"properties" ofType:@"plist"];
    NSMutableArray *listArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath1];
    
    NSString *plistPath2 = [[NSBundle mainBundle] pathForResource:@"otherProperties" ofType:@"plist"];
    NSArray *otherValues = [[NSArray alloc] initWithContentsOfFile:plistPath2];
    
    UIView *bg_view1 = [[UIView alloc] initWithFrame:CGRectMake(0,0,BYScreenWidth, 30)];
    bg_view1.backgroundColor = Color_maingray;
    UILabel *morevalue_label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 30)];
    morevalue_label1.text = @"语言";
    morevalue_label1.font = [UIFont systemFontOfSize:14];
    [bg_view1 addSubview:morevalue_label1];
    [self addSubview:bg_view1];

    //点击添加频道的label和他的背景色
    UIView *bg_view = [[UIView alloc] initWithFrame:CGRectMake(0,50+45*((listArray.count -1)/4+1),BYScreenWidth, 30)];
    bg_view.backgroundColor = Color_maingray;
    UILabel *morevalue_label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 30)];
    morevalue_label.text = @"专业";
    morevalue_label.font = [UIFont systemFontOfSize:14];
    [bg_view addSubview:morevalue_label];
    [self addSubview:bg_view];
    
    NSInteger num = listArray.count;
    for (int i =0; i <num; i++) {
        UIButton *view = [[UIButton alloc] init];
        view.frame = CGRectMake(20+(20+view_width)*(i%4), 50+45*(i/4), view_width, 25);
        [view setTitle:listArray[i] forState:UIControlStateNormal];
        [view setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        view.tag = 1;
        [self addSubview:view];
    }
    
    NSInteger num2 = otherValues.count;
    for (int i=0; i<num2; i++) {

        UIButton *view = [[UIButton alloc] init];
        view.frame = CGRectMake(20+(20+view_width)*(i%4),CGRectGetMaxY(bg_view.frame)+20+45*(i/4), view_width, 25);
        [view setTitle:otherValues[i] forState:UIControlStateNormal];
        [view setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        view.tag = 1;
        [self addSubview:view];
    }
    
    self.contentSize = CGSizeMake(BYScreenWidth, CGRectGetMaxY(bg_view.frame)+20+45*((num2-1)/4+1) + 50);

}

@end

