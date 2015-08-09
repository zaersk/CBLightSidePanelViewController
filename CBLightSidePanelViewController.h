//
//  CBLightSidePanelViewController.h
//  CBPlayground
//
//  Created by Caleb Benn on 8/3/15.
//  Copyright (c) 2015 Caleb Benn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CBLightSidePanelDelegate;

extern const CGFloat CBLightSidePanelDefaultRevealWidthHorizontal;
extern const CGFloat CBLightSidePanelDefaultRevealWidthVertical;

typedef enum _CBLightSidePanelState {
    /**
     State for when the center panel consumes the entirety of the window.
     */
    CBLightSidePanelStateOpen,
    /**
     State for when the side panel consumes a majority of the window.
     */
    CBLightSidePanelStateClosed
} CBLightSidePanelState;

typedef enum _CBLightSidePanelDirection {
    /**
     The direction for a left revelation of the side panel
     */
    CBLightSidePanelDirectionLeft
} CBLightSidePanelDirection;

/**
 `CBLightSidePanelViewController` is a lightweight view controller manager that presents a side panel with a simple animation.
 */
@class CBLightSidePanelViewController;

@interface CBLightSidePanelViewController : UIViewController

+ (CBLightSidePanelViewController *) sharedInstance;

- (void) setSidePanelViewController:(UIViewController *)panelViewController forDirection:(CBLightSidePanelDirection *)direction;

- (void) transitionToViewController:(UIViewController *)targetViewController withCompletionHandler:(void (^)())completionHandler;

@property (nonatomic, assign) BOOL shouldAllowPanGesture;

@end
