//
//  MNHUD.m
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/20.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "MNHUD.h"


@implementation MNHUD

+ (void)configHUD {
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setCornerRadius:5];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    
}

+ (void)hideLoadingHUD
{
    [SVProgressHUD dismiss];
}

+ (void)showLoadingHUDWithMessage:(NSString *)message
{
    // 如果当前视图还有其他提示框，就dismiss
    [self hideLoadingHUD];
    [self configHUD];
    
    
    // 加载中的提示框一般不要不自动dismiss，比如在网络请求，要在网络请求成功后调用 hideLoadingHUD 方法即可
    if (message) {
        [SVProgressHUD showWithStatus:message];
    }else{
        [SVProgressHUD show];
    }
}

+ (void)showTextHUDWithMessage:(NSString *)message
{
    [self hideLoadingHUD];
    
    [self configHUD];
    
    [SVProgressHUD showImage:[UIImage imageNamed:@""] status:message];
    
    [SVProgressHUD dismissWithDelay:2];
    
}


+ (void)showCompletionHUDWithMessage:(NSString *)message completion:(MNHUDcompleteAction)completion
{
    [self hideLoadingHUD];
    
   [self configHUD];
    
    [SVProgressHUD showSuccessWithStatus:message];
    
    [SVProgressHUD dismissWithDelay:2];
    if (completion) {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^{
            completion();
        });
    }
    
}

+ (void)showWarningHUDWithMessage:(NSString *)message completion:(MNHUDcompleteAction)completion
{
    [self hideLoadingHUD];
    
   [self configHUD];
    
    [SVProgressHUD showErrorWithStatus:message];
    
    [SVProgressHUD dismissWithDelay:2];
    if (completion) {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^{
            completion();
        });
    }
}

@end
