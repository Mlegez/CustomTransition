//
//  CustomTransitionDelegate.m
//  CustomTransition
//
//  Created by Ze yang on 2018/3/15.
//  Copyright © 2018年 Ze yang. All rights reserved.
//

#import "CustomTransitionDelegate.h"
#import "CustomAlertAnitmator.h"

@implementation CustomTransitionDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[CustomAlertAnitmator alloc] init];
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    return [[CustomAlertAnitmator alloc] init];
}

@end
