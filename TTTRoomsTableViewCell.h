//
//  TTTRoomsTableViewCell.h
//  TTT
//
//  Created by Jimmy Lee on 14/4/27.
//  Copyright (c) 2014年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTTRoomsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *playerCountImage;
@property (nonatomic, weak) IBOutlet UILabel *roomOwnerLabel;
@property (nonatomic, weak) IBOutlet UILabel *modeLabel;

@end
