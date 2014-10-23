//
// Created by azu on 2014/10/23.
//


#import <Foundation/Foundation.h>


@interface TimeRangeCompareUtil : NSObject
+ (BOOL)oneDate:(NSDate *) targetDate isEarlierThanDate:(NSDate *) anotherDate;

+ (BOOL)oneDate:(NSDate *) targetDate isEarlierThanOrEqualDate:(NSDate *) anotherDate;

+ (BOOL)oneDate:(NSDate *) targetDate isLaterThanDate:(NSDate *) anotherDate;

+ (BOOL)oneDate:(NSDate *) targetDate isLaterOrEqualThanDate:(NSDate *) anotherDate;
@end