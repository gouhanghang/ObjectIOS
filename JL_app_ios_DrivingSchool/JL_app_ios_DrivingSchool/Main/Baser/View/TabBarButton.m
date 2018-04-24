//
//  TabBarButton.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//

#define CMTabButtonImageRotio 0.6
#define CMTabNomalColor JLrgb(130, 137, 153)
#define CMTabSelectedColor JLrgb(63, 175, 123)
#import "TabBarButton.h"

@implementation TabBarButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:CMTabNomalColor forState:UIControlStateNormal];
        [self setTitleColor:AllbackColor forState:UIControlStateSelected];
//        [self setTitleColor:[ValidateTool colorWithHex:@"#33a5dd"] forState:UIControlStateSelected];
    }
    return self;
}
- (void)setHighlighted:(BOOL)highlighted
{
    
    
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageH = contentRect.size.height * CMTabButtonImageRotio;
    return CGRectMake(0, 0, contentRect.size.width, imageH);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * CMTabButtonImageRotio;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY,contentRect.size.width,titleH);
}
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
}

@end
