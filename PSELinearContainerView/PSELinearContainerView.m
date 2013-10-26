//
//  PSELinearContainerView.m
//  Linear Container View
//
//  Created by Paul Schifferer on 5/31/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "PSELinearContainerView.h"


@implementation PSELinearContainerView

- (void)layoutSubviews {
    [super layoutSubviews];

    NSInteger subviewCount = [[self subviews] count];
    if(subviewCount == 0)
        return;

    CGFloat subviewSize = 0;

    // get total width of subviews
    for(UIView* subview in [self subviews]) {
        if(subview.hidden ||
           (subview.alpha < 0.01f))
            continue;

        if(_layoutMode == PSELinearContainerLayoutModeHorizontal) {
            subviewSize += subview.frame.size.width;
        }
        else if(_layoutMode == PSELinearContainerLayoutModeVertical) {
            subviewSize += subview.frame.size.height;
        }
    }

    // add padding
    subviewSize += ((subviewCount - 1) * _padding);

    // calculate starting position
    CGFloat mid = 0;
    if(_layoutMode == PSELinearContainerLayoutModeHorizontal) {
        mid = CGRectGetMidX(self.frame);
    }
    else if(_layoutMode == PSELinearContainerLayoutModeVertical) {
        mid = CGRectGetMidY(self.frame);
    }
    CGFloat start = mid - (subviewSize / 2.0f);

    // set frame position for each subview
    for(UIView* subview in [self subviews]) {
        if(subview.hidden ||
           (subview.alpha < 0.01f))
            continue;

        CGRect subviewFrame = subview.frame;
        if(_layoutMode == PSELinearContainerLayoutModeHorizontal) {
            subviewFrame.origin.x = start;
            CGFloat midY = self.frame.size.height / 2.0f;
            CGFloat subviewHalfHeight = subviewFrame.size.height / 2.0f;
            CGFloat newY = midY - subviewHalfHeight;
            subviewFrame.origin.y = newY;
        }
        else if(_layoutMode == PSELinearContainerLayoutModeVertical) {
            CGFloat midX = self.frame.size.width / 2.0f;
            CGFloat subviewHalfWidth = subviewFrame.size.width / 2.0f;
            CGFloat newX = midX - subviewHalfWidth;
            subviewFrame.origin.x = newX;
            subviewFrame.origin.y = start;
        }
        subview.frame = subviewFrame;

        // advance 'start'
        if(_layoutMode == PSELinearContainerLayoutModeHorizontal) {
            start += (subviewFrame.size.width + _padding);
        }
        else if(_layoutMode == PSELinearContainerLayoutModeVertical) {
            start += (subviewFrame.size.height + _padding);
        }
    }
}

- (BOOL)translatesAutoresizingMaskIntoConstraints {
    return NO;
}

@end
