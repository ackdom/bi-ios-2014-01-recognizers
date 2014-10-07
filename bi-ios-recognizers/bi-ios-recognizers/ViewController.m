//
//  ViewController.m
//  bi-ios-recognizers
//
//  Created by Dominik Vesely on 07/10/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(10, 20, 100, 100)];
    v.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTap:)];
    
    UITapGestureRecognizer* doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    
    UIPanGestureRecognizer* panReco = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    
    [v addGestureRecognizer:tapGesture];
    [v addGestureRecognizer:doubleTapGesture];
    [v addGestureRecognizer:panReco];
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
    [self.view addSubview:v];
    /*
    GraphView* graph = [[GraphView alloc] initWithFrame:CGRectMake(10, 200, CGRectGetWidth(self.view.frame)-20, 200)];
    graph.backgroundColor = [UIColor lightGrayColor];
   
    _myGraph = graph;
    
    [self.view addSubview:graph];
    */
    
    
    
    
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

- (IBAction)stepperChanged:(UIStepper *)sender {
    _myGraph.amp = sender.value;
    _amplitudeLabel.text = [NSString stringWithFormat:@"%d",_myGraph.amp];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
