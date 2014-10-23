//
// Created by azu on 2014/10/23.
//


#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "XCParameterizedTestCase.h"
#import "TimeRange.h"

@interface TimeRangeOverlapsTest : XCParameterizedTestCase
@end

@implementation TimeRangeOverlapsTest {
}


+ (NSArray *)testCaseData {
    return @[
        //@[ @[range], @[range] ]=> result
        [XCTestCaseData createWithInputValue:@[
            @[@"04:00:00", @"10:00:00"],
            @[@"17:00:00", @"23:00:00"]
        ] withExpectedValue:@(NO)],
        [XCTestCaseData createWithInputValue:@[
            @[@"04:00:00", @"10:00:00"],
            @[@"08:00:00", @"12:00:00"]
        ] withExpectedValue:@(YES)],
        [XCTestCaseData createWithInputValue:@[
            @[@"04:00:00", @"10:00:00"],
            @[@"10:00:00", @"16:00:00"]
        ] withExpectedValue:@(YES)],
        [XCTestCaseData createWithInputValue:@[
            @[@"04:00:00", @"10:00:00"],
            @[@"22:00:00", @"06:00:00"]
        ] withExpectedValue:@(YES)],
        [XCTestCaseData createWithInputValue:@[
            @[@"04:00:00", @"10:00:00"],
            @[@"22:00:00", @"06:00:00"]
        ] withExpectedValue:@(YES)],

        [XCTestCaseData createWithInputValue:@[
            @[@"04:00:00", @"10:00:00"],
            @[@"22:00:00", @"03:00:00"]
        ] withExpectedValue:@(NO)],
    ];
}

- (void)test_TimeRange_overlaps {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSArray *aRangeData = [self.input firstObject];
    NSArray *bRangeData = [self.input lastObject];
    TimeRange *aRange = [TimeRange rangeWithStartDate:[formatter dateFromString:aRangeData[0]] endDate:[formatter dateFromString:aRangeData[1]]];
    TimeRange *bRange = [TimeRange rangeWithStartDate:[formatter dateFromString:bRangeData[0]] endDate:[formatter dateFromString:bRangeData[1]]];
    XCTAssertEqualObjects(@([aRange overlaps:bRange]), self.expected,
        @"\n%@\n%@@\n%@\n%@", aRangeData, bRangeData, aRange, bRange);
}
@end
