//
//  Resource.m
//  ChurchOfLexingtonFreeMeals
//
//  Created by Zach Whelchel on 9/8/14.
//  Copyright (c) 2014 ChurchOf. All rights reserved.
//

#import "Resource.h"

@implementation Resource

@synthesize title = _title;
@synthesize information = _information;
@synthesize contact_phone = _contact_phone;
@synthesize status = _status;
@synthesize address = _address;
@synthesize updated_at = _updated_at;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize flagged = _flagged;
@synthesize organization_title = _organization_title;
@synthesize times = _times;
@synthesize distance = _distance;


- (NSMutableArray *)times
{
    if (!_times) {
        return _times = [NSMutableArray array];
    }
    return _times;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"title: %@, information: %@, contact_phone: %@, status: %@, address: %@, updated_at: %@, latitude: %@, longitude: %@, flagged: %hhd, organization_title: %@, times: %@, distance: %f, ", self.title, self.information, self.contact_phone, self.status, self.address, self.updated_at, self.latitude, self.longitude, self.flagged, self.organization_title, self.times, self.distance];
}

@end
