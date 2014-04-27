//
//  TTTMainViewController.m
//  TTT
//
//  Created by Jimmy Lee on 14/4/27.
//  Copyright (c) 2014年 Jimmy. All rights reserved.
//

#import "TTTMainViewController.h"

@interface TTTMainViewController ()

@end

@implementation TTTMainViewController

@synthesize name, label;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    label.text = @"Hi, ";
    label.text = [[label text] stringByAppendingString:name];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
