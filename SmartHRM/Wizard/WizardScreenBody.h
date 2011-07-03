//
//  WizardScreenBody.h
//  SmartHRM
//
//  Created by Nabi on 6/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WizardScreenSuper.h"

@interface WizardScreenBody : WizardScreenSuper {
    
    UITextField *textFieldWeight;
}

@property (nonatomic, retain) IBOutlet UITextField *textFieldWeight;

- (IBAction)changeValue:(id)sender;

@end
