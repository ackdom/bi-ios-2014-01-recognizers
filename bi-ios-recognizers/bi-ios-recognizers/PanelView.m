//
//  PanelView.m
//  BI-iOS-2013_03-Drawing
//
//  Created by Jakub Hladík on 07.10.13.
//  Copyright (c) 2013 FIT CTU. All rights reserved.
//

#import "PanelView.h"

@interface PanelView ()

@property (weak, nonatomic) UISlider *slider;
@property (weak, nonatomic) UIStepper *stepper;

@end

@implementation PanelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightGrayColor];
        
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectZero];
        slider.minimumValue = 0;
        slider.maximumValue = 15;
        [slider addTarget:self
                   action:@selector(sliderValueChanged:)
         forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:slider];
        self.slider = slider;
        
        UIStepper* stepper = [[UIStepper alloc] initWithFrame:CGRectZero];
        stepper.minimumValue = 0;
        stepper.maximumValue = 15;
        stepper.stepValue = 0.5;
        [stepper addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventTouchUpInside];
        self.stepper = stepper;
        [self addSubview:stepper];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:(1/30)
                                                        target:self
                                                      selector:@selector(timerFired:)
                                                      userInfo:@"I am timer!"
                                                       repeats:YES];
        
        
        
        //po 5 vterinach stopne Timer
        [self performSelector:@selector(invalidateTimer:)
                   withObject:@{ @"timer" : timer,
                               }
                   afterDelay:5];
        

     }
    return self;
}

- (void)invalidateTimer:(NSDictionary *)userInfo
{
    NSTimer *timer = userInfo[@"timer"];
    [timer invalidate];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.slider.frame = CGRectMake(8, 8, CGRectGetWidth(self.bounds) - 16, 44);
    self.stepper.frame = CGRectMake(8, 8 + 44+ 8, CGRectGetWidth(self.bounds) - 16, 44);

}

#pragma mark - Actions

- (void)timerFired:(NSTimer *)timer {
    CGFloat value = self.slider.value;
    value += 0.01;
    self.slider.value = value;
    self.stepper.value = value;
    [self sliderValueChanged:self.slider];
}

- (void)stepperValueChanged:(id)object {
    UIStepper *stepper = (UIStepper *)object;
    
    if ([self.delegate respondsToSelector:@selector(panelView:sliderChanged:)]) {
        [self.delegate panelView:self
                   stepperValueChanged:stepper];
    }
    
    self.slider.value = stepper.value;

}

- (void)sliderValueChanged:(id)object // UISlider *slider
{
    UISlider *slider = (UISlider *)object;

    if ([self.delegate respondsToSelector:@selector(panelView:sliderChanged:)]) {
        [self.delegate panelView:self
                   sliderChanged:slider];
    }
    
    if (self.onSliderChange) {
        self.onSliderChange(slider.value);
    }
    
    self.stepper.value = slider.value;

}

@end
