//
//  WizardScreenHrm.m
//  SmartHRM
//
//  Created by Nabi on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WizardScreenHrm.h"
#import "Constants.h"

@implementation WizardScreenHrm
@synthesize switchHRM;

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
    [switchHRM release];
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
    [self.navigationItem setTitle:NSLocalizedString(@"Heart Rate Monitor", @"Wizard")];
    [self.switchHRM setOn:[[NSUserDefaults standardUserDefaults] boolForKey:SETTING_USE_HRM]];
}

- (void)viewDidUnload
{
    [self setSwitchHRM:nil];
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
    [[NSUserDefaults standardUserDefaults] setBool:[self.switchHRM isOn] forKey:SETTING_USE_HRM];
}

@end
