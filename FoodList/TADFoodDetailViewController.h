//
//  TADFoodDetailViewController.h
//  FoodList
//
//  Created by Atharva Patil on 11/02/17.
//  Copyright © 2017 Atharva Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TADFoodDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *foodLabel;
@property (weak, nonatomic) IBOutlet UILabel *restaurantLabel;
@property (nonatomic,weak) NSDictionary *food;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)backPressed:(id)sender;

@end
