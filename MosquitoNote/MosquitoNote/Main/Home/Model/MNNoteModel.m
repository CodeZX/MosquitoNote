//
//  MNNoteModel.m
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/18.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "MNNoteModel.h"

@interface MNNoteModel ()

@end

@implementation MNNoteModel

MJExtensionCodingImplementation


- (instancetype)initWithTitle:(NSString *)title forContent:(NSString *)content {
    self = [super init];
    if (self) {
        self.title  = title;
        self.content = content;
        self.creaeDate = [NSDate date];
    }
    return self;
    
}


@end
