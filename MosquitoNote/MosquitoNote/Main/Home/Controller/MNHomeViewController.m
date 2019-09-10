//
//  MNHomeViewController.m
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/9.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "MNHomeViewController.h"
#import "MNInputToolBarView.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "MNPreviewViewController.h"
@interface MNHomeViewController ()<inputToolBarViewDelegate>

@property (nonatomic,weak) UITextView *textView;
@property (nonatomic,strong) JSContext *jsContext;

@end

@implementation MNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupUI];
}

- (void)setupData {
    
    self.jsContext = [[JSContext alloc]init];
    //错误回调
    [self.jsContext setExceptionHandler:^(JSContext *context, JSValue *exception){
        NSLog(@"%@", exception.toString);
    }];
    
    //markdown -> html  js参考 https://github.com/showdownjs/showdown
    static NSString *js;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        js = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"showdown" ofType:@"js"] encoding:NSUTF8StringEncoding error:nil];
    });
    //加载js
    [self.jsContext evaluateScript:js];
    
    //注入function  markdown -> html，使用时，可以通过 convert('xxx'); 调用
    NSString *jsFunction = @"\
                                 function convert(md) { \
                                 return (new showdown.Converter()).makeHtml(md);\
                                }";
    [self.jsContext evaluateScript:jsFunction];
    
}


- (void)setupUI {
    
    self.title = @"文字笔记";
    UIBarButtonItem *seveButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(seveButtonClick:)];
    seveButtonItem.tintColor = [UIColor blackColor];
    UIBarButtonItem *previewButtonItem  = [[UIBarButtonItem alloc]initWithTitle:@"预览" style:UIBarButtonItemStylePlain target:self action:@selector(previewButtonClick:)];
    previewButtonItem.tintColor = [UIColor blackColor];
    UIBarButtonItem *newNoteButtonItem  = [[UIBarButtonItem alloc]initWithTitle:@"新建" style:UIBarButtonItemStylePlain target:self action:@selector(newNoteButtonClick:)];
    newNoteButtonItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItems = @[seveButtonItem,previewButtonItem];
    self.navigationItem.leftBarButtonItem = newNoteButtonItem;
    
    
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

- (void)seveButtonClick:(UIButton *)btn {
    
    
}

- (void)previewButtonClick:(UIButton *)btn {
    
    if (self.textView.text.length > 0) {
        MNPreviewViewController *previewVC  = [[MNPreviewViewController alloc]init];
        previewVC.htmlString = [self htmlString];
        [self.navigationController pushViewController:previewVC animated:YES];
    }
    
}

- (void)newNoteButtonClick:(UIButton *)btn {
    
    
}





- (NSString *)htmlString
{
    //markdown -> html
    JSValue *jsFunctionValue = self.jsContext[@"convert"];
    JSValue *htmlValue = [jsFunctionValue callWithArguments:@[self.textView.text]];
    //加载css样式
    static NSString *css;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        css = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"markdown" ofType:@"css"] encoding:NSUTF8StringEncoding error:nil];
    });
    NSLog(@"htmlValue%@",htmlValue.toString);
    return [NSString stringWithFormat:@"\
            <html>\
            <head>\
            <title>%@</title>\
            <style>%@</style>\
            </head>\
            <body>\
            %@\
            </body>\
            </html>\
            ", self.title, css, htmlValue.toString];
}


#pragma mark -------------------------- inputToolBarView Datelgate  ----------------------------------------

- (void)inputToolBarView:(MNInputToolBarView *)inputToolBarView forIndex:(NSInteger)index markIdentifier:(NSString *)identifier {
    
    self.textView.text = [self.textView.text stringByAppendingString:identifier];
    
}

@end
