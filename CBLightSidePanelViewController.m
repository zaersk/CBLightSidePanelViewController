//
//  CBLightSidePanelViewController.m
//  CBPlayground
//
//  Created by Caleb Benn on 8/3/15.
//  Copyright (c) 2015 Caleb Benn. All rights reserved.
//

#import "CBLightSidePanelViewController.h"

CGFloat const CBLightSidePanelDefaultRevealWidthHorizontal = 250;
CGFloat const CBLightSidePanelDefaultRevealWidthVertical = 350;

@interface CBLightSidePanelViewController ()
/// Internal affairs
@property (nonatomic, strong) UIViewController *sidePanelViewController;
@property (nonatomic, strong) UIViewController *centerViewController;
@property (nonatomic, strong) UIView *centerViewControllerContainer;
@property (nonatomic) CBLightSidePanelState *panelState;
@property (nonatomic) CBLightSidePanelDirection *panelDirection;

- (void) closePanelViewControllerWithCompletionHandler:(void (^)())completionHandler;

@end

@implementation CBLightSidePanelViewController
@synthesize sidePanelViewController = _sidePanelViewController;
@synthesize centerViewController = _centerViewController;
@synthesize centerViewControllerContainer = _centerViewControllerContainer;
@synthesize panelState = _panelState;
@synthesize panelDirection = _panelDirection;

+ (CBLightSidePanelViewController *)sharedInstance
{
    static CBLightSidePanelViewController *_instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [CBLightSidePanelViewController new];
        }
    });
    
    return _instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    [self addChildViewController:_sidePanelViewController];
    _sidePanelViewController.view.frame = self.view.bounds;
    [[self view] addSubview:_sidePanelViewController.view];
    [_sidePanelViewController didMoveToParentViewController:self];
    */
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Side Panel

- (void) setSidePanelViewController:(UIViewController *)panelViewController forDirection:(CBLightSidePanelDirection *)direction {
    if (direction == nil) {
        NSAssert(self, @"There must exist a direction for the side panel revelation.");
        return;
    }
    
    if (panelViewController == nil) {
        NSAssert(self, @"The side panel view controller cannot be nil.");
        return;
    }
    
    _sidePanelViewController = panelViewController;
    _panelDirection = direction;
    _panelState = 0;
    
    NSLog(@"%@",[panelViewController class]);
}

- (void) transitionToViewController:(UIViewController *)targetViewController withCompletionHandler:(void (^)())completionHandler {
    
    if (_centerViewController == targetViewController) {
        [self closePanelViewControllerWithCompletionHandler:nil];
    }
    _centerViewController = targetViewController;
    
    completionHandler();
}

- (void) closePanelViewControllerWithCompletionHandler:(void (^)())completionHandler {
    
    completionHandler();
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
