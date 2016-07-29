//
//  YXDaysView.m
//  popoverView
//
//  Created by 200h-53-1 on 15/12/26.
//  Copyright © 2015年 yx. All rights reserved.
//

#import "YXDaysView.h"

@implementation YXDaysView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        
        startCellX = 3;
        startCellY = 0;
        endCellX = 3;
        endCellY = 0;
        
        hDiff = floorf(frame.size.width / 7.f);
        vDiff = floorf(frame.size.height / 4.f);
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    //    CGSize shadow2Offset = CGSizeMake(1, 1);
    //    CGFloat shadow2BlurRadius = 1;
    //    CGColorRef shadow2 = [UIColor blackColor].CGColor;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger month = currentMonth;
    NSInteger year = currentYear;
    
    //Get the first day of the month
    NSDateComponents *dateParts = [[NSDateComponents alloc] init];
    [dateParts setMonth:month];
    [dateParts setYear:year];
    [dateParts setDay:1];
    NSDate *dateOnFirst = [calendar dateFromComponents:dateParts];
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:dateOnFirst];
    NSInteger weekdayOfFirst = [weekdayComponents weekday];
    
    //NSLog(@"weekdayOfFirst:%d", weekdayOfFirst);
    
    NSInteger numDaysInMonth = [calendar rangeOfUnit:NSCalendarUnitDay
                                        inUnit:NSCalendarUnitMonth
                                       forDate:dateOnFirst].length;
    
    //NSLog(@"month:%d, numDaysInMonth:%d", currentMonth, numDaysInMonth);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    didAddExtraRow = NO;
    
    
    
    //Find number of days in previous month
    NSDateComponents *prevDateParts = [[NSDateComponents alloc] init];
    [prevDateParts setMonth:month-1];
    [prevDateParts setYear:year];
    [prevDateParts setDay:1];
    
    NSDate *prevDateOnFirst = [calendar dateFromComponents:prevDateParts];
    
    
    NSInteger numDaysInPrevMonth = [calendar rangeOfUnit:NSCalendarUnitDay
                                            inUnit:NSCalendarUnitMonth
                                           forDate:prevDateOnFirst].length;
    
    NSDateComponents *today = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    //Draw the text for each of those days.
    for(NSInteger i = 0; i <= weekdayOfFirst-2; i++) {
        NSInteger day = numDaysInPrevMonth - weekdayOfFirst + 2 + i;
        
        NSString *str = [NSString stringWithFormat:@"%ld", (long)day];
        
        
        
        CGContextSaveGState(context);
        //        CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2);
        CGRect dayHeader2Frame = CGRectMake((i)*hDiff, 0, 21, 14);
        [[UIColor colorWithWhite:0.6f alpha:1.0f] setFill];
        [str drawInRect: dayHeader2Frame withFont: [UIFont fontWithName: @"Helvetica" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: YES];
        CGContextRestoreGState(context);
    }
    
    
    BOOL endedOnSat = NO;
    NSInteger finalRow = 0;
    NSInteger day = 1;
    for (NSInteger i = 0; i < 6; i++) {
        for(NSInteger j = 0; j < 7; j++) {
            NSInteger dayNumber = i * 7 + j;
            
            if(dayNumber >= (weekdayOfFirst-1) && day <= numDaysInMonth) {
                NSString *str = [NSString stringWithFormat:@"%ld", (long)day];
                
                CGContextSaveGState(context);
                //                CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2);
                CGRect dayHeader2Frame = CGRectMake(j*hDiff, i*vDiff, 21, 14);
                if([today day] == day && [today month] == month && [today year] == year) {
                    [[UIColor colorWithRed: 0.98 green: 0.24 blue: 0.09 alpha: 1] setFill];
                } else {
                    [[UIColor colorWithWhite:0.2f alpha:1.f] setFill];
                }
                [str drawInRect: dayHeader2Frame withFont: [UIFont fontWithName: @"Helvetica" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: YES];
                CGContextRestoreGState(context);
                
                finalRow = i;
                
                if(day == numDaysInMonth && j == 6) {
                    endedOnSat = YES;
                }
                
                if(i == 5) {
                    didAddExtraRow = YES;
                    //NSLog(@"didAddExtraRow");
                }
                
                ++day;
            }
        }
    }
    
    //Find number of days in previous month
    NSDateComponents *nextDateParts = [[NSDateComponents alloc] init];
    [nextDateParts setMonth:month+1];
    [nextDateParts setYear:year];
    [nextDateParts setDay:1];
    
    NSDate *nextDateOnFirst = [calendar dateFromComponents:nextDateParts];
    
    
    NSDateComponents *nextWeekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:nextDateOnFirst];
    NSInteger weekdayOfNextFirst = [nextWeekdayComponents weekday];
    
    if(!endedOnSat) {
        //Draw the text for each of those days.
        for(NSInteger i = weekdayOfNextFirst - 1; i < 7; i++) {
            NSInteger day = i - weekdayOfNextFirst + 2;
            
            NSString *str = [NSString stringWithFormat:@"%ld", (long)day];
            
            CGContextSaveGState(context);
            //            CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2);
            CGRect dayHeader2Frame = CGRectMake((i)*hDiff, finalRow * vDiff, 21, 14);
            [[UIColor colorWithWhite:0.6f alpha:1.0f] setFill];
            [str drawInRect: dayHeader2Frame withFont: [UIFont fontWithName: @"Helvetica" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: YES];
            CGContextRestoreGState(context);
        }
    }
}

- (void)setMonth:(NSInteger)month {
    currentMonth = month;
    [self setNeedsDisplay];
}

- (void)setYear:(NSInteger)year {
    currentYear = year;
    [self setNeedsDisplay];
}

- (void)resetRows {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger month = currentMonth;
    NSInteger year = currentYear;
    
    //Get the first day of the month
    NSDateComponents *dateParts = [[NSDateComponents alloc] init];
    [dateParts setMonth:month];
    [dateParts setYear:year];
    [dateParts setDay:1];
    NSDate *dateOnFirst = [calendar dateFromComponents:dateParts];
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:dateOnFirst];
    NSInteger weekdayOfFirst = [weekdayComponents weekday];
    
    NSInteger numDaysInMonth = [calendar rangeOfUnit:NSCalendarUnitDay
                                        inUnit:NSCalendarUnitMonth
                                       forDate:dateOnFirst].length;
    didAddExtraRow = NO;
    
    NSInteger day = 1;
    for (NSInteger i = 0; i < 6; i++) {
        for(NSInteger j = 0; j < 7; j++) {
            NSInteger dayNumber = i * 7 + j;
            if(dayNumber >= (weekdayOfFirst - 1) && day <= numDaysInMonth) {
                if(i == 5) {
                    didAddExtraRow = YES;
                    //NSLog(@"didAddExtraRow");
                }
                ++day;
            }
        }
    }
}

- (BOOL)addExtraRow {
    return didAddExtraRow;
}

@end

