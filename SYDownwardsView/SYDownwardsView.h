//
//  SYDownwardsView.h
//  SYDownwardsSift
//
//  Created by 666gps on 2017/6/22.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SYDownwardsViewDelegate <NSObject>

/**
选中数组的第几个
 */
-(void)ClickNumber:(NSInteger)click;

@end


@interface SYDownwardsView : UIView

@property (nonatomic,weak) id<SYDownwardsViewDelegate>delegate;
@property (nonatomic,copy) NSArray * dataArray;

-(instancetype)initWithFrame:(CGRect)frame ClickArray:(NSArray *)array;

@end
