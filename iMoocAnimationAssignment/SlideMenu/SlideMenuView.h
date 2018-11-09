//
//  SlideMenuView.h
//  iMoocAnimationAssignment
//
//  Created by Renrui Liu on 5/11/18.
//  Copyright © 2018 Renrui Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SlideMenuDelegate <NSObject>
@optional
- (void) didSelectAnimationType:(NSInteger )index;
@end

@interface SlideMenuView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) id <SlideMenuDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
