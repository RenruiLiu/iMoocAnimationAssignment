//
//  BasicAnimation.m
//  iMoocAnimationAssignment
//
//  Created by Renrui Liu on 6/11/18.
//  Copyright © 2018 Renrui Liu. All rights reserved.
//

#import "BasicAnimation.h"

@implementation BasicAnimation

static bool isAnimating;

+ (void)moveAnimation:(UIView *)view{
    if (isAnimating) {return;}
    isAnimating = YES;
    
    view.transform = CGAffineTransformMakeTranslation(-100, 0);

    [UIView animateWithDuration:3 animations:^{
        view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        isAnimating = NO;
    }];
}

+ (void)scaleAnimation:(UIView *)view{
    if (isAnimating) {return;}
    isAnimating = YES;

    //参数是倍数
    view.transform = CGAffineTransformMakeScale(2, 2);
    
    [UIView animateWithDuration:3 animations:^{
        view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        isAnimating = NO;
    }];
}

+ (void)alphaAnimation:(UIView *)view{
    if (isAnimating) {return;}
    isAnimating = YES;
    view.alpha = 1;
    
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            view.alpha = 1;
        } completion:^(BOOL finished) {
            isAnimating = NO;
        }];
    }];
}

+ (void)rotationAnimation:(UIView *)view{
    if (isAnimating) {return;}
    isAnimating = YES;
    
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        //makeRotation会计算最短完成的路径去动画，如果设置360度则不发生改变即没有动画
        view.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            isAnimating = NO;
        }];
    }];
}

+ (void)combinationAnimation:(UIView *)view{
    if (isAnimating) {return;}
    isAnimating = YES;
    
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        view.transform = CGAffineTransformMakeRotation(M_PI);
        view.transform = CGAffineTransformMakeTranslation(-1000, -1000);
        view.transform = CGAffineTransformMakeScale(0.2, 0.2);
        view.alpha = 0;
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
             view.transform = CGAffineTransformIdentity;
            view.alpha = 1;
        } completion:^(BOOL finished) {
            isAnimating = NO;
        }];
    }];
}


@end
