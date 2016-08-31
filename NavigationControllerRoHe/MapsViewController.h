//
//  MapsViewController.h
//  GoogleMapsRoHe
//
//  Created by RobertoHerrera on 7/6/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "Declarations.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface MapsViewController : UIViewController <CLLocationManagerDelegate,GMSMapViewDelegate>


@property double locationLatitude;
@property double locationLongitude;
@property double locationZoom;

@property (strong, nonatomic) IBOutlet UIView *JsonView;
@property (strong, nonatomic) IBOutlet UIButton *btnLoad;
@property (strong, nonatomic) IBOutlet UILabel *lblCityValue;
@property (strong, nonatomic) IBOutlet UILabel *lblTempValue;
@property (strong, nonatomic) IBOutlet UILabel *lblPressureValue;
@property (strong, nonatomic) IBOutlet UILabel *lblHumidityValue;
@property (strong, nonatomic) IBOutlet UILabel *lblTempMinValue;
@property (strong, nonatomic) IBOutlet UILabel *lblTempMaxValue;
@property (strong, nonatomic) IBOutlet UILabel *lblLong;
@property (strong, nonatomic) IBOutlet UILabel *lblLat;



@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityLoad;


- (IBAction)btnLoadPressed:(id)sender;
@end
