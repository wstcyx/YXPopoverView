//
//  PopoverView.m
//  Talkmate
//
//  Created by yx on 15/12/24.
//  Copyright © 2015年 yx. All rights reserved.
//

#import "PopoverView.h"
#import <QuartzCore/QuartzCore.h>

#define yxArrowHeight 12.f

#define yxBoxPadding 10.f

#define yxCPOffset 1.8f

#define yxBoxRadius 4.f

#define yxArrowCurvature 6.f

#define yxArrowHorizontalPadding 5.f

#define yxShadowAlpha 0.3f

#define yxBoxAlpha 0.65f

#define yxTopMargin 50.f

#define yxHorizontalMargin 10.f


#define yxShowDividersBetweenViews YES
#define yxDividerColor [UIColor colorWithRed:0.329 green:0.341 blue:0.353 alpha:0.15f]

#define yxGradientBottomColor [UIColor colorWithWhite:0.980f alpha:yxBoxAlpha]
#define yxGradientTopColor [UIColor colorWithWhite:1.f alpha:yxBoxAlpha]

#define yxGradientTitleBottomColor [UIColor colorWithWhite:0.93f alpha:yxBoxAlpha]
#define yxGradientTitleTopColor [UIColor colorWithWhite:1.f alpha:yxBoxAlpha]

#define yxTextFont   [UIFont systemFontOfSize:15.f]
#define yxTextColor  [UIColor colorWithRed:0.329 green:0.341 blue:0.353 alpha:1]
#define yxTextAlignment YES
#define yxTitleFont  [UIFont systemFontOfSize:18.f]
#define yxTitleColor [UIColor colorWithRed:0.329 green:0.341 blue:0.353 alpha:1]

@implementation PopoverView

+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withText:(NSString *)text delegate:(id<PopoverViewDelegate>)delegate {
    PopoverView *popoverView = [[PopoverView alloc] initWithFrame:CGRectZero];
    [popoverView showAtPoint:point inView:view withText:text];
    popoverView.delegate = delegate;
    return popoverView;
}
+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withText:(NSString *)text delegate:(id<PopoverViewDelegate>)delegate {
    PopoverView *popoverView = [[PopoverView alloc] initWithFrame:CGRectZero];
    [popoverView showAtPoint:point inView:view withTitle:title withText:text];
    popoverView.delegate = delegate;
    return popoverView;
}
+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withViewArray:(NSArray *)viewArray delegate:(id<PopoverViewDelegate>)delegate {
    PopoverView *popoverView = [[PopoverView alloc] initWithFrame:CGRectZero];
    [popoverView showAtPoint:point inView:view withViewArray:viewArray];
    popoverView.delegate = delegate;
    return popoverView;
}
+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withViewArray:(NSArray *)viewArray delegate:(id<PopoverViewDelegate>)delegate {
    PopoverView *popoverView = [[PopoverView alloc] initWithFrame:CGRectZero];
    [popoverView showAtPoint:point inView:view withTitle:title withViewArray:viewArray];
    popoverView.delegate = delegate;
    return popoverView;
}
+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withStringArray:(NSArray *)stringArray delegate:(id<PopoverViewDelegate>)delegate {
    PopoverView *popoverView = [[PopoverView alloc] initWithFrame:CGRectZero];
    [popoverView showAtPoint:point inView:view withStringArray:stringArray];
    popoverView.delegate = delegate;
    return popoverView;
}
+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withStringArray:(NSArray *)stringArray delegate:(id<PopoverViewDelegate>)delegate {
    PopoverView *popoverView = [[PopoverView alloc] initWithFrame:CGRectZero];
    [popoverView showAtPoint:point inView:view withTitle:title withStringArray:stringArray];
    popoverView.delegate = delegate;
    return popoverView;
}
+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withContentView:(UIView *)cView delegate:(id<PopoverViewDelegate>)delegate {
    PopoverView *popoverView = [[PopoverView alloc] initWithFrame:CGRectZero];
    [popoverView showAtPoint:point inView:view withTitle:title withContentView:cView];
    popoverView.delegate = delegate;
    return popoverView;
}
+ (PopoverView *)showPopoverAtPoint:(CGPoint)point inView:(UIView *)view withContentView:(UIView *)cView delegate:(id<PopoverViewDelegate>)delegate {
    PopoverView *popoverView = [[PopoverView alloc] initWithFrame:CGRectZero];
    [popoverView showAtPoint:point inView:view withContentView:cView];
    popoverView.delegate = delegate;
    return popoverView;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        showDividerRects = yxShowDividersBetweenViews;
    
    }
    return self;
}
- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withText:(NSString *)text {
    UIFont *font = yxTextFont;
    
    CGSize textSize = [text boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - yxHorizontalMargin*4.f, 1000.f) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:yxTextFont} context:nil].size;
    
    UILabel *textView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width, textSize.height)];
    textView.backgroundColor = [UIColor clearColor];
    textView.userInteractionEnabled = NO;
    [textView setNumberOfLines:0];
    textView.font = font;
    textView.textAlignment = yxTextAlignment;
    textView.textColor = [UIColor colorWithRed:84/255.f green:87/255.f blue:90/255.f alpha:1];
    textView.text = text;
    
    [self showAtPoint:point inView:view withViewArray:[NSArray arrayWithObject:textView]];
}
- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withText:(NSString *)text {
    UIFont *font = yxTextFont;
    CGSize textSize = [text boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - yxHorizontalMargin*4.f, 1000.f) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:yxTextFont} context:nil].size;
    
    UILabel *textView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width, textSize.height)];
    textView.backgroundColor = [UIColor clearColor];
    textView.userInteractionEnabled = NO;
    [textView setNumberOfLines:0];
    textView.font = font;
    textView.textAlignment = yxTextAlignment;
    textView.textColor = [UIColor colorWithRed:84/255.f green:87/255.f blue:90/255.f alpha:1];
    textView.text = text;
    
    [self showAtPoint:point inView:view withTitle:title withViewArray:[NSArray arrayWithObject:textView]];
}

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withViewArray:(NSArray *)viewArray {
    UIView *container = [[UIView alloc] initWithFrame:CGRectZero];
    
    CGFloat totalHeight = 0.f;
    CGFloat totalWidth = 0.f;
    
    int i = 0;
    
    for(UIView *yx_view in viewArray) {
        
        CGFloat padding = (i == viewArray.count-1) ? 0 : yxBoxPadding;
        
        totalHeight += yx_view.frame.size.height + padding;
        
        if(view.frame.size.width > totalWidth) {
            totalWidth = yx_view.frame.size.width;
        }
        
        [container addSubview:view];
        
        i++;
    }
    
    if(yxShowDividersBetweenViews) {
        dividerRects = [[NSMutableArray alloc] initWithCapacity:viewArray.count-1];
    }
    
    container.frame = CGRectMake(0, 0, totalWidth, totalHeight);
    
    i = 0;
    
    totalHeight = 0;
    
    for(UIView *yx_view in viewArray) {
        if([yx_view isKindOfClass:[UILabel class]]) {
            yx_view.frame = CGRectMake(yx_view.frame.origin.x, yx_view.frame.origin.y, totalWidth, yx_view.frame.size.height);
        }
        
        if(yxShowDividersBetweenViews && i != viewArray.count-1) {
            CGRect dividerRect = CGRectMake(yx_view.frame.origin.x, yx_view.frame.origin.y + yx_view.frame.size.height + yxBoxPadding*0.5f, yx_view.frame.size.width, 0.5f);
            
            [((NSMutableArray *)dividerRects) addObject:[NSValue valueWithCGRect:dividerRect]];
        }
        CGFloat padding = (i == viewArray.count-1) ? 0.f : yxBoxPadding;
        
        totalHeight += yx_view.frame.size.height + padding;
        
        i++;
    }
    
    self.subviewsArray = viewArray;
    
    [self showAtPoint:point inView:view withContentView:container];
}

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withViewArray:(NSArray *)viewArray {
    UIView *container = [[UIView alloc] initWithFrame:CGRectZero];
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:yxTitleFont}];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, titleSize.width, titleSize.height)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = yxTitleFont;
    titleLabel.textAlignment = yxTextAlignment;
    titleLabel.textColor = yxTitleColor;
    titleLabel.text = title;
    CGFloat titleHeightOffset = (titleSize.height > 0.f ? yxBoxPadding : 0.f);
    CGFloat totalHeight = titleSize.height + titleHeightOffset + yxBoxPadding;
    CGFloat totalWidth = titleSize.width;
    
    int i = 0;
    for(UIView *yx_view in viewArray) {
        
        yx_view.frame = CGRectMake(0, totalHeight, yx_view.frame.size.width, yx_view.frame.size.height);
        
        CGFloat padding = (i == viewArray.count-1) ? 0.f : yxBoxPadding;
        
        totalHeight += yx_view.frame.size.height + padding;
        
        if(yx_view.frame.size.width > totalWidth) {
            totalWidth = yx_view.frame.size.width;
        }
        
        [container addSubview:yx_view];
        
        i++;
    }
    
    if(yxShowDividersBetweenViews) {
        dividerRects = [[NSMutableArray alloc] initWithCapacity:viewArray.count-1];
    }
    
    i = 0;
    
    for(UIView *yx_view in viewArray) {
        if([yx_view isKindOfClass:[UILabel class]]) {
            yx_view.frame = CGRectMake(yx_view.frame.origin.x, yx_view.frame.origin.y, totalWidth, yx_view.frame.size.height);
        }
        
        yx_view.frame = CGRectMake(CGRectGetMinX(boxFrame) + totalWidth*0.5f - yx_view.frame.size.width*0.5f, yx_view.frame.origin.y, yx_view.frame.size.width, yx_view.frame.size.height);
        
        if(yxShowDividersBetweenViews && i != viewArray.count-1) {
            CGRect dividerRect = CGRectMake(yx_view.frame.origin.x, yx_view.frame.origin.y + yx_view.frame.size.height + yxBoxPadding*0.5f, yx_view.frame.size.width, 0.5f);
            
            [((NSMutableArray *)dividerRects) addObject:[NSValue valueWithCGRect:dividerRect]];
        }
        
        i++;
    }
    
    titleLabel.frame = CGRectMake(totalWidth*0.5f - titleSize.width*0.5f, 0, titleSize.width, titleSize.height);
    
    if(titleSize.height > 0) {
        self.titleView = titleLabel;
    }
    
    [container addSubview:titleLabel];
    
    container.frame = CGRectMake(0, 0, totalWidth, totalHeight);
    
    self.subviewsArray = viewArray;
    
    [self showAtPoint:point inView:view withContentView:container];
}

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withStringArray:(NSArray *)stringArray {
    NSMutableArray *labelArray = [[NSMutableArray alloc] initWithCapacity:stringArray.count];
    
    UIFont *font = yxTextFont;
    
    for(NSString *string in stringArray) {
        CGSize textSize = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width, textSize.height)];
        label.backgroundColor = [UIColor clearColor];
        label.font = font;
        label.textAlignment = yxTextAlignment;
        label.textColor = yxTextColor;
        label.text = string;
        label.layer.cornerRadius = 4.f;
        
        [labelArray addObject:label ];
    }
    
    [self showAtPoint:point inView:view withViewArray:labelArray ];
}

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withStringArray:(NSArray *)stringArray {
    NSMutableArray *labelArray = [[NSMutableArray alloc] initWithCapacity:stringArray.count];
    
    UIFont *font = yxTextFont;
    
    for(NSString *string in stringArray) {
        CGSize textSize = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width, textSize.height)];
        label.backgroundColor = [UIColor clearColor];
        label.font = font;
        label.textAlignment = yxTextAlignment;
        label.textColor = yxTextColor;
        label.text = string;
        label.layer.cornerRadius = 4.f;
        
        [labelArray addObject:label ];
    }
    
    [self showAtPoint:point inView:view withTitle:title withViewArray:labelArray];
}

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withTitle:(NSString *)title withContentView:(UIView *)cView {
    [self showAtPoint:point inView:view withTitle:title withViewArray:[NSArray arrayWithObject:cView]];
}

- (void)showAtPoint:(CGPoint)point inView:(UIView *)view withContentView:(UIView *)cView {
    
    self.contentView = cView;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    UIView *topView = [[window subviews] objectAtIndex:0];
    
    CGPoint topPoint = [topView convertPoint:point fromView:view];
    
    arrowPoint = topPoint;
    
    //NSLog(@"arrowPoint:%f,%f", arrowPoint.x, arrowPoint.y);
    CGRect topViewBounds = topView.bounds;
    
    CGFloat contentHeight = self.contentView.frame.size.height;
    CGFloat contentWidth = self.contentView.frame.size.width;
    
    CGFloat padding = yxBoxPadding;
    
    CGFloat boxHeight = contentHeight + 2.f*padding;
    CGFloat boxWidth = contentWidth + 2.f*padding;
    
    CGFloat xOrigin = 0.f;
    
    if(arrowPoint.x + yxArrowHeight > topViewBounds.size.width - yxHorizontalMargin - yxBoxRadius - yxArrowHorizontalPadding) {
        arrowPoint.x = topViewBounds.size.width - yxHorizontalMargin - yxBoxRadius - yxArrowHorizontalPadding - yxArrowHeight;
    }
    else if(arrowPoint.x - yxArrowHeight < yxHorizontalMargin + yxBoxRadius + yxArrowHorizontalPadding) {
        arrowPoint.x = yxHorizontalMargin + yxArrowHeight + yxBoxRadius + yxArrowHorizontalPadding;
    }
    
    xOrigin = arrowPoint.x - boxWidth*0.5f;
    
    if(xOrigin < CGRectGetMinX(topViewBounds) + yxHorizontalMargin) {
        xOrigin = CGRectGetMinX(topViewBounds) + yxHorizontalMargin;
    }
    else if(xOrigin + boxWidth > CGRectGetMaxX(topViewBounds) - yxHorizontalMargin) {
        xOrigin = CGRectGetMaxX(topViewBounds) - yxHorizontalMargin - boxWidth;
    }
    
    CGFloat arrowHeight = yxArrowHeight;
    
    CGFloat topPadding = yxTopMargin;
    above = YES;
    
    if(topPoint.y - contentHeight - arrowHeight - topPadding < CGRectGetMinY(topViewBounds)) {
        above = NO;
        boxFrame = CGRectMake(xOrigin, arrowPoint.y + arrowHeight, boxWidth, boxHeight);
    } else {
        above = YES;
        boxFrame = CGRectMake(xOrigin, arrowPoint.y - arrowHeight - boxHeight, boxWidth, boxHeight);
    }
    CGRect contentFrame = CGRectMake(boxFrame.origin.x + padding, boxFrame.origin.y + padding, contentWidth, contentHeight);
    self.contentView.frame = contentFrame;
    [self addSubview:self.contentView];
    self.layer.anchorPoint = CGPointMake(arrowPoint.x / topViewBounds.size.width, arrowPoint.y / topViewBounds.size.height);
    self.frame = topViewBounds;
    [self setNeedsDisplay];
    [topView addSubview:self];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tap];
    
    self.userInteractionEnabled = YES;
    self.alpha = 0.f;
    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1.f;
        self.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
    
}

- (void)showActivityIndicatorWithMessage:(NSString *)msg {
    if([self.titleView isKindOfClass:[UILabel class]]) {
        ((UILabel *)self.titleView).text = msg;
    }
    
    if(self.subviewsArray && (self.subviewsArray.count > 0)) {
        [UIView animateWithDuration:0.2f animations:^{
            for(UIView *view in self.subviewsArray) {
                view.alpha = 0.f;
            }
        }];
        
        if(showDividerRects) {
            showDividerRects = NO;
            [self setNeedsDisplay];
        }
    }
    
    if(activityIndicator) {
        [activityIndicator removeFromSuperview];
        activityIndicator = nil;
    }
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.frame = CGRectMake(CGRectGetMidX(self.contentView.bounds) - 10.f, CGRectGetMidY(self.contentView.bounds) - 10.f + 20.f, 20.f, 20.f);
    [self.contentView addSubview:activityIndicator];
    
    [activityIndicator startAnimating];
}

- (void)hideActivityIndicatorWithMessage:(NSString *)msg {
    if([self.titleView isKindOfClass:[UILabel class]]) {
        ((UILabel *)self.titleView).text = msg;
    }
    
    [activityIndicator stopAnimating];
    [UIView animateWithDuration:0.1f animations:^{
        activityIndicator.alpha = 0.f;
    } completion:^(BOOL finished) {
        [activityIndicator removeFromSuperview];
        activityIndicator = nil;
    }];
}

- (void)showImage:(UIImage *)image withMessage:(NSString *)msg {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.alpha = 0.f;
    imageView.frame = CGRectMake(CGRectGetMidX(self.contentView.bounds) - image.size.width*0.5f, CGRectGetMidY(self.contentView.bounds) - image.size.height*0.5f + 20.f, image.size.width, image.size.height);
    imageView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    
    [self.contentView addSubview:imageView ];
    
    if(self.subviewsArray && (self.subviewsArray.count > 0)) {
        [UIView animateWithDuration:0.2f animations:^{
            for(UIView *view in self.subviewsArray) {
                view.alpha = 0.f;
            }
        }];
        
        if(showDividerRects) {
            showDividerRects = NO;
            [self setNeedsDisplay];
        }
    }
    
    if(msg) {
        if([self.titleView isKindOfClass:[UILabel class]]) {
            ((UILabel *)self.titleView).text = msg;
        }
    }
    
    [UIView animateWithDuration:0.2f delay:0.2f options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.alpha = 1.f;
        imageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //[imageView removeFromSuperview];
    }];
}

- (void)showError {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:nil];
    imageView.alpha = 0.f;
    imageView.frame = CGRectMake(CGRectGetMidX(self.contentView.bounds) - 20.f, CGRectGetMidY(self.contentView.bounds) - 20.f + 20.f, 40.f, 40.f);
    imageView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    
    [self.contentView addSubview:imageView];
    
    if(self.subviewsArray && (self.subviewsArray.count > 0)) {
        [UIView animateWithDuration:0.1f animations:^{
            for(UIView *view in self.subviewsArray) {
                view.alpha = 0.f;
            }
        }];
        
        if(showDividerRects) {
            showDividerRects = NO;
            [self setNeedsDisplay];
        }
    }
    
    [UIView animateWithDuration:0.1f delay:0.1f options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.alpha = 1.f;
        imageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //[imageView removeFromSuperview];
    }];
    
}

- (void)showSuccess {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:nil];
    imageView.alpha = 0.f;
    imageView.frame = CGRectMake(CGRectGetMidX(self.contentView.bounds) - 20.f, CGRectGetMidY(self.contentView.bounds) - 20.f + 20.f, 40.f, 40.f);
    imageView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    
    [self.contentView addSubview:imageView];
    
    if(self.subviewsArray && (self.subviewsArray.count > 0)) {
        [UIView animateWithDuration:0.1f animations:^{
            for(UIView *view in self.subviewsArray) {
                view.alpha = 0.f;
            }
        }];
        
        if(showDividerRects) {
            showDividerRects = NO;
            [self setNeedsDisplay];
        }
    }
    
    [UIView animateWithDuration:0.1f delay:0.1f options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.alpha = 1.f;
        imageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //[imageView removeFromSuperview];
    }];
    
}



#pragma mark - User Interaction

- (void)tapped:(UITapGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:self.contentView];
    BOOL found = NO;
    for(int i = 0; i < self.subviewsArray.count && !found; i++) {
        UIView *view = [self.subviewsArray objectAtIndex:i];
        if(CGRectContainsPoint(view.frame, point)) {
            found = YES;
            if(self.delegate && [self.delegate respondsToSelector:@selector(popoverView:didSelectItemAtIndex:)]) {
                [self.delegate popoverView:self didSelectItemAtIndex:i];
            }
            break;
        }
    }
    if(!found && CGRectContainsPoint(self.contentView.bounds, point)) {
        found = YES;
    }
    if(!found) {
        [self dismiss];
    }
}

- (void)dismiss {
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.1f;
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
        if(self.delegate && [self.delegate respondsToSelector:@selector(popoverViewDidDismiss:)]) {
            [self.delegate popoverViewDidDismiss:self];
        }
    }];
}

- (void)drawRect:(CGRect)rect
{
    CGRect frame = boxFrame;
    
    CGFloat xMin = CGRectGetMinX(frame);
    CGFloat yMin = CGRectGetMinY(frame);
    
    CGFloat xMax = CGRectGetMaxX(frame);
    CGFloat yMax = CGRectGetMaxY(frame);
    
    CGFloat radius = yxBoxRadius;
    
    CGFloat cpOffset = yxCPOffset;
    
    
    
    UIBezierPath *popoverPath = [UIBezierPath bezierPath];
    [popoverPath moveToPoint:CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + radius)];
    [popoverPath addCurveToPoint:CGPointMake(xMin + radius, yMin) controlPoint1:CGPointMake(xMin, yMin + radius - cpOffset) controlPoint2:CGPointMake(xMin + radius - cpOffset, yMin)];
    
    if(!above) {
        [popoverPath addLineToPoint:CGPointMake(arrowPoint.x - yxArrowHeight, yMin)];
        [popoverPath addCurveToPoint:arrowPoint controlPoint1:CGPointMake(arrowPoint.x - yxArrowHeight + yxArrowCurvature, yMin) controlPoint2:arrowPoint];
        [popoverPath addCurveToPoint:CGPointMake(arrowPoint.x + yxArrowHeight, yMin) controlPoint1:arrowPoint controlPoint2:CGPointMake(arrowPoint.x + yxArrowHeight - yxArrowCurvature, yMin)];
    }
    
    [popoverPath addLineToPoint:CGPointMake(xMax - radius, yMin)];
    [popoverPath addCurveToPoint:CGPointMake(xMax, yMin + radius) controlPoint1:CGPointMake(xMax - radius + cpOffset, yMin) controlPoint2:CGPointMake(xMax, yMin + radius - cpOffset)];
    [popoverPath addLineToPoint:CGPointMake(xMax, yMax - radius)];
    [popoverPath addCurveToPoint:CGPointMake(xMax - radius, yMax) controlPoint1:CGPointMake(xMax, yMax - radius + cpOffset) controlPoint2:CGPointMake(xMax - radius + cpOffset, yMax)];
    if(above) {
        [popoverPath addLineToPoint:CGPointMake(arrowPoint.x + yxArrowHeight, yMax)];
        [popoverPath addCurveToPoint:arrowPoint controlPoint1:CGPointMake(arrowPoint.x + yxArrowHeight - yxArrowCurvature, yMax) controlPoint2:arrowPoint];
        [popoverPath addCurveToPoint:CGPointMake(arrowPoint.x - yxArrowHeight, yMax) controlPoint1:arrowPoint controlPoint2:CGPointMake(arrowPoint.x - yxArrowHeight + yxArrowCurvature, yMax)];
    }
    [popoverPath addLineToPoint:CGPointMake(xMin + radius, yMax)];
    [popoverPath addCurveToPoint:CGPointMake(xMin, yMax - radius) controlPoint1:CGPointMake(xMin + radius - cpOffset, yMax) controlPoint2:CGPointMake(xMin, yMax - radius + cpOffset)];
    [popoverPath closePath];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor* shadow = [UIColor colorWithWhite:0.f alpha:yxShadowAlpha];
    CGSize shadowOffset = CGSizeMake(0, 1);
    CGFloat shadowBlurRadius = 10;
    
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)yxGradientTopColor.CGColor,
                               (id)yxGradientBottomColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientColors, gradientLocations);
    
    CGFloat bottomOffset = (above ? yxArrowHeight : 0.f);
    CGFloat topOffset = (!above ? yxArrowHeight : 0.f);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [popoverPath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame) - topOffset), CGPointMake(CGRectGetMidX(frame), CGRectGetMaxY(frame) + bottomOffset), 0);
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    {
        CGFloat titleBGHeight = -1;
        //NSLog(@"titleView:%@", titleView);
        
        if(self.titleView != nil) {
            titleBGHeight = yxBoxPadding*2.f + self.titleView.frame.size.height;
        }
        
        if(titleBGHeight > 0.f) {
            CGPoint startingPoint = CGPointMake(xMin, yMin + titleBGHeight);
            CGPoint endingPoint = CGPointMake(xMax, yMin + titleBGHeight);
            
            UIBezierPath *titleBGPath = [UIBezierPath bezierPath];
            [titleBGPath moveToPoint:startingPoint];
            [titleBGPath addLineToPoint:CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + radius)];
            [titleBGPath addCurveToPoint:CGPointMake(xMin + radius, yMin) controlPoint1:CGPointMake(xMin, yMin + radius - cpOffset) controlPoint2:CGPointMake(xMin + radius - cpOffset, yMin)];
            
            if(!above) {
                [titleBGPath addLineToPoint:CGPointMake(arrowPoint.x - yxArrowHeight, yMin)];
                [titleBGPath addCurveToPoint:arrowPoint controlPoint1:CGPointMake(arrowPoint.x - yxArrowHeight + yxArrowCurvature, yMin) controlPoint2:arrowPoint];
                [titleBGPath addCurveToPoint:CGPointMake(arrowPoint.x + yxArrowHeight, yMin) controlPoint1:arrowPoint controlPoint2:CGPointMake(arrowPoint.x + yxArrowHeight - yxArrowCurvature, yMin)];
            }
            
            [titleBGPath addLineToPoint:CGPointMake(xMax - radius, yMin)];
            [titleBGPath addCurveToPoint:CGPointMake(xMax, yMin + radius) controlPoint1:CGPointMake(xMax - radius + cpOffset, yMin) controlPoint2:CGPointMake(xMax, yMin + radius - cpOffset)];
            [titleBGPath addLineToPoint:endingPoint];
            [titleBGPath addLineToPoint:startingPoint];
            [titleBGPath closePath];
            
            CGColorSpaceRef colorSpace1 = CGColorSpaceCreateDeviceRGB();
            CGContextRef context1 = UIGraphicsGetCurrentContext();
            
            NSArray* gradientColors1 = [NSArray arrayWithObjects:
                                       (id)yxGradientTitleTopColor.CGColor,
                                       (id)yxGradientTitleBottomColor.CGColor, nil];
            CGFloat gradientLocations1[] = {0, 1};
            CGGradientRef gradient1 = CGGradientCreateWithColors(colorSpace1, (CFArrayRef)gradientColors1, gradientLocations1);
            
            CGFloat topOffset1 = (!above ? yxArrowHeight : 0.f);
            
            CGContextSaveGState(context1);
            CGContextBeginTransparencyLayer(context1, NULL);
            [titleBGPath addClip];
            CGContextDrawLinearGradient(context1, gradient1, CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame) - topOffset1), CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame) + titleBGHeight), 0);
            CGContextEndTransparencyLayer(context1);
            CGContextRestoreGState(context1);
            UIBezierPath *dividerLine = [UIBezierPath bezierPathWithRect:CGRectMake(startingPoint.x, startingPoint.y, (endingPoint.x - startingPoint.x), 0.5f)];
            [[UIColor colorWithRed:0.741 green:0.741 blue:0.741 alpha:0.5f] setFill];
            [dividerLine fill];
            CGGradientRelease(gradient1);
            CGColorSpaceRelease(colorSpace1);
        }
    }
    
    
    {
        if(yxShowDividersBetweenViews && showDividerRects) {
            if(dividerRects && dividerRects.count > 0) {
                for(NSValue *value in dividerRects) {
                    CGRect rect1 = value.CGRectValue;
                    rect1.origin.x += self.contentView.frame.origin.x;
                    rect1.origin.y += self.contentView.frame.origin.y;
                    UIBezierPath *dividerPath = [UIBezierPath bezierPathWithRect:rect1];
                    [yxDividerColor setFill];
                    [dividerPath fill];
                }
            }
        }
    }
}


@end

