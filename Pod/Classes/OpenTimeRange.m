//
// Created by azu on 2014/10/23.
//


#import "OpenTimeRange.h"
#import "TimeRangeCompareUtil.h"


@implementation OpenTimeRange {

}
- (BOOL)contains:(NSDate *) targetData {
    // return $target < Start || End <= $target;
    return [TimeRangeCompareUtil oneDate:targetData isEarlierThanDate:self.aDate] ||
        [TimeRangeCompareUtil oneDate:self.bDate isEarlierThanOrEqualDate:targetData];
}

@end