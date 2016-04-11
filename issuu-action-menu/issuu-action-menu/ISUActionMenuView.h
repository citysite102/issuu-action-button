//
//  ISUActionMenuView.h
//  issuu-action-menu
//
//  Created by YU CHONKAO on 2016/4/11.
//  Copyright © 2016年 YU CHONKAO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISUActionMenu.h"
#import "ISUActionMenuItem.h"
#import "ISUActionMenuItemView.h"

@interface ISUActionMenuView : UIView
<
ISUActionMenuInterface
>

@property (nonatomic, readwrite) NSArray<ISUActionMenuItem *> *items;
@property (nonatomic, readwrite) CGFloat intersectionDegree;
@property (nonatomic, readwrite) CGFloat centerDegree;
@property (nonatomic, readwrite) CGFloat radius;
@property (nonatomic, readwrite) CGFloat minimumAcceptProgress;
@property (nonatomic, readwrite) CGRect  centerDegreeReferenceFrame;
@property (nonatomic, strong) CAShapeLayer *indicatorPath;
@property (nonatomic, readwrite) BOOL autoAdjustCenterDegree;

//@property (nonatomic, weak) id<TCActionMenuViewDelegate> delegate;
//@property (nonatomic, readonly) CGFloat convertedCenterDegree;

- (void)presentWithCompletionHandler:(void(^)(ISUActionMenuView *sender))completionHandler;
- (void)dismissWithItem:(ISUActionMenuItem *)item
      completionHandler:(void(^)(ISUActionMenuView *sender))completionHandler;

@end
