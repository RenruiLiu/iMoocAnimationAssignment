
//
//  TransitionAnimation.m
//  iMoocAnimationAssignment
//
//  Created by Renrui Liu on 7/11/18.
//  Copyright © 2018 Renrui Liu. All rights reserved.
//

#import "TransitionAnimation.h"
#import "AnimationViewController.h"


@interface TransitionAnimation ()
@end

@implementation TransitionAnimation

//kCATransitionFade 渐变
//kCATransitionMoveIn A移进覆盖B
//kCATransitionPush A推走B
//kCATransitionReveal 拉开
//@"cameraIris" 照相机关闭打开
//@"cameraIrisHollowOpen"
//@"cameraIrisHollowClose"
//@"cube" 立方体
//@"alignedCube"
//@"flip" 像卡牌翻面
//@"alignedFlip"
//@"oglFlip"
//@"rotate" 顺时针转90度
//@"pageCurl" 翻页
//@"pageUnCurl"
//@"rippleEffect" 水滴
//@"suckEffect" 被吸走

+ (NSInteger)transitionWithIndex:(NSInteger)currentIndex container:(UIView *)container subView1:(UIImageView *)subView1 subView2:(UIImageView *)subView2 typeIndex:(NSInteger)typeIndex direction :(CATransitionSubtype) direction{
    
    NSArray* animationArray = [NSArray arrayWithObjects:@"rippleEffect",
                               kCATransitionMoveIn,
                               @"cube",
                               @"suckEffect",
                               @"flip",
                               @"pageCurl",
                               kCATransitionFade,
                               nil];
    
    NSInteger newIndex = [self getNewIndex:currentIndex];
    [self settingImage:container newIndex:newIndex subView1:subView1 subView2:subView2];
    
    CATransition *animation = [CATransition animation];
    animation.duration = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    animation.type = animationArray[typeIndex];
    animation.subtype = direction;

    [container.layer addAnimation:animation forKey:@"animationKey"];
    [container exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    return newIndex;
}

+ (NSInteger)transitionWithIndex:(NSInteger)currentIndex container:(UIView *)container subView1:(UIImageView *)subView1 subView2:(UIImageView *)subView2 typeIndex:(NSInteger)typeIndex{
 
    return [TransitionAnimation transitionWithIndex:currentIndex container:container subView1:subView1 subView2:subView2 typeIndex:typeIndex direction:kCATransitionFromRight];
}

+(NSInteger)getNewIndex:(NSInteger)currentIndex{
    NSInteger newIndex = currentIndex + 1;
    if (newIndex > 6) {newIndex = 0;}
    return newIndex;
}

+ (void)settingImage:(UIView * _Nonnull)container newIndex:(NSInteger)newIndex subView1:(UIImageView * _Nonnull)subView1 subView2:(UIImageView * _Nonnull)subView2 {
    NSString *imageName = [NSString stringWithFormat:@"image%ld",(long)newIndex];
    
    if (container.subviews[0] == subView1) {
        subView1.image = [UIImage imageNamed:imageName];
    } else {
        subView2.image = [UIImage imageNamed:imageName];
    }
}


@end
