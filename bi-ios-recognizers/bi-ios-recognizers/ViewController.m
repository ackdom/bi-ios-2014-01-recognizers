//
//  ViewController.m
//  bi-ios-recognizers
//
//  Created by Dominik Vesely on 07/10/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) GraphView *chartView;
@property (strong, nonatomic) PanelView *panelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(10, 400, 100, 100)];
    v.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTap:)];
    
    UITapGestureRecognizer* doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    
    UIPanGestureRecognizer* panReco = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    
    [v addGestureRecognizer:tapGesture];
    [v addGestureRecognizer:doubleTapGesture];
    [v addGestureRecognizer:panReco];
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
   
    
    // Do any additional setup after loading the view, typically from a nib.
    
    GraphView *chartView = [[GraphView alloc] initWithFrame:CGRectZero];
    chartView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
   // UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognized:)];
   // [chartView addGestureRecognizer:recognizer];
    
    [self.view addSubview:chartView];
    self.chartView = chartView;
    
    PanelView *panelview = [[PanelView alloc] initWithFrame:CGRectZero];
    panelview.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    panelview.delegate = self;
    [self.view addSubview:panelview];
    self.panelView = panelview;
    
    
    //pridam view
    [self.view addSubview:v];

 
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.chartView.frame = CGRectMake(8, 20 + 8, CGRectGetWidth(self.view.bounds) - 16, 200);
    self.panelView.frame = CGRectMake(8, 20 + 16 + 200, CGRectGetWidth(self.view.bounds) - 16, 128);
}



- (void) pan:(UIPanGestureRecognizer*) recognizer {
    
    CGPoint point = [recognizer translationInView:self.view];
    
    static CGPoint center;
    
    switch(recognizer.state) {
            
        case UIGestureRecognizerStateBegan: {
            center = recognizer.view.center;
            break;
        }
        case UIGestureRecognizerStateChanged: {
            recognizer.view.center = CGPointMake(point.x + center.x, point.y + center.y);
            break;
        }
        
        default:
            break;
            
    }
    
}

- (void) oneTap:(UITapGestureRecognizer*) recognizer {
    NSLog(@"OneTap");
}

- (void) doubleTap:(UITapGestureRecognizer*) recognizer {
    NSLog(@"DoubleTap");
}


- (void)panelView:(PanelView *)panelView stepperValueChanged:(UIStepper *)slider {
    self.chartView.amp = slider.value;

}

- (void)panelView:(PanelView *)panelView sliderChanged:(UISlider *)slider
{
   
    self.chartView.amp = slider.value;
}




@end
