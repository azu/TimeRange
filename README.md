# TimeRange

[![CI Status](http://img.shields.io/travis/azu/TimeRange.svg?style=flat)](https://travis-ci.org/azu/TimeRange)
[![Version](https://img.shields.io/cocoapods/v/TimeRange.svg?style=flat)](http://cocoadocs.org/docsets/TimeRange)
[![License](https://img.shields.io/cocoapods/l/TimeRange.svg?style=flat)](http://cocoadocs.org/docsets/TimeRange)
[![Platform](https://img.shields.io/cocoapods/p/TimeRange.svg?style=flat)](http://cocoadocs.org/docsets/TimeRange)
[![Dependency Status](https://www.versioneye.com/objective-c/timerange/badge.svg?style=flat)](https://www.versioneye.com/objective-c/timerange)

TimeRange provide check if an NSDate occurs between two other NSDates.

- Check if an NSDate is contained TimeRange.( e.g. `12:00` is contained `10:00 ~ 20:00` )
- Check if an TimeRange overlaps the other TimeRange.

## Installation

TimeRange is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "TimeRange"


## Usage

You can try to:

```
pod try "TimeRange"
```

![img](http://monosnap.com/image/9NniA7H5i5cnpBnCnC0YU77aPnjbVY.png)

### API


```objc
@interface TimeRange : NSObject
// CAUTION : You should not access directory these property.
@property(nonatomic, readonly) NSDate *aDate;
@property(nonatomic, readonly) NSDate *bDate;

+ (instancetype)rangeWithStartDate:(NSDate *) startDate endDate:(NSDate *) endDate;

- (BOOL)contains:(NSDate *) targetData;

- (BOOL)overlaps:(TimeRange *) anotherTimeRange;

- (NSString *)description;
@end
```

### contains

Check if an NSDate is contained TimeRange

```objc
/*
    20:00 ~ 04:00
    
    target date is 01:00
    
    It's contained the time range.
*/
NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
[formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
[formatter setDateFormat:@"HH:mm:ss"];
NSDate *aDate = [formatter dateFromString:@"20:00"];
NSDate *bDate = [formatter dateFromString:@"04:00"];
TimeRange *timeRange = [TimeRange rangeWithStartDate:aDate bDate:bDate];
NSDate *targetDate = [formatter dateFromString:@"01:00"];
[timeRange contains:targetDate];// => YES
```


### overlaps

Compare `TimeRange`s.

``` objc
/*
    04:00 ~ 10:00
    17:00 ~ 23:00
    
    are doesn't overlap.
*/

NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
[formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
[formatter setDateFormat:@"HH:mm:ss"];
NSArray *aRangeData = @[@"04:00:00", @"10:00:00"];
NSArray *bRangeData = @[@"17:00:00", @"23:00:00"];
TimeRange *aRange = [TimeRange rangeWithStartDate:[formatter dateFromString:aRangeData[0]] bDate:[formatter dateFromString:aRangeData[1]]];
TimeRange *bRange = [TimeRange rangeWithStartDate:[formatter dateFromString:bRangeData[0]] bDate:[formatter dateFromString:bRangeData[1]]];
[aRange overlaps:bRange];// => NO
```

![overlap](http://monosnap.com/image/1NnYE3QqA3DdfxCTR9VKkbXGthBufb.png)

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT

## Acknowledgment

- [これであなたもテスト駆動開発マスター！？和田卓人さんがテスト駆動開発問題を解答コード使いながら解説します～現在時刻が関わるテストから、テスト容易性設計を学ぶ #tdd｜CodeIQ MAGAZINE](https://codeiq.jp/magazine/2013/11/1475/ "これであなたもテスト駆動開発マスター！？和田卓人さんがテスト駆動開発問題を解答コード使いながら解説します～現在時刻が関わるテストから、テスト容易性設計を学ぶ #tdd｜CodeIQ MAGAZINE")
- [和田卓人さん出題のテスト駆動開発問題『現在時刻とロケールに依存するテスト』をPHPを使ってオブジェクト指向で解答してみました #php #object_oriented｜CodeIQ MAGAZINE](https://codeiq.jp/magazine/2013/11/593/ "和田卓人さん出題のテスト駆動開発問題『現在時刻とロケールに依存するテスト』をPHPを使ってオブジェクト指向で解答してみました #php #object_oriented｜CodeIQ MAGAZINE")
