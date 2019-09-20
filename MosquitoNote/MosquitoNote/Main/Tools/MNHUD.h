//
//  MNHUD.h
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/20.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^__nullable MNHUDcompleteAction)(void);
@interface MNHUD : NSObject

/*
 隐藏hud
 */
+ (void)hideLoadingHUD;
/*
 加载中+文字提示（文字可为空）
 */
+ (void)showLoadingHUDWithMessage:(nullable NSString *)message;
/*
 纯文字提示
 */
+ (void)showTextHUDWithMessage:(nonnull NSString *)message;
/*
 失败提示
 */
+ (void)showWarningHUDWithMessage:(nullable NSString *)message completion:(MNHUDcompleteAction)completion;
/*
 完成提示
 */
+ (void)showCompletionHUDWithMessage:(nullable NSString *)message completion:(MNHUDcompleteAction)completion;

@end

NS_ASSUME_NONNULL_END
