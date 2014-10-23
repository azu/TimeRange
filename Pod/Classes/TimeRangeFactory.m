//
// Created by azu on 2014/10/23.
//


#import "TimeRangeFactory.h"
#import "ClosedTimeRange.h"
#import "OpenTimeRange.h"
#import "TimeRangeCompareUtil.h"


@implementation TimeRangeFactory {

}
+ (TimeRange *)createFactory:(NSDate *) startDate endDate:(NSDate *) endDate {
    if ([TimeRangeCompareUtil oneDate:startDate isEarlierThanDate:endDate]) {
        return [ClosedTimeRange rangeWithStartDate:startDate endDate:endDate];
    } else {
        return [OpenTimeRange rangeWithStartDate:startDate endDate:endDate];
    }
}
@end