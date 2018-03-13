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
    UIViewController *fromViewController = [transitionContext viewForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    toView.frame = CGRectMake(fromView.frame.origin.x, fromView.frame.size.height/2, fromView.frame.size.height, fromView.frame.size.height);
    toView.alpha = 0;
    [containerView addSubview:toView];
    
    CGFloat duration = [self transitionDuration:transitionContext];
    // 使用spring动画，有弹簧效果，动画结束后一定要调用completeTransition方法
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toView.alpha = 1.0;
        toView.frame = fromView.frame;
    } completion:^(BOOL finished) {
        BOOL wascancel = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wascancel];
    }];
    
    
}


@end
