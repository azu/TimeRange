//
// Created by azu on 2014/10/23.
//


#import <Foundation/Foundation.h>

/*
    This Class is abstract class.
    Open/Closed TimeRange
    Ref. https://codeiq.jp/magazine/2013/11/593/
 */
@interface TimeRange : NSObject
// CAUTION : You should not access directory these property.
@property(nonatomic, readonly) NSDate *aDate;
@property(nonatomic, readonly) NSDate *bDate;

+ (instancetype)rangeWithStartDate:(NSDate *) startDate endDate:(NSDate *) endDate;

- (BOOL)contains:(NSDate *) targetData;

- (BOOL)overlaps:(TimeRange *) anotherTimeRange;

- (NSString *)description;
@end