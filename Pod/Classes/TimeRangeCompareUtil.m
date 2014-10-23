//
// Created by azu on 2014/10/23.
//


#import "TimeRangeCompareUtil.h"


@implementation TimeRangeCompareUtil {

}
+ (BOOL)oneDate:(NSDate *) targetDate isEarlierThanDate:(NSDate *) anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    enum NSCalendarUnit calendarUnit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *targetComponents = [calendar components:calendarUnit fromDate:targetDate];
    NSDateComponents *anotherComponents = [calendar components:calendarUnit fromDate:anotherDate];
    if (targetComponents.hour < anotherComponents.hour) {
        return YES;
    } else if (targetComponents.hour == anotherComponents.hour) {
        if (targetComponents.minute < anotherComponents.minute) {
            return YES;
        } else if (targetComponents.minute == anotherComponents.minute) {
            if (targetComponents.second < anotherComponents.second) {
                return YES;
            }
        }
    }
    return NO;
}

+ (BOOL)oneDate:(NSDate *) targetDate isEarlierThanOrEqualDate:(NSDate *) anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    enum NSCalendarUnit calendarUnit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *targetComponents = [calendar components:calendarUnit fromDate:targetDate];
    NSDateComponents *anotherComponents = [calendar components:calendarUnit fromDate:anotherDate];
    if (targetComponents.hour < anotherComponents.hour) {
        return YES;
    } else if (targetComponents.hour == anotherComponents.hour) {
        if (targetComponents.minute < anotherComponents.minute) {
            return YES;
        } else if (targetComponents.minute == anotherComponents.minute) {
            if (targetComponents.second <= anotherComponents.second) {
                return YES;
            }
        }
    }
    return NO;
}

+ (BOOL)oneDate:(NSDate *) targetDate isLaterThanDate:(NSDate *) anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    enum NSCalendarUnit calendarUnit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *targetComponents = [calendar components:calendarUnit fromDate:targetDate];
    NSDateComponents *anotherComponents = [calendar components:calendarUnit fromDate:anotherDate];
    if (targetComponents.hour > anotherComponents.hour) {
        return YES;
    } else if (targetComponents.hour == anotherComponents.hour) {
        if (targetComponents.minute > anotherComponents.minute) {
            return YES;
        } else if (targetComponents.minute == anotherComponents.minute) {
            if (targetComponents.second > anotherComponents.second) {
                return YES;
            }
        }
    }
    return NO;
}

+ (BOOL)oneDate:(NSDate *) targetDate isLaterOrEqualThanDate:(NSDate *) anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    enum NSCalendarUnit calendarUnit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *targetComponents = [calendar components:calendarUnit fromDate:targetDate];
    NSDateComponents *anotherComponents = [calendar components:calendarUnit fromDate:anotherDate];
    if (targetComponents.hour > anotherComponents.hour) {
        return YES;
    } else if (targetComponents.hour == anotherComponents.hour) {
        if (targetComponents.minute > anotherComponents.minute) {
            return YES;
        } else if (targetComponents.minute == anotherComponents.minute) {
            if (targetComponents.second >= anotherComponents.second) {
                return YES;
            }
        }
    }
    return NO;
}
@end