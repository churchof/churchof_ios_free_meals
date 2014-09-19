//
//  MealOverviewTableViewCell.h
//  FreeMeals
//
//  Created by Zach Whelchel on 9/16/14.
//  Copyright (c) 2014 ChurchOf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MealOverviewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
