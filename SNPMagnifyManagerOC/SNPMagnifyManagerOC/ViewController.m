//
//  ViewController.m
//  SNPMagnifyManagerOC
//
//  Created by zhengnan on 2024/12/11.
//

#import "ViewController.h"
#import "MyTableController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"ViewController viewDidLoad");
    // self.navigationController
    NSLog(@"self.navigationController: %@", self.navigationController);

    // SNPMagnifyManager
    // SNPMagnifyManager *manager = [SNPMagnifyManager sharedManager];
    // [manager setupMagnifyWithOperateView:CGRectMake(100, 200, 100, 100) displayView:CGRectMake(100, 100, 100, 100)];
    // Button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)buttonAction:(UIButton *)button {
    NSLog(@"buttonAction");
    // 跳转
    MyTableController *tableController = [[MyTableController alloc] init];
    [self.navigationController pushViewController:tableController animated:YES];
}


@end
