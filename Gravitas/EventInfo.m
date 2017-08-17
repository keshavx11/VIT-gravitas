//
//  EventInfo.m
//  Gravitas
//
//  Created by Keshav Bansal on 17/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import "EventInfo.h"

@interface EventInfo ()

@end

@implementation EventInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tid=[self.dict valueForKey:@"tid"];
    name.text = [self.dict valueForKey:@"name"];
    description.text=[self.dict valueForKey:@"description"];
    club.text=[self.dict valueForKey:@"organisation"];
    time.text=[self.dict valueForKey:@"timings"];
    location.text=[self.dict valueForKey:@"location"];
    team.text=[self.dict valueForKey:@"team"];
    [date setText:[NSString stringWithFormat:@"%@ sept 2015",[self.dict valueForKey:@"dates"]]];
    [cname1 setText:[NSString stringWithFormat:@"%@: %@",[self.dict valueForKey:@"cname1"],[self.dict valueForKey:@"cno1"]]];
    [cname2 setText:[NSString stringWithFormat:@"%@: %@",[self.dict valueForKey:@"cname2"],[self.dict valueForKey:@"cno2"]]];
    [fee setText:[NSString stringWithFormat:@"Rs. %@",[self.dict valueForKey:@"fee"]]];
    [self backselect];
    // Do any additional setup after loading the view.
}
-(void)backselect{
    if ([self.tid isEqualToString:@"1"]) {
        background.image=[UIImage imageNamed:@"premium copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"2"]) {
        background.image=[UIImage imageNamed:@"robo copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"3"]) {
        background.image=[UIImage imageNamed:@"bits copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"4"]) {
        background.image=[UIImage imageNamed:@"engineering copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"5"]) {
        background.image=[UIImage imageNamed:@"management copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"6"]) {
        background.image=[UIImage imageNamed:@"informal copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"7"]) {
        background.image=[UIImage imageNamed:@"builtrix copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"8"]) {
        background.image=[UIImage imageNamed:@"circuit copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"9"]) {
        background.image=[UIImage imageNamed:@"quiz copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"10"]) {
        background.image=[UIImage imageNamed:@"online copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"11"]) {
        background.image=[UIImage imageNamed:@"bio copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"12"]) {
        background.image=[UIImage imageNamed:@"workshop copy.jpg"];
    }
    else if ([self.tid isEqualToString:@"13"]) {
        background.image=[UIImage imageNamed:@"school copy.jpg"];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
