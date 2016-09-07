//
//  UIScrollView+LayoutHelper.h
//  ZhiTong
//
//  Created by 王亮 on 16/4/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView(LayoutHelper)

/**
 *  UIScrollView垂直和水平布局
 *
 *  @param scrollView    scrollView容器
 *  @param subviewsArray 传入的UIView数组 数组元素格式@{@"view":aView, @"padding":@(5)} 垂直布局时padding为垂直间距，水平布局时padding为水平间距，padding为距上一个view的距离
 *  @param isVertical    是否垂直布局
 */
+ (void)layoutScrollView:(UIScrollView *)scrollView withSubViews:(NSArray *)subviewsArray isVertical:(BOOL)isVertical;

//scrollView重新布局，用法同上，该方法不会调用 [scrollView addSubview:xxx];
+ (void)relayoutScrollView:(UIScrollView *)scrollView withSubViews:(NSArray *)subviewsArray isVertical:(BOOL)isVertical;

@end
