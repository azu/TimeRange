//
// Created by azu on 2014/10/23.
//


#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import <XCParameterizedTestCase/XCParameterizedTestCase.h>
#import "OpenTimeRange.h"

@interface OpenTimeRangeTest : XCParameterizedTestCase
@end

@implementation OpenTimeRangeTest {
}

+ (NSArray *)testCaseData {
    return @[
        // begin, end , target => result
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"02:00:00"] withExpectedValue:@(YES)],
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"04:00:00"] withExpectedValue:@(NO)],
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"05:00:00"] withExpectedValue:@(NO)],
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"10:00:00"] withExpectedValue:@(YES)],
        [XCTestCaseData createWithInputValue:@[@"04:00:00", @"10:00:00", @"12:00:00"] withExpectedValue:@(YES)],
    ];
}

- (void)test_OpenTimeRange {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSDate *startDate = [formatter dateFromString:self.input[0]];
    NSDate *endDate = [formatter dateFromString:self.input[1]];
    NSDate *targetDate = [formatter dateFromString:self.input[2]];
    OpenTimeRange *timeRange = [[OpenTimeRange alloc] init];
    timeRange.aDate = startDate;
    timeRange.bDate = endDate;
    XCTAssertEqualObjects(@([timeRange contains:targetDate]), self.expected, "%@", timeRange);
}
@end
