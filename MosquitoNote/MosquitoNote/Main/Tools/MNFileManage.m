//
//  MNFileManage.m
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/18.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "MNFileManage.h"


@interface MNFileManage ()

@property (nonatomic,strong) NSString *documentPath;
@property (nonatomic,strong) NSString *noteFolderName;
@property (nonatomic,strong) NSString *noteFolderPath;

@end

@implementation MNFileManage

static MNFileManage * _instance = nil;

+ (instancetype)shareManage {
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
        [_instance initialize];
    }) ;
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone {
    return [MNFileManage shareManage];
}

-(id)copyWithZone:(NSZone *)zone {
    return [MNFileManage shareManage];
}

-(id)mutableCopyWithZone:(NSZone *)zone {
    return [MNFileManage shareManage];
}

- (void)initialize {
    
    self.documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    self.noteFolderName = @"MosquitoNote";
    self.noteFolderPath = [self.documentPath stringByAppendingPathComponent:self.noteFolderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:self.noteFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
}




- (BOOL)seveNoteObject:(MNNoteModel *)noteObject {
    
   
    NSData *noteData = [NSKeyedArchiver archivedDataWithRootObject:noteObject requiringSecureCoding:NO error:nil];
    NSString *filePath = [self.noteFolderPath stringByAppendingPathComponent:[self createNoteName]];
    NSLog(@"filePath-%@",filePath);
    if ([noteData writeToFile:filePath atomically:YES]) {
        return true;
    }else {
        return false;
    }

}

- (NSString *)createNoteName {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter stringFromDate:[NSDate date]];
}


- (NSArray *)noteList {
    
    NSMutableArray *noteList = [[NSMutableArray alloc]init];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *noteNames =  [fileManager contentsOfDirectoryAtPath:self.noteFolderPath error:nil];
    for (NSString * noteName in noteNames) {
        NSString *notePath = [self.noteFolderPath stringByAppendingPathComponent:noteName];
        NSLog(@"notePath%@",notePath);
        if ([fileManager fileExistsAtPath:notePath]) {
            NSData *noteData = [NSData dataWithContentsOfFile:notePath];
            MNNoteModel *noteModel = [NSKeyedUnarchiver unarchiveObjectWithData:noteData exception:nil];
            if (noteModel) {
                [noteList addObject:noteModel];
            }
        }
    }
    
    return noteList;
}

//
//- (NSString *)noteFolderPath {
//
//    NSString *folderPath = [self.documentPath stringByAppendingPathComponent:self.noteFolderName];
//    if ([self createFolderWithFile:folderPath]) {
//        return folderPath;
//    }
//
//    return nil;
//
//}


- (BOOL)createFolderWithFile:(NSString *)filePath {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    BOOL isExit = [fileManager fileExistsAtPath:filePath isDirectory:&isDir];
    BOOL isSucceed = false;
    if (!isExit || !isDir) {
        isSucceed =  [fileManager createDirectoryAtPath:filePath
                            withIntermediateDirectories:YES
                                             attributes:nil
                                                  error:nil];
    }
    
    return isSucceed;
}



@end
