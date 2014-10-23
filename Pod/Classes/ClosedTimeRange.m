//
// Created by azu on 2014/10/23.
//


#import "ClosedTimeRange.h"
#import "TimeRangeCompareUtil.h"


@implementation ClosedTimeRange {

}

- (BOOL)contains:(NSDate *) targetData {
    // return begin <= $target && $target < end;
    return [TimeRangeCompareUtil oneDate:self.startDate isEarlierThanOrEqualDate:targetData] &&
        [TimeRangeCompareUtil oneDate:targetData isEarlierThanDate:self.endDate];
}


@end