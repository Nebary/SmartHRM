//
//  WizardScreenSuper.m
//  SmartHRM
//
//  Created by Nabi on 6/30/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import "WizardScreenSuper.h"
#import <QuartzCore/CAGradientLayer.h>
#import "Helpers.h"

#import "WizardScreenWelcome.h"
#import "WizardScreenBody.h"
#import "WizardScreenAge.h"
#import "WizardScreenHrm.h"

#import "Constants.h"

@implementation WizardScreenSuper

#pragma mark - Properties

@synthesize labelHRM;
@synthesize viewFrame;

#pragma mark - Management;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [viewFrame release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self colorAllFonts];
    [self drawFrames];
}

- (void)viewDidUnload
{
    [self setViewFrame:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UI Improvements

- (void) colorAllFonts {
    [Helpers colorBlueAllLabelsInView:self.viewFrame];
    self.labelHRM.textColor = [Helpers colorBlueFont];
}

- (void) drawFrames {
    self.viewFrame.layer.borderColor = [[Helpers colorFrame] CGColor];
    self.viewFrame.layer.borderWidth = 1.0;
}

#pragma mark - User Intercation

- (IBAction)skipPage:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)nextPage:(id)sender {
    UIViewController *nextVC = nil;
    
    if ([self isMemberOfClass:[WizardScreenWelcome class]]) {
        nextVC = [[WizardScreenBody alloc] init];
    }
    else if ([self isMemberOfClass:[WizardScreenBody class]]) {
        nextVC = [[WizardScreenAge alloc] init];
    }
    else if ([self isMemberOfClass:[WizardScreenAge class]]) {
        nextVC = [[WizardScreenHrm alloc] init];
    }
    
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)donePage:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:SETTINGS_SHOW_WIZARD];
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Keyboard hide/show

-(IBAction) editsExit: (id)sender{
	UITextField *txt = (UITextField *)sender;
	[txt resignFirstResponder];
}

-(IBAction) clickOnView: (id)sender{
    for (UIView *v in ((UIView *)sender).subviews) {
        if ([v isKindOfClass:[UITextField class]]) {
            [(UITextField *)v resignFirstResponder];
        }
    }
}

-(IBAction) editingDidBegin: (id)sender{
	[self animateTextField:sender up:YES];
}

-(IBAction) editingDidEnd: (id)sender{
	[self animateTextField:sender up:NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = textField.frame.origin.y-self.viewFrame.frame.origin.y+50;
    const float movementDuration = 0.3f;
	
    int movement = up ? -movementDistance : movementDistance;
	
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
