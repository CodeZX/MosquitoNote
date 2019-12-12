//
//  MNFileDirectoryViewController.m
//  MosquitoNote
//
//  Created by 周鑫 on 2019/9/23.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "MNFileDirectoryViewController.h"
#import "MNNoteModel.h"
@interface MNFileDirectoryViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong)NSArray *dataSource;
@end

@implementation MNFileDirectoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setupUI];
    [self setupData];
}

- (void)setupUI {
    
    self.title = @"文件目录";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClick:)];

    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate  = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

}

- (void)setupData  {
    
    self.dataSource = [[MNFileManage shareManage] noteList];
    [self.tableView reloadData];
    
}

- (void)leftBarButtonClick:(id)snder {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark -------------------------- tableView delegate ----------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * const cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    MNNoteModel *noteModel = self.dataSource[indexPath.row];
    cell.textLabel.text = noteModel.content;
    return cell;
}


@end
