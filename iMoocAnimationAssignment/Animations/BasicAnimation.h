//
//  BasicAnimation.h
//  iMoocAnimationAssignment
//
//  Created by Renrui Liu on 6/11/18.
//  Copyright © 2018 Renrui Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasicAnimation : NSObject
+(void)moveAnimation:(UIView*)view;
+(void)scaleAnimation:(UIView*)view;
+(void)alphaAnimation:(UIView*)view;
+(void)rotationAnimation:(UIView*)view;
+(void)combinationAnimation:(UIView*)view;


@end

NS_ASSUME_NONNULL_END
