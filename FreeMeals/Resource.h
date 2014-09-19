//
//  Resource.h
//  ChurchOfLexingtonFreeMeals
//
//  Created by Zach Whelchel on 9/8/14.
//  Copyright (c) 2014 ChurchOf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resource : NSObject

@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* information;
@property (nonatomic, retain) NSString* contact_phone;
@property (nonatomic, retain) NSString* status;
@property (nonatomic, retain) NSString* address;
@property (nonatomic, retain) NSString* updated_at;
@property (nonatomic, retain) NSNumber* latitude;
@property (nonatomic, retain) NSNumber* longitude;
@property (nonatomic) BOOL flagged;
@property (nonatomic, retain) NSString* organization_title;
@property (nonatomic, retain) NSMutableArray* times; // Will be something complex I'm sure.
@property float distance; // Used to record latest distance from user locally.

@end
