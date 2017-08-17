//
//  TechnicalController.m
//  Gravitas
//
//  Created by Keshav Bansal on 22/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import "TechnicalController.h"

@interface TechnicalController ()

@end

@implementation TechnicalController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(IBAction)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)event:(id)sender
{
    UIButton *btn=sender;
    EventsViewController *eve=[self.storyboard instantiateViewControllerWithIdentifier:@"EventTable"];
    eve.type=(int)btn.tag;
    [self presentViewController:eve animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
