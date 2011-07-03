//
//  WizardsScreenAge.h
//  SmartHRM
//
//  Created by Nabi on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WizardScreenSuper.h"

@interface WizardScreenAge : WizardScreenSuper {
    
    UITextField *textFieldAge;
}

@property (nonatomic, retain) IBOutlet UITextField *textFieldAge;

- (IBAction)changeValue:(id)sender;

@end
