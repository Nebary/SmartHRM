//
//  EmailConnection.m
//  SmartHRM
//
//  Created by Nabi on 7/4/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import "EmailConnection.h"


@implementation EmailConnection

- (void) sendEmailBody: (NSString *)emailBody asHtml: (BOOL)html withSubject: (NSString *)subject attachFile: (NSString *)file delegateIs: (UIViewController *)delegateVC
{
	delegate = [delegateVC retain];
    MFMailComposeViewController *picker = [[[MFMailComposeViewController alloc] init] autorelease];
	
    if ([MFMailComposeViewController canSendMail]) {
        if (file) {
            NSString *cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString *path = [cachesDirectory stringByAppendingPathComponent:file];
            NSData *myData = [NSData dataWithContentsOfFile:path];
            [picker addAttachmentData:myData mimeType:@"text/plain" fileName:file];
        }
        [picker setSubject:subject];
        [picker setMessageBody:emailBody isHTML:html];
        
        picker.mailComposeDelegate = self;
        [delegate presentModalViewController:picker animated:YES];
    }
}

- (void) mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	[delegate dismissModalViewControllerAnimated:YES];
    [delegate release];
}

@end
