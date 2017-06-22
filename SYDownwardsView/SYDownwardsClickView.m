//
//  SYDownwardsClickView.m
//  SYDownwardsSift
//
//  Created by 666gps on 2017/6/22.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import "SYDownwardsClickView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SYDownwardsClickView
- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

#pragma mark - drawRect

- (void)drawRect:(CGRect)rect{
    [self drawInContext:UIGraphicsGetCurrentContext()];
}

- (void)drawInContext:(CGContextRef)context
{
    CGContextSetLineWidth(context, 2.0);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    [self getDrawPath:context];
    CGContextFillPath(context);
}

/**
 *  画menu
 *
 *  @param context context
 */
- (void)getDrawPath:(CGContextRef)context
{
    CGRect rrect = self.bounds;
    CGFloat radius = 6.0;
    CGFloat minx = CGRectGetMinX(rrect),
    maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect),
    maxy = CGRectGetMaxY(rrect);
    
    CGContextMoveToPoint(context, maxx-20, miny + 10);
    CGContextAddLineToPoint(context,maxx - 25, miny);
    CGContextAddLineToPoint(context,maxx - 30, miny + 10);
    
    CGContextAddArcToPoint(context, minx, miny + 10, minx, maxy, radius);
    CGContextAddArcToPoint(context, minx, maxy, maxx, maxy, radius);
    CGContextAddArcToPoint(context, maxx, maxy, maxx, miny + 10, radius);
    CGContextAddArcToPoint(context, maxx, miny + 10, maxx-20, miny + 10, radius);
    CGContextClosePath(context);
}


@end
