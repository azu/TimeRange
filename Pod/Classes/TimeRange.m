//
// Created by azu on 2014/10/23.
//


#import "TimeRange.h"
#import "TimeRangeCompareUtil.h"
#import "ClosedTimeRange.h"
#import "OpenTimeRange.h"


@interface TimeRange ()
// CAUTION : You should not access directory these property.
@property(nonatomic, readwrite) NSDate *aDate;
@property(nonatomic, readwrite) NSDate *bDate;
@end

@implementation TimeRange {

}
+ (TimeRange *)createFactory:(NSDate *) startDate endDate:(NSDate *) endDate {
    if ([TimeRangeCompareUtil oneDate:startDate isEarlierThanDate:endDate]) {
        ClosedTimeRange *timeRange = [[ClosedTimeRange alloc] init];
        timeRange.aDate = startDate;
        timeRange.bDate = endDate;
        return timeRange;
    } else {
        // |--> end |   | start --->|
        OpenTimeRange *timeRange = [[OpenTimeRange alloc] init];
        timeRange.aDate = endDate;
        timeRange.bDate = startDate;
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
    return [anotherTimeRange contains:self.aDate] || [anotherTimeRange contains:self.bDate];
}

- (NSString *)description {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.aDate=%@", [formatter stringFromDate:self.aDate]];
    [description appendFormat:@", self.bDate=%@", [formatter stringFromDate:self.bDate]];
    [description appendString:@">"];
    return description;
}

@end