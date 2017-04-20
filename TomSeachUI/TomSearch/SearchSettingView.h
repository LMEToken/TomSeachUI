//
//  SearchSettingView.h
//  TomSeachUI
//
//  Created by tom on 2017/4/20.
//  Copyright © 2017年 tom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchSettingView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView *collectionView;


@property (nonatomic,strong)NSMutableArray  *dataArray;

@property (nonatomic,strong)NSMutableArray  *selectItems;;

@end
