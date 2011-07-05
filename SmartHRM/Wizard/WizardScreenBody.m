//
//  WizardScreenBody.m
//  SmartHRM
//
//  Created by Nabi on 6/29/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import "WizardScreenBody.h"
#import "Constants.h"

@implementation WizardScreenBody
@synthesize textFieldWeight;

#pragma mark - Management

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
    [textFieldWeight release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:NSLocalizedString(@"Weight", @"Wizard")];
    textFieldWeight.text = [[NSUserDefaults standardUserDefaults] valueForKey:SETTINGS_WEIGHT];
}

- (void)viewDidUnload
{
    [self setTextFieldWeight:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)changeValue:(id)sender {
    [[NSUserDefaults standardUserDefaults] setValue:textFieldWeight.text forKey:SETTINGS_WEIGHT];
}

@end
