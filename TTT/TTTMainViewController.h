//
//  TTTMainViewController.h
//  TTT
//
//  Created by Jimmy Lee on 14/4/27.
//  Copyright (c) 2014年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTTMainViewController : UIViewController
{
    NSString *name;
    IBOutlet UILabel *label;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UILabel *label;

@end
