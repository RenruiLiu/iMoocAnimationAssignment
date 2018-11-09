//
//  SlideMenuView.m
//  iMoocAnimationAssignment
//
//  Created by Renrui Liu on 5/11/18.
//  Copyright © 2018 Renrui Liu. All rights reserved.
//

#import "SlideMenuView.h"
#import "UIView+SDAutoLayout.h"

@interface SlideMenuView(){
}
@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) NSArray* animationTypes;

@end

@implementation SlideMenuView

- (NSArray *)animationTypes{
    return [NSArray arrayWithObjects:@"基础动画",@"转场动画",@"关键帧动画", nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc]init];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self addSubview:self.tableView];
        self.tableView.sd_layout.topEqualToView(self).bottomEqualToView(self).rightEqualToView(self).leftEqualToView(self);
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.animationTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellID"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.animationTypes[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc]init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.frame.size.height * 0.3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]init];
    header.backgroundColor = [UIColor purpleColor];
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    [self.delegate didSelectAnimationType:indexPath.row];
}


@end
