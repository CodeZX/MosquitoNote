//
//  MNBasicNavigationController.m
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/9.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "MNBasicNavigationController.h"

@interface MNBasicNavigationController ()

@end

@implementation MNBasicNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupConfig];
}

- (void)setupConfig {
    
    self.navigationBar.tintColor = [UIColor blackColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
