//
//  YXDaysView.h
//  popoverView
//
//  Created by yx on 15/12/26.
//  Copyright © 2015年 yx. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface YXDaysView : UIView {
    NSInteger startCellX;
    NSInteger startCellY;
    NSInteger endCellX;
    NSInteger endCellY;
    
    CGFloat xOffset;
    CGFloat yOffset;
    
    CGFloat hDiff;
    CGFloat vDiff;
    
    NSInteger currentMonth;
    NSInteger currentYear;
    
    BOOL didAddExtraRow;
}

- (void)setMonth:(NSInteger)month;
- (void)setYear:(NSInteger)year;

- (void)resetRows;

- (BOOL)addExtraRow;
@end
