//
//  EventInfo.h
//  Gravitas
//
//  Created by Keshav Bansal on 17/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventInfo : UIViewController
{
    IBOutlet UIImageView *background;
    IBOutlet UILabel *name,*club,*location,*time,*date,*fee;
    IBOutlet UILabel *cname1,*cname2,*team;
    IBOutlet UITextView *description;
}
@property(strong,nonatomic)NSString *tid;
@property(strong,nonatomic)NSDictionary *dict;
-(IBAction)back;

@end
