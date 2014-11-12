//
// Created by azu on 2014/10/23.
//


#import <XCTest/XCTest.h>
#import "XCTestCaseData.h"
#import "XCParameterizedTestCase.h"
#import "ClosedTimeRange.h"

@interface ClosedTimeRangeTest : XCParameterizedTestCase
@end

@implementation ClosedTimeRangeTest {
}

+ (NSArray *)testCaseData {
    return @[
        // begin, end , target => result
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"02:00:00"] withExpectedValue:@(NO)],
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"04:00:00"] withExpectedValue:@(YES)],
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"05:00:00"] withExpectedValue:@(YES)],
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"10:00:00"] withExpectedValue:@(NO)],
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"12:00:00"] withExpectedValue:@(NO)],
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"22:00:00"] withExpectedValue:@(NO)]
    ];
}

- (void)test_ClosedTimeRange {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSDate *startDate = [formatter dateFromString:self.input[0]];
    NSDate *endDate = [formatter dateFromString:self.input[1]];
    NSDate *targetDate = [formatter dateFromString:self.input[2]];
    ClosedTimeRange *timeRange = [[ClosedTimeRange alloc] init];
    timeRange.aDate = startDate;
    timeRange.bDate = endDate;
    XCTAssertEqualObjects(@([timeRange contains:targetDate]), self.expected, "%@", timeRange);
}
@end
