//
//  ViewController.m
//  bi-ios-recognizers
//
//  Created by Dominik Vesely on 07/10/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "ViewController.h"
#import "GraphView.h"

@interface ViewController ()
@property (nonatomic,weak) GraphView* myGraph;
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
    
    
    [v addGestureRecognizer:tapGesture];
    [v addGestureRecognizer:doubleTapGesture];
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
    [self.view addSubview:v];
    
    GraphView* graph = [[GraphView alloc] initWithFrame:CGRectMake(10, 200, CGRectGetWidth(self.view.frame)-20, 200)];
    
    _myGraph = graph;
    
    [self.view addSubview:graph];
    
    
    
}

- (void) oneTap:(UITapGestureRecognizer*) recognizer {
    NSLog(@"OneTap");
}

- (void) doubleTap:(UITapGestureRecognizer*) recognizer {
    NSLog(@"DoubleTap");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperChanged:(UIStepper *)sender {
}
@end
