//
//  WizardScreenHrm.h
//  SmartHRM
//
//  Created by Nabi on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WizardScreenSuper.h"

@interface WizardScreenHrm : WizardScreenSuper {
    
    UISwitch *switchHRM;
}

@property (nonatomic, retain) IBOutlet UISwitch *switchHRM;

- (IBAction)changeValue:(id)sender;

@end
