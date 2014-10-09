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
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    return self;
}

- (void)awakeFromNib {
    _amp = 1;
    
}

- (void)setAmp:(CGFloat)amp {
    _amp = amp;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 2);
    
    CGContextMoveToPoint(context, 0, CGRectGetHeight(self.bounds) / 2.0);
    for (NSInteger i = 0; i < 900; i += 4) {
        CGContextAddLineToPoint(context, i, self.amp * 10* sinf(i) + CGRectGetHeight(self.bounds) / 2.0);
    }
    
    CGContextStrokePath(context);
}


@end
