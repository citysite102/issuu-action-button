//
//  ViewController.m
//  issuu-action-menu
//
//  Created by YU CHONKAO on 2016/4/11.
//  Copyright © 2016年 YU CHONKAO. All rights reserved.
//

#import "ViewController.h"
#import "ISUActionMenu.h"
#import "ISUActionMenuView.h"
#import "ISUActionMenuItem.h"
#import "ISUActionMenuItemView.h"

@interface ViewController ()

@property (nonatomic, strong) ISUActionMenuGestureRecognizer *longPressGesture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.longPressGesture = [[ISUActionMenuGestureRecognizer alloc]
                             initWithTarget:self
                             action:@selector(handleActionMenuGesture:)];
    self.longPressGesture.items = @[[ISUActionMenuItem itemWithImage:[UIImage imageNamed:@"icon_move"] text:@"Move"],
                                    [ISUActionMenuItem itemWithImage:[UIImage imageNamed:@"icon_duplicate"] text:@"Duplicate"],
                                    [ISUActionMenuItem itemWithImage:[UIImage imageNamed:@"icon_rotation"] text:@"Rotation"]];
    
    [self.view addGestureRecognizer:self.longPressGesture];
    
}


- (void)handleActionMenuGesture:(ISUActionMenuGestureRecognizer *)sender {
    
//    UIGestureRecognizerState state = UIGestureRecognizerStateEnded;
//    if (sender.selectedItem) {
//        if (![sender.userInfo boolValue]) {
//            state = UIGestureRecognizerStateBegan;
//            sender.userInfo = @YES;
//        } else {
//            state = UIGestureRecognizerStateChanged;
//        }
//    } else if (sender.state == UIGestureRecognizerStateEnded) {
//        sender.userInfo = @NO;
//    } else {
//        if (sender.state == UIGestureRecognizerStateBegan) {
//            CGPoint startPoint = [sender startLocationInView:self.view];
//            NSLog(@"%@", NSStringFromCGPoint(startPoint));
//        }
//        return;
//    }
}



@end
