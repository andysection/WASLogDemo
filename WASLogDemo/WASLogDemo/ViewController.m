//
//  ViewController.m
//  WASLogDemo
//
//  Created by Tory on 31/1/19.
//  Copyright © 2019年 section. All rights reserved.
//

#import "ViewController.h"
#import "WASTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switchTurn;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController
- (IBAction)switchAction:(id)sender {
    NSLog(@"switch");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 100, 80, 80);
    [btn setTitle:@"BUTTON" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _testLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.testLabel addGestureRecognizer:tap];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(panAction)];
    [self.testLabel addGestureRecognizer:pan];
}

- (void)panAction {
    NSLog(@"panAction！");
}

- (void)tapAction {
    NSLog(@"tapAction！");
}
- (void)clickAction:(UIButton *)sender {
    NSLog(@"click!");
    WASTableViewController *vc = [[WASTableViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
