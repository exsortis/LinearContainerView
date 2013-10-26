//
//  PSELinearContainerView.h
//  Linear Container View
//
//  Created by Paul Schifferer on 5/31/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, PSELinearContainerLayoutMode) {
    PSELinearContainerLayoutModeHorizontal,
    PSELinearContainerLayoutModeVertical,
};

@interface PSELinearContainerView : UIView

@property (nonatomic, assign) PSELinearContainerLayoutMode layoutMode;
@property (nonatomic, assign) CGFloat padding;

@end
