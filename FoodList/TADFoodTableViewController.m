//
//  TADFoodTableViewController.m
//  FoodList
//
//  Created by Atharva Patil on 11/02/17.
//  Copyright © 2017 Atharva Patil. All rights reserved.
//

#import "TADFoodTableViewController.h"
#import "TADAddFoodViewController.h"
#import "TADFoodDetailViewController.h"

@interface TADFoodTableViewController ()

@end

@implementation TADFoodTableViewController
@synthesize foodArray;

-(void)saveData: (NSNotification *)Notification
{
    NSString *filePath = [self plistPath];
    [foodArray writeToFile:filePath atomically:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"addFoodSegue"])
    {
        TADAddFoodViewController *addFoodViewController = [segue destinationViewController];
        [addFoodViewController setFoodTableViewController:self];
    }
    else if ([[segue identifier] isEqualToString:@"foodDetailSegue"])
    {
        NSIndexPath *selectedRow = [[self tableView] indexPathForSelectedRow];
        NSDictionary *selectedFood = [foodArray objectAtIndex:[selectedRow row]];
        TADFoodDetailViewController *foodDetailVC = [segue destinationViewController];
        [foodDetailVC setFood:selectedFood];
    }
}

-(NSString * )plistPath {
    NSString *homeDirectory = NSHomeDirectory();
    NSString *filePath =[homeDirectory stringByAppendingString:@"/Documents/foods.plist"];
    return filePath;
}

-(void)addFood:(NSDictionary *)newFood
{
    [foodArray addObject:newFood];
    [[self tableView ]reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveData:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    
    if([[NSFileManager defaultManager]fileExistsAtPath:[self plistPath]])
    {
        foodArray = [[NSMutableArray alloc] initWithContentsOfFile:[self plistPath]];
        NSLog(@"HERE");
    }
    else
    {
        
        NSDictionary *firstFoodDictionary = [[NSDictionary alloc] initWithObjectsAndKeys: @"Pizza",kTADFoodName,@"Pizza Place",kTADRestaurantName,@"Good",kTADRating,nil];
        foodArray = [[NSMutableArray alloc]initWithObjects:firstFoodDictionary, nil];

    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [foodArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    
    // Configure the cell...
    long rowNumber = [indexPath row];
    NSDictionary *foodDictionary = [foodArray objectAtIndex:rowNumber];
    
    
    NSString *food = [foodDictionary objectForKey:kTADFoodName];
    NSString *restaurant = [foodDictionary objectForKey:kTADRestaurantName];
    
    
    [[cell detailTextLabel] setText:restaurant];
    [[cell textLabel] setText:food];
    NSLog(@"Displaying String %ld",(long)[indexPath row]);
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [foodArray removeObjectAtIndex:[indexPath row]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
