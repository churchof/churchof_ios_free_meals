//
//  HomeViewController.m
//  FreeMeals
//
//  Created by Zach Whelchel on 9/16/14.
//  Copyright (c) 2014 ChurchOf. All rights reserved.
//

#import "HomeViewController.h"
#import "HeaderTableViewCell.h"
#import "MealOverviewTableViewCell.h"
#import <CoreLocation/CoreLocation.h>
#import "Resource.h"
#import "MealViewController.h"
#import "AllMealsViewController.h"

#define toRadians(x) ((x)*M_PI / 180.0)
#define toDegrees(x) ((x)*180.0 / M_PI)

@interface HomeViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocationDegrees deviceLatitude;
@property (nonatomic) CLLocationDegrees deviceLongitude;
@property (nonatomic) float deviceMagneticHeading;
@property (nonatomic) float deviceTrueHeading;
@property (nonatomic) int locationDelayCounter;
@property (strong, nonatomic) NSMutableArray *allPrograms;
@property (strong, nonatomic) NSMutableArray *allProgramsWithTimeLocation;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *nearbyUpcomingProgramsArray;

@property (weak, nonatomic) IBOutlet UIButton *seeAllMealsButton;
@property (weak, nonatomic) IBOutlet UIButton *learnMoreCOLButton;
@property (weak, nonatomic) IBOutlet UIButton *learnMoreThisAppButton;

@property (nonatomic) BOOL loading;

@end

@implementation HomeViewController

@synthesize nearbyUpcomingProgramsArray = _nearbyUpcomingProgramsArray;
@synthesize allPrograms = _allPrograms;
@synthesize allProgramsWithTimeLocation = _allProgramsWithTimeLocation;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.arrow.alpha = 0.0;
//    self.wait = 2;
//    self.callButton.enabled = NO;
//    self.directionsButton.enabled = NO;

    [self setUpLocationManager];
    
    self.seeAllMealsButton.layer.cornerRadius = 4;
    self.learnMoreCOLButton.layer.cornerRadius = 4;
    self.learnMoreThisAppButton.layer.cornerRadius = 4;

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], [UIFont fontWithName:@"Avenir-Roman" size:22]:NSFontAttributeName}];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
 
    if (self.allProgramsWithTimeLocation.count == 0) {
        [self downloadPackage];
    }

}

- (void)appDidBecomeActive:(NSNotification *)notification {
    [self downloadPackage];
}

- (void)viewWillAppear:(BOOL)animated
{
    // Will build in a NSDefault 5 min counter for if this should trigger or not.
}

- (void)setUpLocationManager
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization]; // iOS 8 MUST
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
}

- (void)downloadPackage
{
    if (self.loading == NO) {
        self.loading = YES;
        
        self.allPrograms = [NSMutableArray array];
        self.allProgramsWithTimeLocation = [NSMutableArray array];
        self.nearbyUpcomingProgramsArray = [NSMutableArray array];
        
        [self performSegueWithIdentifier:@"Loading" sender:self];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.church-of.com/api/v1/resources"]];
            [self performSelectorOnMainThread:@selector(parseData:)
                                   withObject:data waitUntilDone:YES];
            self.loading = NO;
        });
    }
}

- (BOOL)string:(NSString *)string containsSubstring:(NSString *)substring
{
    if ([string rangeOfString:substring].location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}

- (NSDate *)dateForTodayWithTime:(NSString *)time
{
    NSRange range = [time rangeOfString:@"2000-01-01T"];
    NSString *newString = [time substringFromIndex:range.length];
    NSRange range2 = [newString rangeOfString:@"Z"];
    NSString *newString2 = [newString substringToIndex:range2.location];
    NSString *hour = [newString2 substringWithRange:NSMakeRange(0, 2)];
    NSString *min = [newString2 substringWithRange:NSMakeRange(3, 2)];
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    [components setHour:[hour intValue]];
    [components setMinute:[min intValue]];
    NSDate *date = [calendar dateFromComponents:components];
    return date;
}

- (void)parseData:(NSData *)responseData {
    //parse out the json data
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoadingFinished" object:self];

    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    
    
    for (NSDictionary *dict in json) {
        Resource *resource = [[Resource alloc] init];
        resource.title = [dict valueForKey:@"title"];
        resource.information = [dict valueForKey:@"description"];
        resource.contact_phone = [dict valueForKey:@"contact_phone"];
        resource.status = [dict valueForKey:@"status"];
        resource.address = [dict valueForKey:@"address"];
        resource.updated_at = [dict valueForKey:@"updated_at"];
        resource.latitude = [dict valueForKey:@"latitude"];
        resource.longitude = [dict valueForKey:@"longitude"];
        resource.flagged = NO; // will need to fix this.
        if ([dict valueForKey:@"organization"]) {
            resource.organization_title = [[dict valueForKey:@"organization"] valueForKey:@"title"];
        }
        NSArray *times = [dict valueForKey:@"resource_events"];
        for (NSDictionary *time in times) {
            
            NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
            int weekday = [comps weekday];
            int weekOfMonth = [comps weekOfMonth];
            
            if ([time valueForKey:@"schedule"])
            {
                if ([self string:[time valueForKey:@"schedule"] containsSubstring:@"DailyRule"])
                {
                    
                    if ([[self dateForTodayWithTime:[time valueForKey:@"end_time"]] compare:[NSDate date]] == NSOrderedDescending) {
                        NSDictionary *timeObject = [NSDictionary dictionaryWithObjectsAndKeys:[self dateForTodayWithTime:[time valueForKey:@"start_time"]], @"start_time", [self dateForTodayWithTime:[time valueForKey:@"end_time"]], @"end_time", nil];
                        [resource.times addObject:timeObject];
                    }
                }
                else if ([self string:[time valueForKey:@"schedule"] containsSubstring:@"WeeklyRule"])
                {
                    NSDictionary *schedule = [NSJSONSerialization JSONObjectWithData:[[time valueForKey:@"schedule"] dataUsingEncoding:NSUTF8StringEncoding]
                                                                             options: NSJSONReadingMutableContainers
                                                                               error: nil];
                    NSArray *days = [[schedule valueForKey:@"validations"] valueForKey:@"day"];
                    if ([days containsObject:[NSNumber numberWithInt:weekday]]) {
                        if ([[self dateForTodayWithTime:[time valueForKey:@"end_time"]] compare:[NSDate date]] == NSOrderedDescending) {
                            NSDictionary *timeObject = [NSDictionary dictionaryWithObjectsAndKeys:[self dateForTodayWithTime:[time valueForKey:@"start_time"]], @"start_time", [self dateForTodayWithTime:[time valueForKey:@"end_time"]], @"end_time", nil];
                            [resource.times addObject:timeObject];
                        }
                    }
                }
                else if ([self string:[time valueForKey:@"schedule"] containsSubstring:@"MonthlyRule"])
                {
                    NSDictionary *schedule = [NSJSONSerialization JSONObjectWithData:[[time valueForKey:@"schedule"] dataUsingEncoding:NSUTF8StringEncoding]
                                                                             options: NSJSONReadingMutableContainers
                                                                               error: nil];
                    NSDictionary *dayOfWeekObject = [[schedule valueForKey:@"validations"] valueForKey:@"day_of_week"];
                    if ([[dayOfWeekObject allKeys] objectAtIndex:0] == [NSNumber numberWithInt:weekday]) {
                        if ([[dayOfWeekObject valueForKey:[[dayOfWeekObject allKeys] objectAtIndex:0]] containsObject:[NSNumber numberWithInt:weekOfMonth]])
                        {
                            //{\"5\":[1,3]}} This is not complex enough I dont think. Could only have one instance instead of multiples.
                            // If day_of_month then dont use it? Or need to right something for this.
                            if ([[self dateForTodayWithTime:[time valueForKey:@"end_time"]] compare:[NSDate date]] == NSOrderedDescending) {
                                NSDictionary *timeObject = [NSDictionary dictionaryWithObjectsAndKeys:[self dateForTodayWithTime:[time valueForKey:@"start_time"]], @"start_time", [self dateForTodayWithTime:[time valueForKey:@"end_time"]], @"end_time", nil];
                                [resource.times addObject:timeObject];
                            }
                        }
                    }
                }
            }
        }
        
        // This will need to be split up into the various times if this is used eventually to show all meals.

        if (resource.address.length > 0) {
            if (resource.times.count > 0) {
                
                // This is flawed currently.
//                for (NSDictionary *time in resource.times) {
//                    Resource *minResource = [[Resource alloc] init];
//                    [minResource setTimes:[NSMutableArray arrayWithObject:time]];
//                    
//                    if (resource.organization_title.length > 0) {
//                        [minResource setTitle:resource.organization_title];
//                    }
//                    else if (resource.address.length > 0) {
//                        [minResource setTitle:resource.address];
//                    }
//                    else {
//                        [minResource setTitle:@"Free Meal"];
//                    }
//                    [self.allPrograms addObject:minResource];
//                }
                
                if (resource.times.count > 1) {
                    [resource.times removeObjectsInRange:NSMakeRange(1, resource.times.count - 1)];
                }
                [self.allProgramsWithTimeLocation addObject:resource];
            }
        }

    }
    
    [self.locationManager startUpdatingHeading];
    [self.locationManager startUpdatingLocation];
}

- (void) updateArrowsDirections
{
    
    for (int i = 0; i < self.nearbyUpcomingProgramsArray.count; i++) {
        MealOverviewTableViewCell *cell = (MealOverviewTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i + 1 inSection:0]];
        Resource *resource = [self.nearbyUpcomingProgramsArray objectAtIndex:i];
        
        double y = sin(toRadians([resource.longitude floatValue] - self.deviceLongitude)) * cos(toRadians([resource.latitude floatValue]));
        double x = cos(toRadians(self.deviceLatitude)) * sin(toRadians([resource.latitude floatValue])) -
        sin(toRadians(self.deviceLatitude)) * cos(toRadians([resource.latitude floatValue])) * cos(toRadians([resource.longitude floatValue] - self.deviceLongitude));
        double bearing = toDegrees(atan2(y, x));
        cell.arrowImageView.transform = CGAffineTransformMakeRotation(toRadians(bearing - self.deviceTrueHeading));
        
        CLLocation *location1 = [[CLLocation alloc] initWithLatitude:[resource.latitude floatValue] longitude:[resource.longitude floatValue]];
        CLLocation *location2 = [[CLLocation alloc] initWithLatitude:self.deviceLatitude longitude:self.deviceLongitude];
        resource.distance = [location1 distanceFromLocation:location2];
        
        float distance = resource.distance / 1609.34;
        [cell.distanceLabel setText:[NSString stringWithFormat:@"%.2f miles", distance]];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    self.deviceMagneticHeading = newHeading.magneticHeading;
    self.deviceTrueHeading = newHeading.trueHeading;
    
    self.locationDelayCounter --;
    if (self.locationDelayCounter < 0 && self.nearbyUpcomingProgramsArray.count > 0) {
        [self updateArrowsDirections];
    }
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    if (currentLocation != nil) {
        self.deviceLongitude = currentLocation.coordinate.longitude;
        self.deviceLatitude = currentLocation.coordinate.latitude;
        if ([self.allProgramsWithTimeLocation count] > 0 && self.nearbyUpcomingProgramsArray.count == 0) {
            [self setUpNearbyResources];
        }
        if (self.locationDelayCounter < 0 && self.nearbyUpcomingProgramsArray.count > 0) {
            [self updateArrowsDirections];
        }
    }
}

- (void)setUpNearbyResources
{
    if (self.deviceLatitude && self.deviceLongitude) {
        self.nearbyUpcomingProgramsArray = [NSMutableArray array];
        
        NSMutableArray *allOrgsByDistance = [NSMutableArray array];
        
        for (NSDictionary *dict in self.allProgramsWithTimeLocation) {
            if ([dict valueForKey:@"latitude"] && [dict valueForKey:@"longitude"]) {
                CLLocation *location1 = [[CLLocation alloc] initWithLatitude:[[dict valueForKey:@"latitude"] floatValue] longitude:[[dict valueForKey:@"longitude"] floatValue]];
                CLLocation *location2 = [[CLLocation alloc] initWithLatitude:self.deviceLatitude longitude:self.deviceLongitude];
                [dict setValue:[NSNumber numberWithDouble:[location1 distanceFromLocation:location2]] forKey:@"distance"];
                [allOrgsByDistance addObject:dict];
            }
        }
        
        NSSortDescriptor * distanceDescriptor = [[NSSortDescriptor alloc] initWithKey:@"distance" ascending:YES];
        NSArray * sortDescriptors = [NSArray arrayWithObject:distanceDescriptor];
        allOrgsByDistance = [[allOrgsByDistance sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
        
        NSMutableArray *firstOrgsByDistance = [NSMutableArray array];

        if (allOrgsByDistance.count > 0) {
            [firstOrgsByDistance addObject:[allOrgsByDistance objectAtIndex:0]];
        }
        if (allOrgsByDistance.count > 1) {
            [firstOrgsByDistance addObject:[allOrgsByDistance objectAtIndex:1]];
        }
        if (allOrgsByDistance.count > 2) {
            [firstOrgsByDistance addObject:[allOrgsByDistance objectAtIndex:2]];
        }

        NSMutableArray *firstOrgsByTime = [[firstOrgsByDistance sortedArrayUsingComparator:^(Resource *obj1, Resource *obj2) {
            return (NSComparisonResult) [[obj1.times.firstObject valueForKey:@"start_time"] compare:[obj2.times.firstObject valueForKey:@"start_time"]];
        }] mutableCopy];

        if ([self.nearbyUpcomingProgramsArray count] == 0 && [firstOrgsByTime count] > 0) {
            
            if (allOrgsByDistance.count > 0) {
                [self.nearbyUpcomingProgramsArray addObject:[firstOrgsByTime objectAtIndex:0]];
            }
            if (allOrgsByDistance.count > 1) {
                [self.nearbyUpcomingProgramsArray addObject:[firstOrgsByTime objectAtIndex:1]];
            }
            if (allOrgsByDistance.count > 2) {
                [self.nearbyUpcomingProgramsArray addObject:[firstOrgsByTime objectAtIndex:2]];
            }
        }
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"MealInformation"]) {
        MealViewController *viewController = (MealViewController *)[segue destinationViewController];
        viewController.resource = [self.nearbyUpcomingProgramsArray objectAtIndex:self.tableView.indexPathForSelectedRow.row - 1];
    }
    else if ([segue.identifier isEqualToString:@"AllMeals"]) {
        AllMealsViewController *viewController = (AllMealsViewController *)[segue destinationViewController];
        viewController.allMeals = self.allPrograms;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 120;
    }
//    else if (indexPath.row == [self.nearbyUpcomingProgramsArray count] + 1) {
//        return 210;
//    }
    else {
        return 100;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.nearbyUpcomingProgramsArray count] + 1; //+2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString *reuseIdentifier = @"HeaderTableViewCell";
        HeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[HeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        }
        
        if (self.nearbyUpcomingProgramsArray.count == 1) {
            cell.titleLabel.text = [NSString stringWithFormat:@"There is 1 meal in the next few hours."];
        }
        else {
            cell.titleLabel.text = [NSString stringWithFormat:@"There are %lu meals in the next few hours.", (unsigned long)self.nearbyUpcomingProgramsArray.count];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
        static NSString *reuseIdentifier = @"MealOverviewTableViewCell";
        MealOverviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[MealOverviewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        }
        cell.distanceLabel.text = @"";
        cell.timeLabel.text = @"";
        
        Resource *resource = [self.nearbyUpcomingProgramsArray objectAtIndex:indexPath.row - 1];
        
        float distance = resource.distance / 1609.34;
        [cell.distanceLabel setText:[NSString stringWithFormat:@"%.2f miles", distance]];

        NSDictionary *time = resource.times.firstObject;
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"h:mma"];
        if ([(NSDate *)[time valueForKey:@"start_time"] compare:[NSDate date]] == NSOrderedDescending) {
            [cell.timeLabel setText:[NSString stringWithFormat:@"Starts at %@", [dateFormat stringFromDate:(NSDate *)[time valueForKey:@"start_time"]]]];
        }
        else {
            [cell.timeLabel setText:[NSString stringWithFormat:@"Ends at %@", [dateFormat stringFromDate:(NSDate *)[time valueForKey:@"end_time"]]]];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
