//
//  CustomCell.m
//  Gravitas
//
//  Created by Keshav Bansal on 19/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
    self.iv.layer.cornerRadius = 10;
    self.iv.layer.masksToBounds = YES;
    self.iv.layer.borderWidth = 0.1;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
