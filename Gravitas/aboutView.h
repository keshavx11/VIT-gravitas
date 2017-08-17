//
//  aboutView.h
//  Gravitas
//
//  Created by Keshav Bansal on 18/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aboutView : UIViewController
{
    IBOutlet UIImageView *iV1,*iV2,*iV3,*iV4,*iV5,*iV6,*iV7;
    IBOutlet UIScrollView *scrollView;
}

-(IBAction)back;

@end
