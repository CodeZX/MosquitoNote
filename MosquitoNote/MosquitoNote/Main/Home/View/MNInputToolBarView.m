//
//  MNInputToolBarView.m
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/9.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "MNInputToolBarView.h"
#import "MNToolBarItemCell.h"

@interface MNInputToolBarView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,weak) UICollectionView *collectionView;
@end


static NSString * const ItemIdentifier = @"ItemIdentifier";

@implementation MNInputToolBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor  = [UIColor yellowColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(30, 30);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
    [self.collectionView registerClass:[MNToolBarItemCell class] forCellWithReuseIdentifier:ItemIdentifier];
}


#pragma mark -------------------------- collectionView delegate  ----------------------------------------

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MNToolBarItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ItemIdentifier forIndexPath:indexPath];
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if ([self.delegate respondsToSelector:@selector(inputToolBarView:forIndex:markIdentifier:)]) {
        [self.delegate inputToolBarView:self forIndex:indexPath.row markIdentifier:@""];
    }
}



@end
