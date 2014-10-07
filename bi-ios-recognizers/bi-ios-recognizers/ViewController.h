//
//  ViewController.h
//  bi-ios-recognizers
//
//  Created by Dominik Vesely on 07/10/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"


@interface ViewController : UIViewController

- (IBAction)stepperChanged:(UIStepper *)sender;
@property (weak, nonatomic) IBOutlet UILabel *amplitudeLabel;
@property (nonatomic,weak)  IBOutlet GraphView* myGraph;

@end

