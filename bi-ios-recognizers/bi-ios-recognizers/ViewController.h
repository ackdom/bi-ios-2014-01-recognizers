//
//  ViewController.h
//  bi-ios-recognizers
//
//  Created by Dominik Vesely on 07/10/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"
#import "PanelView.h"


@interface ViewController : UIViewController <PanelViewDelegate>

- (IBAction)stepperChanged:(UIStepper *)sender;
@property (weak, nonatomic) IBOutlet UILabel *amplitudeLabel;

@end

