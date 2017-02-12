//
//  TADFoodDetailViewController.m
//  FoodList
//
//  Created by Atharva Patil on 11/02/17.
//  Copyright © 2017 Atharva Patil. All rights reserved.
//

#import "TADFoodDetailViewController.h"
#import "TADFoodTableViewController.h"
@interface TADFoodDetailViewController ()

@end

@implementation TADFoodDetailViewController
@synthesize foodLabel;
@synthesize restaurantLabel;
@synthesize food;
@synthesize ratingLabel;
@synthesize mapView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [foodLabel setText:[food objectForKey: kTADFoodName]];
    [restaurantLabel setText:[food objectForKey:kTADRestaurantName]];
    [ratingLabel setText:[food objectForKey:kTADRating]];
    NSNumber *latitude = [food objectForKey:kTADLatitude];
    NSNumber *longitude = [food objectForKey:kTADLongtiude];
    MKCoordinateRegion region;
    region.span = MKCoordinateSpanMake(0.02, 0.02);
    region.center = CLLocationCoordinate2DMake([latitude floatValue], [longitude floatValue]);
    [mapView setRegion:region];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
