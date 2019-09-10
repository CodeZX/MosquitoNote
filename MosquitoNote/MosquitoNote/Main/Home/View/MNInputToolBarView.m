//
//  MNInputToolBarView.m
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/9.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "MNInputToolBarView.h"
#import "MNToolBarItemCell.h"
#import <JavaScriptCore/JavaScriptCore.h>


@interface MNInputToolBarView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *identifierStirngArray;


@end


static NSString * const ItemIdentifier = @"ItemIdentifier";

@implementation MNInputToolBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupData];
        [self setupUI];
    }
    return self;
}

- (void)setupData {
    
    self.identifierStirngArray = @[@"*",@"#",@"_",@"~",@"`",@"|",@"-",@">",@"[",@"]"];
    
   
    
}

- (void)setupUI {
    
    self.backgroundColor  = [UIColor yellowColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(30, 30);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.contentInset = UIEdgeInsetsMake(0, 5, 0, 0);
    collectionView.backgroundColor = [UIColor whiteColor];
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
    return self.identifierStirngArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MNToolBarItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ItemIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = self.identifierStirngArray[indexPath.row];
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if ([self.delegate respondsToSelector:@selector(inputToolBarView:forIndex:markIdentifier:)]) {
        
        [self.delegate inputToolBarView:self forIndex:indexPath.row markIdentifier:self.identifierStirngArray[indexPath.row]];
    }
}



@end
