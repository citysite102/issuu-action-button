//
//  ISUActionMenuItemView.h
//  issuu-action-menu
//
//  Created by YU CHONKAO on 2016/4/11.
//  Copyright © 2016年 YU CHONKAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ISUActionMenuItem;
@interface ISUActionMenuItemView : UIView

@property (nonatomic, strong) ISUActionMenuItem *item;
@property (nonatomic, readwrite) CGFloat progress;
@property (nonatomic, readwrite) BOOL showText;

//Custom
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIView  *textContainer;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) CAShapeLayer *indicatorPath;

@end
