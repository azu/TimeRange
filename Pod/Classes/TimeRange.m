//
// Created by azu on 2014/10/23.
//


#import "TimeRange.h"
#import "TimeRangeCompareUtil.h"
#import "ClosedTimeRange.h"
#import "OpenTimeRange.h"


@implementation TimeRange {

}
+ (TimeRange *)createFactory:(NSDate *) startDate endDate:(NSDate *) endDate {
    if ([TimeRangeCompareUtil oneDate:startDate isEarlierThanDate:endDate]) {
        ClosedTimeRange *timeRange = [[ClosedTimeRange alloc] init];
        timeRange.startDate = startDate;
        timeRange.endDate = endDate;
        return timeRange;
    } else {
        // |--> end |   | start --->|
        OpenTimeRange *timeRange = [[OpenTimeRange alloc] init];
        timeRange.startDate = endDate;
        timeRange.endDate = startDate;
        return timeRange;
    }
}

+ (instancetype)rangeWithStartDate:(NSDate *) startDate endDate:(NSDate *) endDate {
    return [self createFactory:startDate endDate:endDate];
}

- (BOOL)contains:(NSDate *) targetData {
    return NO;
}

- (BOOL)overlaps:(TimeRange *) anotherTimeRange {
    return [anotherTimeRange contains:self.startDate] || [anotherTimeRange contains:self.endDate];
}

- (NSString *)description {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.startDate=%@", [formatter stringFromDate:self.startDate]];
    [description appendFormat:@", self.endDate=%@", [formatter stringFromDate:self.endDate]];
    [description appendString:@">"];
    return description;
}

@end