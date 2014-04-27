//
//  TTTLoginViewController.m
//  TTT
//
//  Created by Jimmy Lee on 14/4/27.
//  Copyright (c) 2014年 Jimmy. All rights reserved.
//

#import "TTTLoginViewController.h"
#import "TTTMainViewController.h"

@interface TTTLoginViewController ()

@end

@implementation TTTLoginViewController

@synthesize nameTextField;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)endEdit:(id)sender
{
    [sender resignFirstResponder];
    if ([[nameTextField text] length] != 0)
    {
        //TTTMainViewController *controller = [[TTTMainViewController alloc] init];
        //controller.label.text = [nameTextField text];
        [self performSegueWithIdentifier:@"enterName" sender:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"enterName"])
    {
        TTTMainViewController *controller = (TTTMainViewController*)segue.destinationViewController;
        controller.name = [nameTextField text];
    }
}

@end
