//
//  TTTRoomsTableViewCell.m
//  TTT
//
//  Created by Jimmy Lee on 14/4/27.
//  Copyright (c) 2014年 Jimmy. All rights reserved.
//

#import "TTTRoomsTableViewCell.h"

@implementation TTTRoomsTableViewCell

@synthesize playerCountImage, roomOwnerLabel, modeLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
