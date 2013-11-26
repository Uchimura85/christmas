//
//  ViewController.m
//  Christmas
//
//  Created by Matthew Mascioni on 11/25/2013.
//  Copyright (c) 2013 Matthew Mascioni. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];

    NSDate *today = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *christmasDate = [formatter dateFromString:@"2013-12-25"];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSDayCalendarUnit fromDate:today toDate:christmasDate options:0];
    
    [self makeCountdownCircleWithTimeLeft:[NSString stringWithFormat:@"%ld",(long)[components day]]];
    
}

- (void)makeCountdownCircleWithTimeLeft:(NSString *)timeLeft {
    UIImage *christmasImage = [UIImage imageNamed:@"christmas"];
    UIImageView *christmas = [[UIImageView alloc] initWithImage:christmasImage];
    [christmas setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [christmas setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:christmas];
    
    CGRect daysCircle = CGRectMake(0, 0, 225, 225);
    UIView *daysView = [[UIView alloc] initWithFrame:daysCircle];
    daysView.alpha = 0.7;
    daysView.center = self.view.center;
    daysView.backgroundColor = [UIColor colorWithRed:0.67 green:0.00 blue:0.08 alpha:1.0];
    [[daysView layer] setCornerRadius:110.0f];
    [self.view addSubview:daysView];
    
    UILabel *daysLabel = [[UILabel alloc] initWithFrame:daysCircle];
    daysLabel.center = self.view.center;
    [daysLabel setFrame:CGRectMake(daysLabel.frame.origin.x, (daysLabel.frame.origin.y - 20), daysLabel.frame.size.width, daysLabel.frame.size.height)];
    daysLabel.textAlignment = NSTextAlignmentCenter;
    daysLabel.text = timeLeft;
    daysLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:90.0];
    daysLabel.textColor = [UIColor whiteColor];
    [self.view insertSubview:daysLabel aboveSubview:daysView];
    
    UILabel *christmasLabel = [[UILabel alloc] initWithFrame:daysCircle];
    christmasLabel.center = self.view.center;
    [christmasLabel setFrame:CGRectMake(daysLabel.frame.origin.x, (daysLabel.frame.origin.y + 65), daysLabel.frame.size.width, daysLabel.frame.size.height)];
    christmasLabel.textAlignment = NSTextAlignmentCenter;
    christmasLabel.text = @"DAYS UNTIL CHRISTMAS!";
    christmasLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
    christmasLabel.textColor = [UIColor whiteColor];
    [self.view insertSubview:christmasLabel aboveSubview:daysLabel];
}

@end
