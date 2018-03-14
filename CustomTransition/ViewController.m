//
//  ViewController.m
//  CustomTransition
//
//  Created by Ze yang on 2018/3/13.
//  Copyright © 2018年 Ze yang. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "CustomTransitionDelegate.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.transitioningDelegate = self;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [btn addTarget:self action:@selector(didaction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didaction {
//    lazy var customPresentationController: CustomPresentationController = [CustomPresentationController(presentedViewController: self.customPresentationSecondViewController, presentingViewController: self)
    
   FirstViewController *firstVc = [[FirstViewController alloc] init];
    CustomTransitionDelegate *delegate = [[CustomTransitionDelegate alloc] init];
    firstVc.modalPresentationStyle = UIModalPresentationCustom;
    firstVc.transitioningDelegate = delegate;;
    [self presentViewController:firstVc animated:YES completion:^{
        
    }];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
