//
//  SYDownwardsView.m
//  SYDownwardsSift
//
//  Created by 666gps on 2017/6/22.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import "SYDownwardsView.h"
#import "SYDownwardsClickView.h"

#define WindowWidth  [[UIScreen mainScreen] bounds].size.width
#define WindowHeight  [[UIScreen mainScreen] bounds].size.height

@implementation SYDownwardsView

-(instancetype)initWithFrame:(CGRect)frame ClickArray:(NSArray *)array{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArray = array;
        self.backgroundColor = [UIColor clearColor];
        [self creatClickView];
    }
    return self;
}
-(void)creatClickView{
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, WindowWidth, WindowHeight);
    backButton.backgroundColor = [UIColor blackColor];
    [backButton addTarget:self action:@selector(removeSelf) forControlEvents:UIControlEventTouchUpInside];
    backButton.alpha = 0.2;
    [self addSubview:backButton];

    SYDownwardsClickView * clickView = [[SYDownwardsClickView alloc] initWithFrame:CGRectMake(WindowWidth - 108, 64, 100, _dataArray.count * 40 + 10)];
    for (int i = 0; i < _dataArray.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10 + (39 * i), 100, 39)];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.tag = 16500 + i;
        [btn setTitle:_dataArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [clickView addSubview:btn];
        if (i != _dataArray.count - 1) {
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, 10 + (39 * (i + 1)), 80, 1)];
            line.backgroundColor = [UIColor grayColor];
            [clickView addSubview:line];
        }
    }
    [self addSubview:clickView];
}
-(void)removeSelf{
    [self removeFromSuperview];
}
-(void)buttonAction:(UIButton *)sender{
    if (_delegate) {
        [_delegate ClickNumber:sender.tag - 16500];
        [self removeFromSuperview];
    }
}
@end
