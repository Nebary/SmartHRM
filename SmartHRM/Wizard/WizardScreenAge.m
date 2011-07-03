//
//  WizardsScreenAge.m
//  SmartHRM
//
//  Created by Nabi on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WizardScreenAge.h"
#import "Constants.h"

@implementation WizardScreenAge
@synthesize textFieldAge;

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
    [textFieldAge release];
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
    [self.navigationItem setTitle:NSLocalizedString(@"Age", @"Wizard")];
    textFieldAge.text = [[NSUserDefaults standardUserDefaults] valueForKey:SETTINGS_AGE];

}

- (void)viewDidUnload
{
    [self setTextFieldAge:nil];
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
    [[NSUserDefaults standardUserDefaults] setValue:textFieldAge.text forKey:SETTINGS_AGE];
}

@end
