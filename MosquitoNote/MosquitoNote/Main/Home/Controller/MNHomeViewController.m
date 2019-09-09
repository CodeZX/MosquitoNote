//
//  MNHomeViewController.m
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/9.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "MNHomeViewController.h"
#import "MNInputToolBarView.h"

@interface MNHomeViewController ()<inputToolBarViewDelegate>

@property (nonatomic,weak) UITextView *textView;

@end

@implementation MNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    
    self.title = @"文字笔记";
    
    
    UITextView *textView = [[UITextView alloc]init];
    MNInputToolBarView *toolBarView = [[MNInputToolBarView alloc]initWithFrame:CGRectMake(0, 0, 0, 44)];
    toolBarView.delegate = self;
    textView.inputAccessoryView  = toolBarView;
    [self.view addSubview:textView];
    self.textView  =  textView;
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        
    }];
    
    
    

}


#pragma mark -------------------------- inputToolBarView Datelgate  ----------------------------------------

- (void)inputToolBarView:(MNInputToolBarView *)inputToolBarView forIndex:(NSInteger)index markIdentifier:(NSString *)identifier {
    
    self.textView.text = [self.textView.text stringByAppendingString:identifier];
    
}

@end
