//
//  LCEViewController.m
//  LinearContainerExample
//
//  Created by Paul Schifferer on 10/26/13.
//
//

#import "LCEViewController.h"


@interface LCEViewController ()

@end

@implementation LCEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _linearContainerView.padding = 5;
    _linearContainerView.layoutMode = PSELinearContainerLayoutModeVertical;

    _layoutSwitcher.selectedSegmentIndex = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)layoutSwitched:(UISegmentedControl*)sender {

    NSInteger segment = sender.selectedSegmentIndex;

    if(segment == 0) {
        _linearContainerView.layoutMode = PSELinearContainerLayoutModeHorizontal;
    }
    else {
        _linearContainerView.layoutMode = PSELinearContainerLayoutModeVertical;
    }

    [UIView animateWithDuration:0.4
                     animations:^{
                         [_linearContainerView setNeedsLayout];
                     }];
}

@end
