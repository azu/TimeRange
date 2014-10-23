//
// Created by azu on 2014/10/23.
//


#import <Foundation/Foundation.h>


@interface TimeRange : NSObject
@property(nonatomic) NSDate *startDate;
@property(nonatomic) NSDate *endDate;

- (BOOL)contains:(NSDate *) targetData;

- (BOOL)overlaps:(TimeRange *) anotherTimeRange;
@end