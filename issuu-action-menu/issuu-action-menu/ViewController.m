//
//  ViewController.m
//  issuu-action-menu
//
//  Created by YU CHONKAO on 2016/4/11.
//  Copyright © 2016年 YU CHONKAO. All rights reserved.
//

#import "ViewController.h"
//#import "ISUActionMenu.h"
//#import "ISUActionMenuView.h"
//#import "ISUActionMenuItem.h"
//#import "ISUActionMenuItemView.h"
#import "ISUActionMenuSupport.h"

@interface ViewController ()

@property (nonatomic, strong) ISUActionMenuGestureRecognizer *longPressGesture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.longPressGesture = [[ISUActionMenuGestureRecognizer alloc]
                             initWithTarget:self
                             action:@selector(handleActionMenuGesture:)
                             initializationHandler:^ISUActionMenuView * _Nonnull{
                                 ISUActionMenuView *actionMenuView = [[ISUActionMenuView alloc] init];
                                 return actionMenuView;
                             }];
    
    self.longPressGesture.items = @[[ISUActionMenuItem itemWithImage:[UIImage imageNamed:@"icon_move"] text:@"Move"],
                                    [ISUActionMenuItem itemWithImage:[UIImage imageNamed:@"icon_duplicate"] text:@"Duplicate"],
                                    [ISUActionMenuItem itemWithImage:[UIImage imageNamed:@"icon_rotation"] text:@"Rotation"]];
    
    [self.view addGestureRecognizer:self.longPressGesture];
    
}


- (void)handleActionMenuGesture:(ISUActionMenuGestureRecognizer *)sender {
    
    if (sender.selectedItem) {
        switch (sender.selectedItem.index) {
            case 0: {
                NSLog(@"0");
                break;
            }
            case 1: {
                NSLog(@"1");
                break;
            }
            case 2: {
                NSLog(@"2");
                break;
            }
            default:
                break;
        }
    }
}



@end
