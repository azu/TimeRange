//
//  AZViewController.m
//  TimeRange
//
//  Created by azu on 10/23/2014.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import <TimeRange/TimeRange.h>
#import "AZViewController.h"

@interface AZViewController ()
@property(weak, nonatomic) IBOutlet UILabel *resultLabel;
@property(weak, nonatomic) IBOutlet UIDatePicker *startDatePicker;
@property(weak, nonatomic) IBOutlet UIDatePicker *endDatePicker;
@property(weak, nonatomic) IBOutlet UIDatePicker *targetDatePicker;

@property(nonatomic, strong) NSDate *startDate;

@property(nonatomic, strong) NSDate *endDate;

@property(nonatomic, strong) NSDate *targetDate;

- (IBAction)handleChangeDatePicker:(UIDatePicker *) sender;
@end

@implementation AZViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateResult];
}

- (void)updateResult {
    if (self.startDate == nil || self.endDatePicker == nil || self.targetDate == nil) {
        self.resultLabel.text = @"Have to set time";
        return;
    }

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"HH:mm:ss"];
    TimeRange *timeRange = [TimeRange rangeWithStartDate:self.startDate endDate:self.endDate];
    BOOL isContained = [timeRange contains:self.targetDate];

    self.resultLabel.text = [NSString stringWithFormat:@"%@ is %@ %@ 〜 %@",
                                                       [formatter stringFromDate:self.targetDate],
                                                       isContained ? @"contained"
                                                                   : @"not contained",
                                                       [formatter stringFromDate:self.startDate],
                                                       [formatter stringFromDate:self.endDate]
    ];
}

- (IBAction)handleChangeDatePicker:(UIDatePicker *) sender {
    if ([sender isEqual:self.startDatePicker]) {
        self.startDate = sender.date;
    } else if ([sender isEqual:self.endDatePicker]) {
        self.endDate = sender.date;
    } else {
        self.targetDate = sender.date;
    }
    [self updateResult];
}
@end
