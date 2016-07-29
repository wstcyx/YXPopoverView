//
//  ViewController.m
//  popoverView
//
//  Created by yx on 15/12/26.
//  Copyright © 2015年 yx. All rights reserved.
//

#import "ViewController.h"
#import "PopoverView.h"
#import "YXDaysView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.view);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCLick:)];
    [self.view addGestureRecognizer:tap];

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    label.center = self.view.center;
    label.textAlignment = YES;
    label.text = @"touch anyWhere";
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tapCLick:(UITapGestureRecognizer *)tap{
    CGPoint point = [tap locationInView:self.view];
//    [PopoverView showPopoverAtPoint:point inView:self.view withText:@"This is a very long popover box.  As you can see, it goes to multiple lines in size." delegate:(id)self]; //Show text wrapping popover with long string
    
//    [PopoverView showPopoverAtPoint:point inView:self.view withTitle:@"This is a title" withText:@"This is text" delegate:(id)self]; //Show text with title
    
//    [PopoverView showPopoverAtPoint:point inView:self.view withStringArray:@[@"ffff",@"sd",@"sdfds"] delegate:(id)self]; //Show the string array defined at top of this file
//    [PopoverView showPopoverAtPoint:point inView:self.view withTitle:@"ds" withStringArray:@[@"2sdfd",@"111",@"sdfsd"] delegate:(id)self];

    
    //Here's a custom view
    YXDaysView *daysView = [[YXDaysView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    [daysView setMonth:12];
    [daysView setYear:2015];
    daysView.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.f];
    daysView.layer.borderColor = [UIColor colorWithWhite:0.9f alpha:1.f].CGColor;
    daysView.layer.borderWidth = 0.5f;
    daysView.layer.cornerRadius = 4.f;
    daysView.layer.masksToBounds = YES;
//    [PopoverView showPopoverAtPoint:point inView:self.view withContentView:daysView  delegate:(id)self]; //Show calendar with no title
    [PopoverView showPopoverAtPoint:point inView:self.view withTitle:@"December 2015" withContentView:daysView delegate:(id)self]; //Show calendar with title

}
#pragma mark - PopoverViewDelegate Methods

- (void)popoverView:(PopoverView *)popoverView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"%s item:%ld", __PRETTY_FUNCTION__, (long)index);
    
    
    //Show a success image, with the string from the array
    [popoverView showImage:[UIImage imageNamed:@"success"] withMessage:@"dsfsdfds"];
    
    //Dismiss the PopoverView after 0.5 seconds
    [popoverView performSelector:@selector(dismiss) withObject:nil afterDelay:0.5f];
}

- (void)popoverViewDidDismiss:(PopoverView *)popoverView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
