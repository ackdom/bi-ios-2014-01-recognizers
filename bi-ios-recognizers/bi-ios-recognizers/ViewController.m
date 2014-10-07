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
    
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(10, 20, 100, 100)];
    v.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTap:)];
    [v addGestureRecognizer:tapGesture];
    
    UITapGestureRecognizer* doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    
    
    
    doubleTapGesture.numberOfTapsRequired = 2;
    [v addGestureRecognizer:doubleTapGesture];
    
    //nejdriv selze double tap a pak nas zajima one tap
    [tapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
    [self.view addSubview:v];
    
    
}

- (void) oneTap:(UIGestureRecognizer*) recognizer {
    NSLog(@"OneTap");
}

- (void) doubleTap:(UIGestureRecognizer*) recognizer {
    NSLog(@"DoubleTap");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
