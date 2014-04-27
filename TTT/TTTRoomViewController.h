//
//  TTTRoomViewController.h
//  TTT
//
//  Created by Jimmy Lee on 14/4/27.
//  Copyright (c) 2014年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTTRoomViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UILabel  *playerCountLabel;
    IBOutlet UILabel  *ModeLabel;

    IBOutlet UITableView *roomsTableView;
    NSMutableArray *roomsMutableArray;
}

@property (nonatomic, strong) UILabel  *playerCountLabel;
@property (nonatomic, strong) UILabel  *modeLabel;
@property (nonatomic, strong) UITableView *roomsTableView;

@end
