//
//  LCEViewController.h
//  LinearContainerExample
//
//  Created by Paul Schifferer on 10/26/13.
//
//

#import <UIKit/UIKit.h>
#import "PSELinearContainerView.h"


@interface LCEViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *layoutSwitcher;
@property (strong, nonatomic) IBOutlet PSELinearContainerView *linearContainerView;

- (IBAction)layoutSwitched:(UISegmentedControl*)sender;

@end
