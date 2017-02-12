//
//  TADFoodTableViewController.h
//  FoodList
//
//  Created by Atharva Patil on 11/02/17.
//  Copyright © 2017 Atharva Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kTADFoodName @"FoodName"
#define kTADRestaurantName @"RestaurantName"
#define kTADRating @"Rating"
#define kTADLatitude @"Latitude"
#define kTADLongtiude @"Longitude"


@interface TADFoodTableViewController : UITableViewController

@property (nonatomic,strong)NSMutableArray *foodArray;

-(void)addFood:(NSDictionary *)newFood;
-(void)saveData:(NSNotification *)notification;


@end
