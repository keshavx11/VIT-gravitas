//
//  aboutView.m
//  Gravitas
//
//  Created by Keshav Bansal on 18/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import "aboutView.h"

@interface aboutView ()

@end

@implementation aboutView

- (void)viewDidLoad {
    [super viewDidLoad];
    iV1.layer.cornerRadius = 45;
    iV1.layer.masksToBounds = YES;
    iV1.layer.borderWidth = 1.5;
    iV2.layer.cornerRadius = 45;
    iV2.layer.masksToBounds = YES;
    iV2.layer.borderWidth = 1.5;
    iV3.layer.cornerRadius = 45;
    iV3.layer.masksToBounds = YES;
    iV3.layer.borderWidth = 1.5;
    iV4.layer.cornerRadius = 45;
    iV4.layer.masksToBounds = YES;
    iV4.layer.borderWidth = 1.5;
    iV5.layer.cornerRadius = 45;
    iV5.layer.masksToBounds = YES;
    iV5.layer.borderWidth = 1.5;
    iV6.layer.cornerRadius = 45;
    iV6.layer.masksToBounds = YES;
    iV6.layer.borderWidth = 1.5;
    iV7.layer.cornerRadius = 45;
    iV7.layer.masksToBounds = YES;
    iV7.layer.borderWidth = 1.5;
    CGRect  screen      = [[UIScreen mainScreen] bounds];
    scrollView.contentSize=CGSizeMake(CGRectGetWidth(screen), MAX(CGRectGetHeight(screen), CGRectGetHeight(scrollView.frame)+320));
    // Do any additional setup after loading the view.
}
-(IBAction)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
