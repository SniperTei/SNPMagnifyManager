//
//  MyTableController.m
//  SNPMagnifyManagerOC
//
//  Created by zhengnan on 2024/12/11.
//

#import "MyTableController.h"
#import "SNPMagnifyManager.h"

@interface MyTableController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation MyTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", nil];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

    SNPMagnifyManager *manager = [SNPMagnifyManager sharedManager];
    [manager setupMagnifyWithOperateView:CGRectMake(100, 300, 100, 100) limitRect:CGRectMake(0, 0, 300, 300)];
    [manager setupMagnifyWithDisplayView:CGRectMake(100, 200, 100, 100)];
    // [manager setupMagnifyWithOperateView:CGRectMake(100, 300, 50, 50) displayView:CGRectMake(100, 200, 100, 100)];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

@end
