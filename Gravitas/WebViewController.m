//
//  WebViewController.m
//  Gravitas
//
//  Created by Keshav Bansal on 18/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url=[[NSURL alloc]initWithString:@"http://info.vit.ac.in/gravitas2015/#reservation_menu"];
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:url];
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    if (conn) {
        NSLog(@"Connection Successful");
    }
    else
        NSLog(@"Connection could not be made");
    [wv loadRequest:req];
    wv.hidden=NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Unable to connect!" message:@"You are not connected to the internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(IBAction)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
