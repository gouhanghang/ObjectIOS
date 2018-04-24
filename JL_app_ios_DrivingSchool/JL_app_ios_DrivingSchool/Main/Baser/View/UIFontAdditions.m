//
//  UIFontAdditions.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//
#import "UIFontAdditions.h"

@implementation UIFont (TTCategory)



- (CGFloat)ttLineHeight {
  return (self.ascender - self.descender) + 1;
}

@end
