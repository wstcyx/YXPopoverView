//
//  PopoverView.h
//  Talkmate
//
//  Created by yx on 15/12/24.
//  Copyright © 2015年 yx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopoverView;

@protocol PopoverViewDelegate <NSObject>

@optional

- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index;
- (void)popoverViewDidDismiss:(PopoverView *)popoverView;

@end

@interface PopoverView : UIView {
    CGRect boxFrame;
    CGSize contentSize;
    CGPoint arrowPoint;
    BOOL above;
    NSArray *dividerRects;
    UIActivityIndicatorView *activityIndicator;
    BOOL showDividerRects;
}

@property (nonatomic, retain) UIView *titleView;

@property (nonatomic, retain) UIView *contentView;

@property (nonatomic, retain) NSArray *subviewsArray;

@property (nonatomic, assign) id<PopoverViewDelegate> delegate;



+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withText:(NSString *)text delegate:(id<PopoverViewDelegate>)delegate;

+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withText:(NSString *)text delegate:(id<PopoverViewDelegate>)delegate;

+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withViewArray:(NSArray *)viewArray delegate:(id<PopoverViewDelegate>)delegate;

+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withViewArray:(NSArray *)viewArray delegate:(id<PopoverViewDelegate>)delegate;

+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withStringArray:(NSArray *)stringArray delegate:(id<PopoverViewDelegate>)delegate;

+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withStringArray:(NSArray *)stringArray delegate:(id<PopoverViewDelegate>)delegate;

+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withContentView:(UIView *)cView delegate:(id<PopoverViewDelegate>)delegate;

+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withContentView:(UIView *)cView delegate:(id<PopoverViewDelegate>)delegate;
#pragma mark - Instance Showing Methods

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withContentView:(UIView *)contentView;

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withText:(NSString *)text;

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withViewArray:(NSArray *)viewArray;

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withViewArray:(NSArray *)viewArray;

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withStringArray:(NSArray *)stringArray;

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withStringArray:(NSArray *)stringArray;

#pragma mark - Dismissal
- (void)dismiss;

#pragma mark - Activity Indicator Methods

- (void)showActivityIndicatorWithMessage:(NSString *)msg;

- (void)hideActivityIndicatorWithMessage:(NSString *)msg;

#pragma mark - Custom Image Showing

- (void)showImage:(UIImage *)image withMessage:(NSString *)msg;

#pragma mark - Error/Success Methods

- (void)showError;

- (void)showSuccess;


@end
