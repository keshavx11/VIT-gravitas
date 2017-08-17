//
//  CustomCell.h
//  Gravitas
//
//  Created by Keshav Bansal on 19/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property(strong,nonatomic)IBOutlet UILabel *name,*time,*venue;
@property(strong,nonatomic)IBOutlet UIImageView *iv;

@end
