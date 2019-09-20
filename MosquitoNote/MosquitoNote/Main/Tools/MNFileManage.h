//
//  MNFileManage.h
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/18.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNNoteModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNFileManage : NSObject

+ (instancetype)shareManage;
- (BOOL)seveNoteObject:(MNNoteModel *)noteObject;
- 

@end

NS_ASSUME_NONNULL_END
