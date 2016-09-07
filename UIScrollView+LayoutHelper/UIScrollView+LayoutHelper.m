//
//  UIScrollView+LayoutHelper.m
//  ZhiTong
//
//  Created by 王亮 on 16/4/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIScrollView+LayoutHelper.h"

@implementation UIScrollView(LayoutHelper)

+ (void)layoutScrollView:(UIScrollView *)scrollView withSubViews:(NSArray *)subviewsArray isVertical:(BOOL)isVertical {
    
    NSDictionary *firstViewInfoDict = (NSDictionary *)[subviewsArray firstObject];
    UIView *firstView = (UIView *)firstViewInfoDict[@"view"];
    CGPoint firstTopLeft = CGPointMake(firstView.frame.origin.x, firstView.frame.origin.y);
    
    CGFloat currentTop = firstTopLeft.y;
    CGFloat currentLeft = firstTopLeft.x;
    for (NSDictionary *viewInfoDict in subviewsArray) {
        
        UIView *view = (UIView *)viewInfoDict[@"view"];
        CGFloat padding = [viewInfoDict[@"padding"] doubleValue];
        
        if (isVertical) {
            view.frame = CGRectMake((scrollView.frame.size.width-view.frame.size.width)/2.0, currentTop+padding, view.frame.size.width, view.frame.size.height);
            
            currentTop += view.frame.size.height;
            currentTop += padding;
            
            currentLeft = view.frame.origin.x;
        } else {
            
            view.frame = CGRectMake(currentLeft+padding, currentTop, view.frame.size.width, view.frame.size.height);
            
            currentLeft += view.frame.size.width;
            currentLeft += padding;
            
            currentTop = view.frame.origin.y;
        }
        
        [scrollView addSubview:view];
    }
    
    if (isVertical) {
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, currentTop);
    } else {
        scrollView.contentSize = CGSizeMake(currentLeft, scrollView.frame.size.height);
    }
    
    subviewsArray = nil;
}

+ (void)relayoutScrollView:(UIScrollView *)scrollView withSubViews:(NSArray *)subviewsArray isVertical:(BOOL)isVertical {
    
    NSDictionary *firstViewInfoDict = (NSDictionary *)[subviewsArray firstObject];
    UIView *firstView = (UIView *)firstViewInfoDict[@"view"];
    CGPoint firstTopLeft = CGPointMake(firstView.frame.origin.x, firstView.frame.origin.y);
    
    CGFloat currentTop = firstTopLeft.y;
    CGFloat currentLeft = firstTopLeft.x;
    for (NSDictionary *viewInfoDict in subviewsArray) {
        
        UIView *view = (UIView *)viewInfoDict[@"view"];
        CGFloat padding = [viewInfoDict[@"padding"] doubleValue];
        
        if (isVertical) {
            view.frame = CGRectMake((scrollView.frame.size.width-view.frame.size.width)/2.0, currentTop+padding, view.frame.size.width, view.frame.size.height);
            
            currentTop += view.frame.size.height;
            currentTop += padding;
            
            currentLeft = view.frame.origin.x;
        } else {
            view.frame = CGRectMake(currentLeft+padding, currentTop, view.frame.size.width, view.frame.size.height);
            
            currentLeft += view.frame.size.width;
            currentLeft += padding;
            
            currentTop = view.frame.origin.y;
        }
    }
    
    if (isVertical) {
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, currentTop);
    } else {
        scrollView.contentSize = CGSizeMake(currentLeft, scrollView.frame.size.height);
    }
    
    subviewsArray = nil;
}

@end
