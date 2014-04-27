//
//  TTTRoomViewController.m
//  TTT
//
//  Created by Jimmy Lee on 14/4/27.
//  Copyright (c) 2014年 Jimmy. All rights reserved.
//

#import "TTTRoomViewController.h"
#import "TTTRoomsTableViewCell.h"
#import <Parse/Parse.h>

@interface TTTRoomViewController ()

@property (nonatomic, strong) NSMutableArray *localRoomsData;

@end

@implementation TTTRoomViewController

@synthesize playerCountLabel, modeLabel, roomsTableView, localRoomsData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    roomsMutableArray = [[NSMutableArray alloc] init];
    localRoomsData = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"TTTRoom"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
         if (!error)
         {
             // The find succeeded.
             NSLog(@"Successfully retrieved %d scores.", objects.count);
             // Do something with the found objects
             [roomsMutableArray removeAllObjects];
             [roomsMutableArray addObjectsFromArray:objects];
             [roomsTableView reloadData];
         }
         else
         {
             // Log details of the failure
             NSLog(@"Error: %@ %@", error, [error userInfo]);
         }
     }];
    
    localRoomsData = roomsMutableArray;
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

- (IBAction)playerCount:(id)sender
{
    playerCountLabel.text = [@([sender tag]) stringValue];
}

- (IBAction)modeSelect:(id)sender
{
    if ([sender tag] == 1)
    {
        modeLabel.text = @"One Round";
    }
    else if ([sender tag] == 2)
    {
        modeLabel.text = @"Full Round";
    }
}

- (IBAction)filter:(id)sender
{
    if ([[playerCountLabel text] length] != 0 && [[modeLabel text] length] != 0)
    {
        // [localRoomsData removeAllObjects];
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (PFObject *object in roomsMutableArray)
        {
            if ([[object objectForKey:@"playerCount"] isEqualToString:[playerCountLabel text]] &&
                [[object objectForKey:@"mode"] isEqualToString:[modeLabel text]])
            {
                [array addObject:object];
            }
        }
        localRoomsData = array;
        [roomsTableView reloadData];
    }
}

#pragma mark - roomsTableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Row Count = %d", [localRoomsData count]);
    return [localRoomsData count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"roomsTableViewCellIdentifier";
    
    TTTRoomsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TTTRoomsTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    NSString *imageName = [[localRoomsData objectAtIndex:indexPath.row] objectForKey:@"playerCount"];
    imageName = [imageName stringByAppendingString:@".png"];

    cell.playerCountImage.image = [UIImage imageNamed:imageName];
    cell.roomOwnerLabel.text = ((PFObject*)[localRoomsData objectAtIndex:indexPath.row]).objectId;
    cell.modeLabel.text = [[localRoomsData objectAtIndex:indexPath.row] objectForKey:@"mode"];

    return cell;
}

@end
