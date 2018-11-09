//
//  ViewController.m
//  iMoocAnimationAssignment
//
//  Created by Renrui Liu on 5/11/18.
//  Copyright © 2018 Renrui Liu. All rights reserved.
//

#import "MainViewController.h"
#import "SlideMenuView.h"
#import "UIView+SDAutoLayout.h"
#import "AnimationViewController.h"

@interface MainViewController ()<SlideMenuDelegate>{
    SlideMenuView* slideMenu;
    UIView *middleView;
    BOOL isSlideMenuShowing;
    UIView *maskView;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self addGestures];
    [self addSlideMenu];
}

//MARK:- setup

-(void)setupUI{
    middleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    [self.view addSubview:middleView];
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 70)];
    headView.backgroundColor = [UIColor cyanColor];
    [middleView addSubview:headView];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"动画作业";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:titleLabel];
    titleLabel.sd_layout.bottomSpaceToView(headView, 8).autoHeightRatio(0).leftSpaceToView(headView,100).rightSpaceToView(headView, 100);
    
    UILabel *centerLabel = [[UILabel alloc]init];
    centerLabel.text = @"从左向右滑动显示侧滑菜单";
    centerLabel.textAlignment = NSTextAlignmentCenter;
    [middleView addSubview:centerLabel];
    centerLabel.sd_layout.centerXEqualToView(middleView).autoHeightRatio(0).centerYEqualToView(middleView).widthIs(300);
    
    maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    maskView.backgroundColor = [UIColor grayColor];
    maskView.alpha = 0;
    [middleView addSubview:maskView];
    
    
}

-(void)addGestures{
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:panGesture];
    [slideMenu addGestureRecognizer:panGesture];
}


- (void)addSlideMenu {
    slideMenu = [[SlideMenuView alloc]initWithFrame:CGRectMake(-300, -50, 300, self.view.height + 50)];
    slideMenu.delegate = self;
    [self.view addSubview:slideMenu];
}

-(void)handlePanGesture:(UIPanGestureRecognizer*)sender{
    CGPoint translation = [sender translationInView:self.view];
    
    if (!isSlideMenuShowing) {
        //侧滑菜单隐藏时
        //middleView不能超出右边边框，slideMenu不能超出左边
        if (translation.x > 300 || translation.x < 0 ) {return;}
        
        if (sender.state == UIGestureRecognizerStateChanged) {
            middleView.transform = CGAffineTransformMakeTranslation(translation.x, 0);
            slideMenu.transform = CGAffineTransformMakeTranslation(translation.x, 0);
            maskView.alpha = translation.x / 375;
        } else if (sender.state == UIGestureRecognizerStateEnded) {
            
            [UIView animateWithDuration:0.25 animations:^{
                //滑动幅度小于150则隐藏，大于则显示
                self->slideMenu.transform = CGAffineTransformIdentity;
                self->middleView.transform = CGAffineTransformIdentity;
                if (translation.x > 150) {
                    self->slideMenu.transform = CGAffineTransformMakeTranslation(300, 0);
                    self->middleView.transform = CGAffineTransformMakeTranslation(300, 0);
                    self->maskView.alpha = 0.8;
                    self->isSlideMenuShowing = YES;
                } else {
                    self->maskView.alpha = 0;
                    self->isSlideMenuShowing = NO;}
            }];
        }
    } else {
        //侧滑菜单显示时
        //middleView不能超出右边边框，slideMenu不能超出左边
        if (translation.x < -300 || translation.x > 0){return;}
        
        if (sender.state == UIGestureRecognizerStateChanged) {
            //makeTranslation是 tovalue, 不是byValue
            middleView.transform = CGAffineTransformMakeTranslation(300+translation.x, 0);
            slideMenu.transform = CGAffineTransformMakeTranslation(300+translation.x, 0);
        } else if (sender.state == UIGestureRecognizerStateEnded) {
            [UIView animateWithDuration:0.25 animations:^{
                //向左收回滑动幅度小于100则还是显示，大于则收回
                self->slideMenu.transform = CGAffineTransformMakeTranslation(300, 0);
                self->middleView.transform = CGAffineTransformMakeTranslation(300, 0);
                if (translation.x < -100) {
                    self->slideMenu.transform = CGAffineTransformIdentity;
                    self->middleView.transform = CGAffineTransformIdentity;
                    self->maskView.alpha = 0;
                    self->isSlideMenuShowing = NO;
                } else {
                    self->maskView.alpha = 0.8;
                    self->isSlideMenuShowing = YES;}
            }];
        }
    }
    

}

- (void)didSelectAnimationType:(NSInteger)index{
    AnimationViewController *animationVC = [[AnimationViewController alloc]init];
    animationVC.typeIndex = index;
    [self.navigationController pushViewController:animationVC animated:YES];
    
    // mainView 恢复原样
    slideMenu.transform = CGAffineTransformIdentity;
    middleView.transform = CGAffineTransformIdentity;
    maskView.alpha = 0;
    isSlideMenuShowing = NO;
}



@end
