//
//  GraphView.m
//  bi-ios-recognizers
//
//  Created by Dominik Vesely on 07/10/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _amp = 1;
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    
    // CGContextFillRect(context, CGRectMake(, 8, 100, 100));
    //[[UIColor whiteColor] setFill]; // setStroke
    
    
    CGContextMoveToPoint(context, 0, CGRectGetHeight(self.bounds) / 2.0);
    for (double i = 0; i < CGRectGetWidth(self.frame); i += 2) {
        
        int y = self.amp * 20 * sinf(i) + CGRectGetHeight(self.bounds) / 2.0;
        CGContextAddLineToPoint(context, i, y);
    }
    
    CGContextStrokePath(context);
}


@end
