//
//  TADAddFoodViewController.h
//  FoodList
//
//  Created by Atharva Patil on 11/02/17.
//  Copyright © 2017 Atharva Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TADFoodTableViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface TADAddFoodViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *foodTextField;
@property (weak, nonatomic) IBOutlet UITextField *restaurantTextField;

- (IBAction)addFoodButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;


@property (weak, nonatomic) IBOutlet UILabel *localtionLabel;

- (IBAction)backPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic,strong) CLLocationManager *locationManager;

@property (nonatomic,weak) TADFoodTableViewController *foodTableViewController;

@end
