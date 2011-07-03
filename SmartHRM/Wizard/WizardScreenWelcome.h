//
//  WizardScreenWelcome.h
//  SmartHRM
//
//  Created by Nabi on 6/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WizardScreenSuper.h"

@interface WizardScreenWelcome : WizardScreenSuper {
    UISegmentedControl *segmentedControlUnit;
}

@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControlUnit;

- (IBAction)changeValue:(id)sender;

@end
