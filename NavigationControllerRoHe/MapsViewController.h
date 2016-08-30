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

@interface MapsViewController : UIViewController


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
@property (strong, nonatomic) IBOutlet UILabel *lblSeaLevelValue;
@property (strong, nonatomic) IBOutlet UILabel *lblGroundLevel;
@property (strong, nonatomic) IBOutlet UIView *vMap;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityLoad;
@property (strong, nonatomic) IBOutlet UITextField *txtLatitude;
@property (strong, nonatomic) IBOutlet UITextField *txtLongitude;

- (IBAction)btnLoadPressed:(id)sender;
@end
