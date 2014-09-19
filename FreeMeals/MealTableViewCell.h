//
//  MealTableViewCell.h
//  FreeMeals
//
//  Created by Zach Whelchel on 9/19/14.
//  Copyright (c) 2014 ChurchOf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MealTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
