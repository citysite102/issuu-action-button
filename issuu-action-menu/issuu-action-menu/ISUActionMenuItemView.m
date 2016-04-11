//
//  ISUActionMenuItemView.m
//  issuu-action-menu
//
//  Created by YU CHONKAO on 2016/4/11.
//  Copyright © 2016年 YU CHONKAO. All rights reserved.
//

#import "ISUActionMenuItemView.h"
#import "ISUActionMenuItem.h"


@interface ISUActionMenuItemView ()
@end

@implementation ISUActionMenuItemView

- (CGSize)intrinsicContentSize {
    return CGSizeMake(44, 44);
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.backgroundColor = [UIColor colorWithRed:229.0 green:104.0 blue:92.0 alpha:1.0];
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.iconView.tintColor = [UIColor whiteColor];
        [self addSubview:self.iconView];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.iconView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                          constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.iconView
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                          constant:0.0f]];
        
        
        // Text
        self.textContainer = [[UIView alloc] initWithFrame:CGRectZero];
        self.textContainer.layer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75].CGColor;
        self.textContainer.layer.cornerRadius    = 10.0;
        self.textContainer.alpha = 0;
        self.textContainer.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0);
        self.textContainer.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.textContainer];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textContainer
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0f
                                                          constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textContainer
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0f
                                                          constant:-45.0f]];
        
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.textLabel.font = [UIFont systemFontOfSize:14.0];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.textContainer addSubview:self.textLabel];
        [self.textContainer addConstraint:[NSLayoutConstraint constraintWithItem:self.textLabel
                                                                       attribute:NSLayoutAttributeCenterX
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.textContainer
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:1.0f
                                                                        constant:0.0f]];
        [self.textContainer addConstraint:[NSLayoutConstraint constraintWithItem:self.textLabel
                                                                       attribute:NSLayoutAttributeCenterY
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.textContainer
                                                                       attribute:NSLayoutAttributeCenterY
                                                                      multiplier:1.0f
                                                                        constant:0.0f]];
        [self.textContainer addConstraint:[NSLayoutConstraint constraintWithItem:self.textLabel
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0f
                                                                        constant:20.0f]];
        [self.textContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[ViewA]-8-|"
                                                                                   options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                   metrics:nil
                                                                                     views:@{@"ViewA":self.textLabel}]];
        [self.textContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[ViewA(20)]|"
                                                                                   options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                   metrics:nil
                                                                                     views:@{@"ViewA":self.textLabel}]];
        
        self.indicatorPath = [[CAShapeLayer alloc] init];
        self.indicatorPath.path        = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-20, -20, 40, 40)].CGPath;
        self.indicatorPath.strokeColor = [UIColor whiteColor].CGColor;
        self.indicatorPath.fillColor   = [UIColor clearColor].CGColor;
        self.indicatorPath.lineWidth   = 2.0;
        self.indicatorPath.transform   = CATransform3DMakeRotation(-M_PI_2, 0, 0, 1);
        [self.layer addSublayer:self.indicatorPath];
        
        
    }
    return self;
}


#pragma mark - Setter & Getter

- (void)setItem:(ISUActionMenuItem *)item {
    
    _item = item;
    
    self.iconView.image = item.image;
    self.textLabel.text = item.text;
}

- (void)setProgress:(CGFloat)progress {
    
    [CATransaction begin];
    [CATransaction setValue:@(0.1) forKey:kCATransactionAnimationDuration];
    self.indicatorPath.strokeEnd = MAX(0.0, MIN(1.0, progress));
    [CATransaction commit];
}

- (CGFloat)progress {
    
    [self.indicatorPath removeAllAnimations];
    return self.indicatorPath.strokeEnd;
}

- (void)setShowText:(BOOL)showText {
    
    if (_showText == showText) {
        return;
    }
    _showText = showText;
    
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.textContainer.alpha = self.showText ? 1 : 0;
        self.textContainer.layer.transform = CATransform3DMakeScale(self.showText ? 1.0 : 0.5,
                                                                    self.showText ? 1.0 : 0.5, 1.0);
    } completion:^(BOOL finished) {
        
    }];
}



//- (void)setBackgroundView:(UIImageView *)backgroundView {
//    _backgroundView = backgroundView;
//}

@end
