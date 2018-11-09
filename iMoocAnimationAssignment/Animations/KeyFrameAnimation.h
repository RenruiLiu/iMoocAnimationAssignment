//
//  KeyFrameAnimation.h
//  iMoocAnimationAssignment
//
//  Created by Renrui Liu on 8/11/18.
//  Copyright © 2018 Renrui Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeyFrameAnimation : NSObject
+(void)keyFrameAnimation:(UIView*)view;
+(void)pathAnimation:(UIView*)view;
+(void)shakeAnimation:(UIView*)view;
@end

NS_ASSUME_NONNULL_END
