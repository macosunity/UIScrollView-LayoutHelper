//
//  ViewController.m
//  UIScrollView+LayoutHelper
//
//  Created by 王亮 on 16/9/1.
//  Copyright © 2016年 王亮. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+LayoutHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *verticalScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:verticalScrollView];
    
    NSMutableArray *vSubviewsArray = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
        lbl.text = [NSString stringWithFormat:@"我是第%d个", i+1];
        lbl.backgroundColor = [UIColor colorWithRed:10*i/255.0 green:100/255.0 blue:25*i/255.0 alpha:1.0];
        
        [vSubviewsArray addObject:@{ @"view": lbl, @"padding" : (i==0?@(0):@(i*2+5)) }];
    }
    
    UIScrollView *horizontalScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    [vSubviewsArray addObject:@{@"view": horizontalScrollView, @"padding" : @(5)}];
    
    NSMutableArray *hSubviewsArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
        lbl.text = [NSString stringWithFormat:@"我是第%d个", i+1];
        lbl.backgroundColor = [UIColor colorWithRed:10*i/255.0 green:100/255.0 blue:25*i/255.0 alpha:1.0];
        
        [hSubviewsArray addObject:@{ @"view": lbl, @"padding" : (i==0?@(0):@(5)) }];
    }
    [UIScrollView setupScrollView:horizontalScrollView withSubViews:hSubviewsArray isVertical:NO];


    [UIScrollView setupScrollView:verticalScrollView withSubViews:vSubviewsArray isVertical:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
