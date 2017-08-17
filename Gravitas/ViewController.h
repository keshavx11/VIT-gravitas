//
//  ViewController.h
//  Gravitas
//
//  Created by Keshav Bansal on 17/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventsViewController.h"
#import "TechnicalController.h"

@interface ViewController : UIViewController
{
    int pic;
    IBOutlet UILabel *countdownLabel;
    NSDate *des;
    NSTimer *timer,*timer2;
    IBOutlet UIImageView *imageView;
    NSArray *images;
}

-(IBAction)event:(id)sender;
-(IBAction)tShirts;

@end

