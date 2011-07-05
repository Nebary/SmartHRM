//
//  EmailConnection.h
//  SmartHRM
//
//  Created by Nabi on 7/4/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@interface EmailConnection : NSObject <MFMailComposeViewControllerDelegate> {
    UIViewController *delegate;
}
- (void) sendEmailBody: (NSString *)emailBody asHtml: (BOOL)html withSubject: (NSString *)subject attachFile: (NSString *)file delegateIs: (UIViewController *)delegateVC;
@end
