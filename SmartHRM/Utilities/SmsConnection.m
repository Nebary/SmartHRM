//
//  SmsConnection.m
//  SmartHRM
//
//  Created by Nabi on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SmsConnection.h"


@implementation SmsConnection

- (void) sendSmsText: (NSString *)smsBody delegateIs: (UIViewController *)delegateVC
{
	delegate = [delegateVC retain];
    MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
	if([MFMessageComposeViewController canSendText]) {
		controller.body = smsBody;
		//controller.recipients = [NSArray arrayWithObjects:@"12345678", @"87654321", nil];
		controller.messageComposeDelegate = self;
		[delegate presentModalViewController:controller animated:YES];
	}
}

- (void) messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{	
	[delegate dismissModalViewControllerAnimated:YES];
    [delegate release];
}
@end
