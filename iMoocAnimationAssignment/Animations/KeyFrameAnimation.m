//
//  KeyFrameAnimation.m
//  iMoocAnimationAssignment
//
//  Created by Renrui Liu on 8/11/18.
//  Copyright © 2018 Renrui Liu. All rights reserved.
//

#import "KeyFrameAnimation.h"

@implementation KeyFrameAnimation

+ (void)keyFrameAnimation:(UIView *)view{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    
    NSValue* v1 = [NSValue valueWithCGPoint:CGPointZero];
    NSValue* v2 = [NSValue valueWithCGPoint:CGPointMake(300, 0)];
    NSValue* v3 = [NSValue valueWithCGPoint:CGPointMake(300, 600)];
    NSValue* v4 = [NSValue valueWithCGPoint:CGPointMake(0, 600)];
    animation.values = @[v1,v2,v3,v4,v1];
    animation.duration = 2;
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)pathAnimation:(UIView *)view{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 300, 0);
    CGPathAddLineToPoint(path, NULL, 0, 600);
    CGPathAddLineToPoint(path, NULL, 300, 600);
    CGPathAddLineToPoint(path, NULL, 0, 0);
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 2;
    animation.path = path;
    CFRelease(path);
    path = nil;
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)shakeAnimation:(UIView *)view{
    CAKeyframeAnimation *rotate = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.additive = YES; // Make the values relative to the current value
    rotate.values = @[@0.0 , @M_PI_4 , @0.0 , @(- M_PI_4), @0.0];
    rotate.duration = 0.2;
    rotate.repeatCount = 5;
    
    [view.layer addAnimation:rotate forKey:nil];
}

@end
