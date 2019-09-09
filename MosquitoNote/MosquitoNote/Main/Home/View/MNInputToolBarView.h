//
//  MNInputToolBarView.h
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/9.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MNInputToolBarView;
@protocol inputToolBarViewDelegate <NSObject>

- (void)inputToolBarView:(MNInputToolBarView *)inputToolBarView forIndex:(NSInteger)index markIdentifier:(NSString *)identifier;


@end


@interface MNInputToolBarView : UIView
@property (nonatomic,weak) id<inputToolBarViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
