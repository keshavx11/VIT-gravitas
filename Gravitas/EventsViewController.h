//
//  EventsViewController.h
//  Gravitas
//
//  Created by Keshav Bansal on 17/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "EventInfo.h"
#import "SBJson.h"

@interface EventsViewController : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate>
{
    int x;
    NSMutableData *webData;
    NSMutableArray *array,*arrayA,*arrayB;
    NSMutableURLRequest *request;
    IBOutlet UITableView *tv;
    NSString *save;
    UIGestureRecognizer *tap;
    IBOutlet UISearchBar *search;
    IBOutlet UIView *searchView;
}
@property(strong,nonatomic)NSString *tid;
@property(nonatomic)int type;

-(IBAction)back;
-(IBAction)searchEvent;

@end
