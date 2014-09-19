//
//  MealViewController.m
//  FreeMeals
//
//  Created by Zach Whelchel on 9/11/14.
//  Copyright (c) 2014 ChurchOf. All rights reserved.
//

#import "MealViewController.h"
#import "GenericResizableTextTableViewCell.h"
#import <MapKit/MapKit.h> 
#import "Flurry.h"

@interface MealViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *textArray;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UIButton *directionsButton;

@end

@implementation MealViewController

@synthesize resource = _resource;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                                   self.resource, @"Resource",
                                   nil];
    
    [Flurry logEvent:@"Meal_Viewed" withParameters:params];
    
    
    NSLog(@"self.resource - %@", self.resource);
    
    self.textArray = [NSMutableArray array];
    
    if (self.resource.organization_title.length > 0) {
        [self.textArray addObject:[NSString stringWithFormat:@"%@", self.resource.organization_title]];
    }

    // Should have demographic information and potentially more here.
    
    if (self.resource.information.length > 0) {
        [self.textArray addObject:[NSString stringWithFormat:@"%@", self.resource.information]];
    }
    
    [self.tableView reloadData];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:CLLocationCoordinate2DMake([self.resource.latitude floatValue], [self.resource.longitude floatValue])];
    [annotation setTitle:@"Title"]; //You can set the subtitle too
    [self.mapView addAnnotation:annotation];
    
    MKCoordinateRegion region;
    region.center = CLLocationCoordinate2DMake([self.resource.latitude floatValue], [self.resource.longitude floatValue]);
    
    MKCoordinateSpan span;
    span.latitudeDelta  = .01; // Change these values to change the zoom
    span.longitudeDelta = .01;
    region.span = span;
    
    [self.mapView setRegion:region animated:YES];

    if (!self.resource.contact_phone.length > 0) {
        self.callButton.backgroundColor = [UIColor lightGrayColor];
        [self.callButton setTitle:@"No Phone Listed" forState:UIControlStateNormal];
        self.callButton.enabled = NO;
    }

    self.callButton.layer.cornerRadius = 4;
    self.directionsButton.layer.cornerRadius = 4;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"h:mma"];
    NSDictionary *time = self.resource.times.firstObject;

    [self.timeLabel setText:[NSString stringWithFormat:@"%@ - %@", [dateFormat stringFromDate:(NSDate *)[time valueForKey:@"start_time"]], [dateFormat stringFromDate:(NSDate *)[time valueForKey:@"end_time"]]]];

}

- (IBAction)call:(id)sender
{
    NSString *newString = [[self.resource.contact_phone componentsSeparatedByCharactersInSet:
                            [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                           componentsJoinedByString:@""];

    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            self.resource, @"Resource",
                            nil];
    
    [Flurry logEvent:@"Meal_Called" withParameters:params];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",newString]]];
}

- (IBAction)getDirections:(id)sender
{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            self.resource, @"Resource",
                            nil];
    
    [Flurry logEvent:@"Meal_Directions_Selected" withParameters:params];

    NSString* addr = [NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=Current Location&saddr=%@",self.resource.address];
    NSURL* url = [[NSURL alloc] initWithString:[addr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellText = [self.textArray objectAtIndex:indexPath.row];
    CGSize constraintSize = CGSizeMake(self.view.frame.size.width - 20, MAXFLOAT);
    
    CGRect textRect = [cellText boundingRectWithSize:constraintSize
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Avenir-Roman" size:24.0]}
                                         context:nil];
    
    CGSize size = textRect.size;
    
    return size.height + 20 + 20;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.textArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"GenericResizableTextTableViewCell";
    GenericResizableTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[GenericResizableTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleLabel.text = [self.textArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end