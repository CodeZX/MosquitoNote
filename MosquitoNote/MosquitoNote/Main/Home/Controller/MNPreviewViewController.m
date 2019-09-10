//
//  MNPreviewViewController.m
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/10.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "MNPreviewViewController.h"
#import <WebKit/WebKit.h>
@interface MNPreviewViewController ()

@property (nonatomic,weak)WKWebView  *webView;
@end

@implementation MNPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
    self.title = @"预览";
    
    WKWebView *webView = [[WKWebView alloc]init];
    [self.view addSubview:webView];
    self.webView = webView;
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.webView loadHTMLString:self.htmlString baseURL:nil];
}


@end
