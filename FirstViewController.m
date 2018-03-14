//
//  FirstViewController.m
//  CustomTransition
//
//  Created by Ze yang on 2018/3/13.
//  Copyright © 2018年 Ze yang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.view.frame = CGRectMake((width - 300)/2.0, (height - 300)/2.0, 300, 300);
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [btn addTarget:self action:@selector(didaction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
}

- (CGSize)preferredContentSize {
    
    return CGSizeMake(100, 100);
}

- (void)didaction {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
