//
//  AnimationViewController.m
//  iMoocAnimationAssignment
//
//  Created by Renrui Liu on 5/11/18.
//  Copyright © 2018 Renrui Liu. All rights reserved.
//

#import "AnimationViewController.h"
#import "BasicAnimation.h"
#import "TransitionAnimation.h"
#import "KeyFrameAnimation.h"

@interface AnimationViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (nonatomic) NSInteger currentImageIndex;
@property (nonatomic) NSArray* animationSubTypes;
@property (nonatomic) NSArray* animationTypes;
@end

@implementation AnimationViewController

- (NSArray *)animationTypes{
    if (_animationTypes) {
        return _animationTypes;
    }
    _animationTypes = [NSArray arrayWithObjects:@"基础动画",@"转场动画",@"关键帧动画", nil];
    return _animationTypes;
}

- (NSArray *)animationSubTypes{
    if (_animationSubTypes) {
        return _animationSubTypes;
    }
    NSArray* basicAnimation = [NSArray arrayWithObjects:@"位移",@"缩放",@"透明度",@"旋转",@"组合动画", nil];
    NSArray* transitionAnimation = [NSArray arrayWithObjects:@"波浪",@"从上往下",@"立体翻滚",@"收缩",@"翻转",@"翻页",@"逐渐消失", nil];
    NSArray* keyFrameAnimation = [NSArray arrayWithObjects:@"关键帧",@"路径",@"抖动", nil];

    _animationSubTypes = [NSArray arrayWithObjects:basicAnimation,transitionAnimation,keyFrameAnimation, nil];
    return _animationSubTypes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:panGesture];
}

- (void)setupUI {
    self.currentImageIndex = 0;
    NSString *imageName = [NSString stringWithFormat:@"image%ld",(long)self.currentImageIndex];
    self.imageView1.image = [UIImage imageNamed:imageName];
    self.titleLabel.text = self.animationTypes[self.typeIndex];
    NSArray* types = [self.animationSubTypes objectAtIndex:self.typeIndex];
    
    for (int i = 0; i < types.count; i++) {
        UIButton *button = (UIButton *)[self.buttons objectAtIndex:i];
        button.layer.cornerRadius = 16;
        button.hidden = NO;
        [button setTitle:types[i] forState:UIControlStateNormal];
    }
}

-(void)handlePan:(UIPanGestureRecognizer*)sender{
    CGPoint translation = [sender translationInView:self.view];
    if(translation.x > 0){
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)gobackToMainVC:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)touchButton:(UIButton *)sender {
    NSString* title = sender.titleLabel.text;
    
    // 基础
    if ([title isEqual: self.animationSubTypes[0][0]]) {
        [BasicAnimation moveAnimation:self.containerView];
    } else if ([title isEqual: self.animationSubTypes[0][1]]){
        [BasicAnimation scaleAnimation:self.containerView];
    } else if ([title isEqual: self.animationSubTypes[0][2]]){
        [BasicAnimation alphaAnimation:self.containerView];
    } else if ([title isEqual: self.animationSubTypes[0][3]]){
        [BasicAnimation rotationAnimation:self.containerView];
    } else if ([title isEqual: self.animationSubTypes[0][4]]){
        [BasicAnimation combinationAnimation:self.containerView];
    }
    
    // 转场
    else if ([title isEqual: self.animationSubTypes[1][0]]){
        self.currentImageIndex = [TransitionAnimation transitionWithIndex:self.currentImageIndex container:self.containerView subView1:self.imageView1 subView2:self.imageView2 typeIndex:0];
    } else if ([title isEqual: self.animationSubTypes[1][1]]){
        self.currentImageIndex = [TransitionAnimation transitionWithIndex:self.currentImageIndex container:self.containerView subView1:self.imageView1 subView2:self.imageView2 typeIndex:1 direction:kCATransitionFromBottom];
    }else if ([title isEqual: self.animationSubTypes[1][2]]){
        self.currentImageIndex = [TransitionAnimation transitionWithIndex:self.currentImageIndex container:self.containerView subView1:self.imageView1 subView2:self.imageView2 typeIndex:2 direction:kCATransitionFromBottom];
    }else if ([title isEqual: self.animationSubTypes[1][3]]){
        self.currentImageIndex = [TransitionAnimation transitionWithIndex:self.currentImageIndex container:self.containerView subView1:self.imageView1 subView2:self.imageView2 typeIndex:3];
    }else if ([title isEqual: self.animationSubTypes[1][4]]){
        self.currentImageIndex = [TransitionAnimation transitionWithIndex:self.currentImageIndex container:self.containerView subView1:self.imageView1 subView2:self.imageView2 typeIndex:4];
    }else if ([title isEqual: self.animationSubTypes[1][5]]){
        self.currentImageIndex = [TransitionAnimation transitionWithIndex:self.currentImageIndex container:self.containerView subView1:self.imageView1 subView2:self.imageView2 typeIndex:5];
    }else if ([title isEqual: self.animationSubTypes[1][6]]){
        self.currentImageIndex = [TransitionAnimation transitionWithIndex:self.currentImageIndex container:self.containerView subView1:self.imageView1 subView2:self.imageView2 typeIndex:6];
    }

    // 关键帧
    else if ([title isEqual: self.animationSubTypes[2][0]]){
        [KeyFrameAnimation keyFrameAnimation:self.containerView];
    } else if ([title isEqual: self.animationSubTypes[2][1]]){
        [KeyFrameAnimation pathAnimation:self.containerView];
    } else if ([title isEqual: self.animationSubTypes[2][2]]){
        [KeyFrameAnimation shakeAnimation:self.containerView];
    }
}

@end
