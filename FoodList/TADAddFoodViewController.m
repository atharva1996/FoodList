//
//  TADAddFoodViewController.m
//  FoodList
//
//  Created by Atharva Patil on 11/02/17.
//  Copyright © 2017 Atharva Patil. All rights reserved.
//

#import "TADAddFoodViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface TADAddFoodViewController ()

@end

@implementation TADAddFoodViewController
@synthesize foodTextField;
@synthesize restaurantTextField;
@synthesize foodTableViewController;
@synthesize  segmentControl;
@synthesize locationManager;
@synthesize activityIndicator;
@synthesize localtionLabel;
@synthesize tap;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [localtionLabel setText:@"Updating Location...."];
    
   

}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) locationManager:(CLLocationManager *) manager didUpdateLocations:(nonnull NSArray *)locations{
    
    [activityIndicator stopAnimating];
    [localtionLabel setText:@"Location Received"];
}

-(void) locationManager: (CLLocationManager *)manager didFailWithError:(nonnull NSError *)error
{
    [activityIndicator stopAnimating];
    [localtionLabel setText:@"Location Error"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addFoodButtonPressed:(id)sender {
    
    [locationManager stopUpdatingLocation];
    
    NSString *newFoodName = [foodTextField text];
    NSString *newRestaurantName = [restaurantTextField text];
    NSString *rating = @"OK";
    if([segmentControl selectedSegmentIndex]==0)
    {
        rating = @"Good";
    }
    else if ([segmentControl selectedSegmentIndex]==1)
    {
        rating = @"Bad";
    }
    
    NSNumber *longitudeNumber = [NSNumber numberWithFloat:0.0];
    NSNumber *latitudeNumber = [NSNumber numberWithFloat:0.0];
    NSLog(@"superb");
    if(locationManager.location != nil)
    {
        CLLocationCoordinate2D currentLocation = locationManager.location.coordinate;
        longitudeNumber = [NSNumber numberWithFloat:currentLocation.longitude];
        latitudeNumber = [NSNumber numberWithFloat:currentLocation.latitude];
        NSLog(@"inside");
    }
    else
    {
        NSLog(@"Empty");
    }
    
    NSDictionary *newFood = [[NSDictionary alloc] initWithObjectsAndKeys:newFoodName,kTADFoodName,newRestaurantName,kTADRestaurantName,rating,kTADRating,latitudeNumber,kTADLatitude,longitudeNumber,kTADLongtiude, nil];
    
    [foodTableViewController addFood:newFood];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)tap:(id)sender {
}
- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
