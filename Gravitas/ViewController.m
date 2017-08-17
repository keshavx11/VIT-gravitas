//
//  ViewController.m
//  Gravitas
//
//  Created by Keshav Bansal on 17/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pic = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateTime)
                                           userInfo:nil
                                            repeats:YES];
    des=[NSDate dateWithTimeIntervalSince1970:1443148200];
    timer2 = [NSTimer scheduledTimerWithTimeInterval:3.0
                                             target:self
                                           selector:@selector(updateImage)
                                           userInfo:nil
                                            repeats:YES];
    images=[NSArray arrayWithObjects:[UIImage imageNamed:@"vit1.gif"],[UIImage imageNamed:@"vit2.gif"],[UIImage imageNamed:@"vit3.gif"],[UIImage imageNamed:@"vit4.gif"],[UIImage imageNamed:@"vit5.gif"],nil];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)updateImage
{
    [UIView transitionWithView:imageView
                      duration:2.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{imageView.image =[images objectAtIndex:pic]; }
                    completion:NULL];
    pic++;
    if (pic==5) {
        pic=0;
    }
}
-(IBAction)tShirts
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"graVITas T-shirts" message:@"Please visit our website info.vit.ac.in/gravitas2015 for booking!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];

}
-(IBAction)event:(id)sender
{
    UIButton *btn=sender;
    if (btn.tag==3) {
    TechnicalController *tech=[self.storyboard instantiateViewControllerWithIdentifier:@"TechnicalView"];
        [self presentViewController:tech animated:YES completion:nil];
    }
    if (btn.tag==6) {
        TechnicalController *tech=[self.storyboard instantiateViewControllerWithIdentifier:@"NonTech"];
        [self presentViewController:tech animated:YES completion:nil];
    }
    else
    {
    EventsViewController *eve=[self.storyboard instantiateViewControllerWithIdentifier:@"EventTable"];
    eve.type=(int)btn.tag;
    [self presentViewController:eve animated:YES completion:nil];
    }
}
-(void)updateTime
{
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    int units = (NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
    NSDateComponents *components= [calendar components:units fromDate:[NSDate date] toDate:des options:0];
    [countdownLabel setText:[NSString stringWithFormat:@"%lddays:%ldh:%ldm:%lds",(long)[components day],(long)[components hour],(long)[components minute],(long)[components second]]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
