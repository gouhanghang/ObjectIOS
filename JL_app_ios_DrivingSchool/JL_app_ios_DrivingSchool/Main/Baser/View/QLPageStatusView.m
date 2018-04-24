//
//  QLPageStatusView.m
//  JL_app_ios_DrivingSchool
//
//  Created by 苟应航 on 2018/4/24.
//  Copyright © 2018年 JinLan. All rights reserved.
//
#import "UIFontAdditions.h"
#import "QLPageStatusView.h"

static UIFont * titleFont = nil;
static UIFont * subTitleFont = nil;

@interface QLPageStatusView () {
    UIImageView * _iconView;
    UILabel * _lblTitle;
    UILabel * _lblSubTitle;
}

@property (assign) NSInteger itemCount;
@end

@implementation QLPageStatusView

+ (void)initialize {
    titleFont = [UIFont systemFontOfSize:12];
    subTitleFont = [UIFont systemFontOfSize:12];
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconView];
        
        _lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, titleFont.ttLineHeight)];
        _lblTitle.font = titleFont;
        _lblTitle.textAlignment = NSTextAlignmentCenter;
        _lblTitle.numberOfLines = 2;
        _lblTitle.backgroundColor = [UIColor clearColor];
        _lblTitle.textColor =JLrgba(49, 37, 32, 0.7);
        
        _lblTitle.shadowColor = [UIColor whiteColor];
        _lblTitle.shadowOffset = CGSizeMake(1, 1);
        [self addSubview:_lblTitle];
        
        _lblSubTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, subTitleFont.ttLineHeight * 3)];
        _lblSubTitle.font = subTitleFont;
        _lblSubTitle.textAlignment = NSTextAlignmentCenter;
        _lblSubTitle.numberOfLines = 3;
        _lblSubTitle.backgroundColor = [UIColor clearColor];
        _lblSubTitle.textColor =  JLrgba(49, 37, 32, 0.7); //RGBCOLOR(0xa0, 0xa4, 0xa9);
//        _lblSubTitle.shadowColor = [UIColor whiteColor];
//        _lblSubTitle.shadowOffset = CGSizeMake(1, 1);
        [self addSubview:_lblSubTitle];
        _itemCount = 0;
    }
    return self;
}

- (void)setImage:(UIImage *)imgIcon title:(NSString *)title subTitle:(NSString *)subTitle {
    _itemCount = 0;
    
    if ( imgIcon ) {
        _iconView.hidden = NO;
        _iconView.image = imgIcon;
        [_iconView sizeToFit];
        
    
        // 最大 300 * 300
        if ( _iconView.frame.size.width > 300 || _iconView.frame.size.height > 300 ) {
            _iconView.size = CGSizeMake(300, 300);
        }
        if (self.frame.size.height == 156) {
            _iconView.size = CGSizeMake(SCREEN_WIDTH-25, 156);
            _iconView.contentMode = UIViewContentModeScaleAspectFill;
        }
        _itemCount++;
    } else {
        _iconView.hidden = YES;
    }
    
    if ( title.length ) {
        _lblTitle.hidden = NO;
        // 主标题最多支持2行
        CGSize fSize = [title sizeWithFont:titleFont
                         constrainedToSize:CGSizeMake(self.width, CGFLOAT_MAX)
                             lineBreakMode:NSLineBreakByTruncatingTail];
        if ( fSize.height > titleFont.ttLineHeight ) {
            // 大于1行
            _lblTitle.height = floorf(titleFont.ttLineHeight * 2);
        } else {
            _lblTitle.height = floorf(titleFont.ttLineHeight);
        }
        _lblTitle.text = title;
        _itemCount++;
    } else {
        _lblTitle.hidden = YES;
    }
    
    // 副标题最多支持3行
    // 最底部，所以不用计算高度，直接给 3 行
    if ( subTitle.length ) {
        _lblSubTitle.hidden = NO;
        
        CGSize fSize = [subTitle sizeWithFont:subTitleFont
                            constrainedToSize:CGSizeMake(self.width, CGFLOAT_MAX)
                                lineBreakMode:NSLineBreakByTruncatingTail];
        if ( fSize.height > subTitleFont.ttLineHeight ) {
            // 大于1行
            _lblSubTitle.height = floorf(subTitleFont.ttLineHeight * 3);
        } else {
            _lblSubTitle.height = floorf(subTitleFont.ttLineHeight);
        }

        _lblSubTitle.text = subTitle;
        _itemCount++;
    } else {
        _lblSubTitle.hidden = YES;
    }
    
    [self setNeedsLayout];
}

#define HeadImgBottomOffset 20
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat gapSize = 8;
    CGFloat initialTop = 2;
    
    CGFloat totalHeight = (_iconView.hidden?0:_iconView.height) + (_lblTitle.hidden?0:_lblTitle.height) + (_lblSubTitle.hidden?0:_lblSubTitle.height) + HeadImgBottomOffset;
    
    if (_itemCount > 2) {
        totalHeight += floorf((_itemCount - 2) * gapSize);
    }
    
    if ( totalHeight <= 0 ) {
        return;
    }
    
    if ( totalHeight < self.height ) {
        // 居中
        initialTop = floorf ((self.height - totalHeight) / 2.0) - 32;
    }
    
    if ( !_iconView.hidden ) {
        _iconView.frame = CGRectMake(floorf((self.width - _iconView.width)/2.0), initialTop, _iconView.width, _iconView.height);
    }
    
    if ( !_lblTitle.hidden ) {
        _lblTitle.frame = CGRectMake(floorf((self.width - 150)/2.0), _iconView.bottom + HeadImgBottomOffset, 150, _lblTitle.height);
        if (self.frame.size.height == 156) {
           _lblTitle.frame = CGRectMake(0, 156-20-_lblTitle.height, SCREEN_WIDTH-25, _lblTitle.height);
            _lblTitle.textColor = JLrgba(49, 37, 32, 0.2);
        }
    }
    
    if ( !_lblSubTitle.hidden ) {
        _lblSubTitle.frame = CGRectMake((self.width - 150)/2.0, _lblTitle.bottom + gapSize, 150, _lblSubTitle.height);
    }
}

@end
