//
//  WizardScreenWelcome.m
//  SmartHRM
//
//  Created by Nabi on 6/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WizardScreenWelcome.h"
#import "Constants.h"

@implementation WizardScreenWelcome
@synthesize segmentedControlUnit;

#pragma mark - Properties

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
    [segmentedControlUnit release];
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
    [self.navigationItem setTitle:NSLocalizedString(@"Distance", @"Wizard")];
    
    NSString *unit = [[NSUserDefaults standardUserDefaults] valueForKey:SETTINGS_UNITS];
    if ([unit isEqualToString:@"KM"]) {
        segmentedControlUnit.selectedSegmentIndex = 1;
    }
}

- (void)viewDidUnload
{
    [self setSegmentedControlUnit:nil];
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
    if ([segmentedControlUnit selectedSegmentIndex] == 0) {
        [[NSUserDefaults standardUserDefaults] setValue:@"M" forKey:SETTINGS_UNITS];
    }
    else {
        [[NSUserDefaults standardUserDefaults] setValue:@"KM" forKey:SETTINGS_UNITS];
    }
}
@end
