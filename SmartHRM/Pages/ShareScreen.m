//
//  ShareScreen.m
//  SmartHRM
//
//  Created by Nabi on 7/4/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import "ShareScreen.h"
#import "EmailConnection.h"
#import "SmsConnection.h"

@implementation ShareScreen

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)sendEmail:(id)sender {
    EmailConnection *conn = [[EmailConnection alloc] init];
    [conn sendEmailBody:@"Hi Sean,<br><br>This is example of <b>EmailConnection</b> class. If you want to use contacts, just touch at the top of this page (\"<i>To:</i>\" section) - there is <u>native iPhone contacts</u> for email." asHtml:YES withSubject:@"SmartHRM" attachFile:nil delegateIs:self];
}

- (IBAction)sendSms:(id)sender {
    SmsConnection *conn = [[SmsConnection alloc] init];
    [conn sendSmsText:@"Hi, this is how SMS working here" delegateIs:self];
}

@end
