//
//  SearchSettingView.m
//  TomSeachUI
//
//  Created by tom on 2017/4/20.
//  Copyright © 2017年 tom. All rights reserved.
//

#import "SearchSettingView.h"
#import "UICollectionViewLeftAlignedLayout.h"
#import "UILabel+SMC_UIlable.h"
#import "UIInsetsLabel.h"
#import "TomSearch.h"
@implementation SearchSettingView


// 注意const的位置
static NSString *const cellId = @"cellId";


-(instancetype)init
{
    self = [super init];
    if (self) {
        
        [self loadCollectionView];
        
        self.dataArray = [NSMutableArray array];
        
        self.selectItems = [NSMutableArray array];
        
        [self.dataArray addObjectsFromArray:@[@"asdasdasd",@"asdasdasdasdasdadasd",@"asdasd",@"asdasda",@"asdas",@"asdasdasdasdsasadasdadasd"]];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [UIView animateWithDuration:0 animations:^{
        
          [_collectionView setFrame:CGRectMake(15, 10, BYScreenWidth, frame.size.height)];
    }];

}

- (void)loadCollectionView
{
    //创建一个layout布局类
    UICollectionViewLeftAlignedLayout * layout = [[UICollectionViewLeftAlignedLayout alloc]init];
    
    layout.headerReferenceSize=CGSizeMake(BYScreenWidth-40, 40);
    //设置布局方向为垂直流布局
    CGFloat height = 10;
    self.backgroundColor = border_gray;
    
    if (!_collectionView)
    {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, height, BYScreenWidth, BYScreenHeight-height) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.scrollEnabled = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
        
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView"];
        
        [self addSubview:_collectionView];
    }
    [_collectionView setFrame:CGRectMake(15, height, BYScreenWidth, BYScreenHeight-height)];
}
#pragma mark ---- UICollectionViewDataSource
//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
        //添加头视图的内容

        UILabel *lable =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, BYScreenWidth-40, 40)];
        
        lable.text = @"标题";
        
        lable.textColor = Color_gray;
        
        [lable setFont:[UIFont systemFontOfSize:15]];
        
        //头视图添加view
        [header addSubview:lable];
        
        return header;
    }

    return nil;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    
    UIInsetsLabel *labelTwo = [cell viewWithTag:1001];
    
    if (!labelTwo) {
        
        labelTwo = [[UIInsetsLabel alloc] initWithFrame:CGRectMake(9, 9, 9, 9)];
        //        labelTwo = [UIButton buttonWithType:UIButtonTypeSystem];
        labelTwo.textAlignment =NSTextAlignmentCenter;
        labelTwo.tag = 1001;
        [cell addSubview:labelTwo];
        
    }
    labelTwo.userInteractionEnabled = NO;
    
    [labelTwo setText:self.dataArray[indexPath.row]];

    
    
    if ([self.selectItems containsObject:self.dataArray[indexPath.row]])
    {
        
        labelTwo.backgroundColor = [UIColor blueColor];
        
    }else
    {
        
        labelTwo.backgroundColor = [UIColor whiteColor];
    }

    
    labelTwo.font = [UIFont systemFontOfSize:12];
    CGFloat width = [UILabel getWidthWithTitle:labelTwo.text font:[UIFont systemFontOfSize:14]];
    labelTwo.frame = CGRectMake(0, 0, width+6, 24);
    labelTwo.layer.masksToBounds = YES;
    labelTwo.layer.cornerRadius = 5.0;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    if ([self.selectItems containsObject:self.dataArray[indexPath.row]]) {
        [self.selectItems removeObject:self.dataArray[indexPath.row]];
    }else
    {
            [self.selectItems addObject:self.dataArray[indexPath.row]];
    }

    
    
    [collectionView reloadData];
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = [UILabel getWidthWithTitle:self.dataArray[indexPath.row] font:[UIFont systemFontOfSize:14]];
    return (CGSize){width+6,24};
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
