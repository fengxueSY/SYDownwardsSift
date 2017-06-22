//
//  ViewController.m
//  SYDownwardsSift
//
//  Created by 666gps on 2017/6/21.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import "ViewController.h"
#import "SYDownwardsView.h"
@interface ViewController ()<SYDownwardsViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)rightBtnAction:(id)sender {
    SYDownwardsView * wardsView = [[SYDownwardsView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) ClickArray:@[@"科目一",@"科目二",@"科目三",@"科目四",@"科目五"]];
    wardsView.delegate = self;
    [self.view addSubview:wardsView];

}

-(void)ClickNumber:(NSInteger)click{
    NSLog(@"------ %ld",click);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
