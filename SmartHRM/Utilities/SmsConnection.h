//
//  SmsConnection.h
//  SmartHRM
//
//  Created by Nabi on 7/4/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@interface SmsConnection : NSObject <MFMessageComposeViewControllerDelegate> {
    UIViewController *delegate;
}
- (void) sendSmsText: (NSString *)smsBody delegateIs: (UIViewController *)delegateVC;
@end
