//
//  TransitionAnimation.h
//  iMoocAnimationAssignment
//
//  Created by Renrui Liu on 7/11/18.
//  Copyright © 2018 Renrui Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TransitionAnimation : NSObject
+ (NSInteger)transitionWithIndex:(NSInteger)currentIndex container:(UIView *)container subView1:(UIImageView *)subView1 subView2:(UIImageView *)subView2 typeIndex:(NSInteger)typeIndex direction:(CATransitionSubtype) direction;

+ (NSInteger)transitionWithIndex:(NSInteger)currentIndex container:(UIView *)container subView1:(UIImageView *)subView1 subView2:(UIImageView *)subView2 typeIndex:(NSInteger)typeIndex;
@end

NS_ASSUME_NONNULL_END
