//
//  MNNoteModel.h
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/18.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNNoteModel : NSObject 


@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSDate *creaeDate;
@property (nonatomic,strong) NSDate *editDate;




- (instancetype)initWithTitle:(NSString *)title forContent:(NSString *)content;



@end

NS_ASSUME_NONNULL_END
