//
//  WizardScreenSuper.h
//  SmartHRM
//
//  Created by Nabi on 6/30/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WizardScreenSuper : UIViewController {
    
}

@property (nonatomic, retain) IBOutlet UILabel *labelHRM;
@property (nonatomic, retain) IBOutlet UIView *viewFrame;

- (IBAction)skipPage: (id)sender;
- (IBAction)nextPage: (id)sender;
- (IBAction)donePage: (id)sender;

- (void) colorAllFonts;
- (void) drawFrames;

- (IBAction) editsExit: (id)sender;
- (IBAction) clickOnView: (id)sender;
- (IBAction) editingDidBegin: (id)sender;
- (IBAction) editingDidEnd: (id)sender;
- (void) animateTextField: (UITextField*)textField up: (BOOL)up;


@end
