//
//  MapsViewController.m
//  GoogleMapsRoHe
//
//  Created by RobertoHerrera on 7/6/16.
//  Copyright © 2016 RobertoHerrera. All rights reserved.
//

#import "MapsViewController.h"
@import GoogleMaps;
#import <Google/Analytics.h>

@interface MapsViewController ()
@property (strong, nonatomic) IBOutlet GMSMapView *MapsView;

@end

@implementation MapsViewController{
    GMSMapView *mapView_;
    GMSCameraPosition *camera;
}
-(void)viewWillAppear:(BOOL)animated{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"MapsViewController"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createMap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createMap {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    camera = [GMSCameraPosition cameraWithLatitude:self.locationLatitude
                                longitude:self.locationLongitude
                                zoom:self.locationZoom];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    /*
    mapView_.delegate = self;
    self.view = mapView_;
    */
    
    [self.MapsView animateToCameraPosition:camera];
    self.MapsView.delegate = self;
    self.MapsView = mapView_;
    
    /*
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(self.locationLatitude, self.locationLongitude);
    marker.title = @"UAG";
    marker.snippet = @"Clase de Maestría";
    marker.map = self.MapsView;
    //self.MapsView.animateToLocation
     */
}

#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
    self.lblLat.text = [NSString stringWithFormat:@"%f", coordinate.latitude];
    self.lblLong.text = [NSString stringWithFormat:@"%f", coordinate.longitude];
    self.lblLat.textColor = [UIColor redColor];
    self.lblLong.textColor = [UIColor redColor];
    
    //[mapView_ clear];
    [self.MapsView clear];
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    GMSMarker *marker = [GMSMarker markerWithPosition:position];
    marker.title = @"Seleccion...";
    marker.map = self.MapsView;
    //marker.map = mapView_;
    NSLog(@"Fin del marker");
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)btnLoadPressed:(id)sender {
    
    /*Aqui van unos cambiosq*/
    
        [self qeueLoadData];

}

/**********************************************************************************************/
#pragma mark - Task methods
/**********************************************************************************************/
- (void)qeueLoadData {
    [UIApplication sharedApplication].networkActivityIndicatorVisible   = YES;
    [self.activityLoad startAnimating];
    
    NSOperationQueue *queue         = [NSOperationQueue new];
    NSInvocationOperation *opGet    = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadData) object:nil];
    [queue addOperation:opGet];
    
    NSInvocationOperation *opDidGet = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(didLoadData) object:nil];
    [opDidGet addDependency:opGet];
    [queue addOperation:opDidGet];
}
//----------------------------------------------------------------------------------------------
- (void)loadData {
    print(NSLog(@"Antes del Json"))
    NSString *latText = [NSString stringWithFormat:@"%@", (self.lblLat.text)];
     NSString *lonText = [NSString stringWithFormat:@"%@", (self.lblLong.text)];
    
    
    
    mjsonGeo = [WebServices getWeatherWithLatitude:latText AndLongitude:lonText];
    print(NSLog(@"RoHe mjsonGeo  = %@",mjsonGeo))
}
//----------------------------------------------------------------------------------------------
- (void)didLoadData {
    dispatch_async(dispatch_get_main_queue(), ^{
        ObjectResponse *object          = [Parser parseGeoObject];
        Coord *coordObject              = object.coord;
        float lat                       = coordObject.lat;
        float lng                       = coordObject.lon;
        NSString *stName                = object.name;
        
        MainObject *mainObject          = object.main;
        float tempCelsius               = mainObject.temp - 273.15;
        
        self.lblTempValue.text          = [NSString stringWithFormat:@"%.1f", tempCelsius];
        self.lblTempValue.text          = [self.lblTempValue.text  stringByAppendingString:@" ºC"];
        self.lblPressureValue.text      = [NSString stringWithFormat:@"%f", mainObject.pressure];
        self.lblHumidityValue.text      = [NSString stringWithFormat:@"%f", mainObject.humidity];
        self.lblTempMinValue.text       = [NSString stringWithFormat:@"%f", mainObject.temp_min];
        self.lblTempMaxValue.text       = [NSString stringWithFormat:@"%f", mainObject.temp_max];
        self.lblLat.textColor = [UIColor blackColor];
        self.lblLong.textColor = [UIColor blackColor];
        
        
        
        self.lblCityValue.text          = stName;
        print(NSLog(@"We are at %@ with latitude %f and longitude %f",stName, lat, lng))
        [UIApplication sharedApplication].networkActivityIndicatorVisible   = NO;
        [self.activityLoad stopAnimating];
    });
}

@end
