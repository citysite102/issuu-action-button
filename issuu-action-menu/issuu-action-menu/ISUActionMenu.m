//
//  ISUActionMenu.m
//  issuu-action-menu
//
//  Created by YU CHONKAO on 2016/4/11.
//  Copyright © 2016年 YU CHONKAO. All rights reserved.
//

#import "ISUActionMenu.h"
#import "ISUActionMenuView.h"

@interface ISUActionMenuGestureRecognizer()

@property (nonatomic, assign) BOOL initCalled;
@property (nonatomic, readwrite) SEL s_action;
@property (nonatomic, weak) id s_target;
@property (nonatomic, weak) ISUActionMenuView *menuView;

@end

@implementation ISUActionMenuGestureRecognizer

- (instancetype)initWithTarget:(id)target action:(SEL)action {
    self = [super initWithTarget:self action:@selector(handleLongPressedGesture:)];
    if (self) {
        self.s_target = target;
        self.s_action = action;
    }
    return self;
}

#pragma mark - Events

- (void)handleLongPressedGesture:(UILongPressGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        UIView *targetView = self.targetView ? : self.view;
        
        ISUActionMenuView *menuView = [[ISUActionMenuView alloc] initWithFrame:CGRectZero];
        self.menuView          = menuView;
        self.menuView.items    = self.items;
        self.menuView.center   = [sender locationInView:targetView];
        self.menuView.userInteractionEnabled = NO;
        [targetView addSubview:self.menuView];
        [self.menuView presentWithCompletionHandler:nil];
        
        if ([self.menuView respondsToSelector:@selector(menuTouchBegin:)]) {
            [self.menuView menuTouchBegin:sender];
        }
        _startPoint = [sender locationInView:targetView];
        _initCalled = YES;
   
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        if ([self.menuView respondsToSelector:@selector(menuTouchChanged:)]) {
            [self.menuView menuTouchChanged:sender];
        }
        
    } else {
        
        if (_initCalled) {
            [self.menuView dismissWithItem:nil completionHandler:^(ISUActionMenuView *sender) {
                [sender removeFromSuperview];
            }];
        }
        if ([self.menuView respondsToSelector:@selector(menuTouchEnded:)]) {
            [self.menuView menuTouchEnded:sender];
        }
        
        _startPoint = (CGPoint){ .x = INFINITY, .y = INFINITY};
        _selectedItem = nil;
        _initCalled = NO;
        
    }
    
}


#pragma mark - API method

- (CGPoint)startLocationInView:(UIView *)view {
    return [view convertPoint:self.startPoint fromView:self.menuView.superview];
}

@end