/**
 *
 * Fire https://github.com/taylorwrynn/fire
 *
 * Copyright (C) 2017 Taylor Tang
 *
 * Released under the Apache license v2 http://www.apache.org/licenses/
 *
 */

#import "UIScrollView+TXPage.h"
#import <Masonry/Masonry.h>

@implementation UIScrollView (TXPage)

- (void)setPages:(NSArray<UIView *> *)pages
{
    for (UIView *view in self.subviews)
    {
        [view removeFromSuperview];
    }
    
    UIView *contentView = [[UIView alloc] init];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.edges.equalTo(self);
        maker.height.equalTo(self);
    }];
    
    UIView *lastPage = nil;
    for (UIView *page in pages)
    {
        [self addSubview:page];
        [page mas_makeConstraints:^(MASConstraintMaker *maker){
            maker.left.equalTo(lastPage ? lastPage.mas_right : self);
            maker.top.and.height.and.width.equalTo(self);
        }];
        lastPage = page;
    }
    [contentView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.right.equalTo(lastPage);
    }];
}

@end
