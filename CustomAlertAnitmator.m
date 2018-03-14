//
//  CustomAlertAnitmator.m
//  CustomTransition
//
//  Created by Ze yang on 2018/3/13.
//  Copyright © 2018年 Ze yang. All rights reserved.
//

#import "CustomAlertAnitmator.h"

@implementation CustomAlertAnitmator

// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 1.0;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
// 设置动画的进行方式
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *containerView = transitionContext.containerView;

    UIView *coverView = [[UIView alloc] initWithFrame:containerView.bounds];
    coverView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.3];
    [containerView addSubview:coverView];
    
    // custom 模式下 直接使用viewforkey: presentingView会返回nil
    UIViewController *presentedvc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *presentingvc  =[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = presentingvc.view;
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    toView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    [containerView addSubview:toView];
    
    CGFloat duration = [self transitionDuration:transitionContext];
    // 使用spring动画，有弹簧效果，动画结束后一定要调用completeTransition方法
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        BOOL wascancel = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wascancel];
    }];
    
    
}


@end
