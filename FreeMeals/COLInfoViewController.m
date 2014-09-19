//
//  COLInfoViewController.m
//  FreeMeals
//
//  Created by Zach Whelchel on 9/17/14.
//  Copyright (c) 2014 ChurchOf. All rights reserved.
//

#import "COLInfoViewController.h"

@interface COLInfoViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation COLInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *images = [NSArray arrayWithObjects:[UIImage imageNamed:@"skills_sketched.png"], [UIImage imageNamed:@"map_sketched.png"], [UIImage imageNamed:@"sketched_feedback.png"], [UIImage imageNamed:@"stats_sketched.png"], nil];
    NSArray *titles = [NSArray arrayWithObjects:[NSString stringWithFormat:@"You are uniquely equipped to meet your city’s Needs."], [NSString stringWithFormat:@"See the Needs around you in real-time, all the time."], [NSString stringWithFormat:@"Give to specific Needs and get specific feedback."], [NSString stringWithFormat:@"Help guide the Church to use its resources responsibly."], nil];
    
    NSArray *titles2 = [NSArray arrayWithObjects:[NSString stringWithFormat:@"Chances are, you’re good at something. Whether that’s wielding a hammer or a pen, managing people or managing things. When you add skills to your profile you’ll automatically be notified when the Church is made aware of a need that matches your capabilities."], [NSString stringWithFormat:@"Churches and Non-Profits post needs in the community so we can all pitch in. Needs are screened and approved by local churches, so you can trust that each one is valid."], [NSString stringWithFormat:@"There’s something human about helping each other out. It connects and unifies us. Too often, when we give, we are unable to see the direct impact. With the \"Church of Lexington\" platform, all of your donation goes straight to the need through the local Church. You’ll then be kept up-to-date as the need is met."], [NSString stringWithFormat:@"The Church is not a building, it’s a group of people. We should all play a part in helping that group act with integrity. Where are the Church's resources going? Where should they be going? Can we be more responsible with what we've been given? The \"Church of Lexington\" provides a transparent platform for new initiatives."], nil];


    for (int i = 0; i < images.count + 1; i++) {
        
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        
        if (i == 4) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(8, (subview.frame.size.height / 2) - 60, subview.frame.size.width - 16, 55)];
            [button setBackgroundColor:[UIColor colorWithRed:77/255.0 green:143/255.0 blue:226/255.0 alpha:1.0]];
            button.titleLabel.font = [UIFont fontWithName:@"Avenir-Roman" size:22];
            button.titleLabel.textColor = [UIColor whiteColor];
            [button setTitle:@"www.church-of.com/lexington" forState:UIControlStateNormal];
            button.layer.cornerRadius = 4;
            [subview addSubview:button];
            [button addTarget:self action:@selector(websiteSelected) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(8, (subview.frame.size.height / 2) + 5, subview.frame.size.width - 16, 55)];
            [button2 setBackgroundColor:[UIColor colorWithRed:77/255.0 green:143/255.0 blue:226/255.0 alpha:1.0]];
            button2.titleLabel.font = [UIFont fontWithName:@"Avenir-Roman" size:22];
            button2.titleLabel.textColor = [UIColor whiteColor];
            [button2 setTitle:@"Go Back" forState:UIControlStateNormal];
            button2.layer.cornerRadius = 4;
            [subview addSubview:button2];
            [button2 addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];

        }
        else {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, subview.frame.size.width - 20, 100)];
            label.font = [UIFont fontWithName:@"Avenir-Roman" size:22];
            label.textColor = [UIColor darkGrayColor];
            label.numberOfLines = 0;
            [label setText:[titles objectAtIndex:i]];
            [subview addSubview:label];
            
            UITextView *label2 = [[UITextView alloc] initWithFrame:CGRectMake(6, 110, subview.frame.size.width - 12, 160)];
            label2.scrollEnabled = NO;
            label2.editable = NO;
            label2.userInteractionEnabled = NO;
            label2.backgroundColor = [UIColor clearColor];
            label2.font = [UIFont fontWithName:@"Avenir-Roman" size:14];
            label2.textColor = [UIColor darkGrayColor];
            [label2 setText:[titles2 objectAtIndex:i]];
            [subview addSubview:label2];
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 290, subview.frame.size.width - 20, subview.frame.size.height - 290 - 60)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [imageView setImage:[images objectAtIndex:i]];
            [subview addSubview:imageView];
        }

        
        

        
        [self.scrollView addSubview:subview];
    }
    
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setDelegate:self];

    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (images.count + 1), self.scrollView.frame.size.height);

}

- (void)websiteSelected
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.church-of.com"]];
}

- (void)exit
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
