//
//  CellTableViewCell.m
//  Flamingo
//
//  Created by Ezra Kirsh on 2017-04-02.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "CellTableViewCell.h"

@implementation CellTableViewCell

@synthesize profilePicture;
@synthesize name;
@synthesize headline;
@synthesize plusButton;
@synthesize similarities;
@synthesize phoneButton;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
