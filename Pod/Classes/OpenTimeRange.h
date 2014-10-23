//
// Created by azu on 2014/10/23.
//


#import <Foundation/Foundation.h>
#import "TimeRange.h"

/*
+-----+                       +--------+
|     |                       |        |
|     |                       |        |
|     |                       |        |
TimeRange---------------------|  Open  |------->
|     |                       |        |
|     |                       |        |
+-----+                       +--------+

 */
@interface OpenTimeRange : TimeRange
@end