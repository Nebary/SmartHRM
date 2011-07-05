//
//  DBActivity.h
//  SmartHRM
//
//  Created by Dmitry Sitnikov on 7/4/11.
//  Modified by Nabi on 7/5/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Activity.h"
#import "ActivityDetails.h"

@interface DbActivity : NSObject {
    
}

- (Activity *) insertActivity;
- (void) deleteActivity: (Activity *) entityToDelete;
- (Activity *) selectActivity: (NSNumber *) activityId;
- (NSArray *) selectActivitiesByDate: (NSDate *)date;

- (ActivityDetails *) insertActivityDetails;
- (void) deleteActivityDetails: (ActivityDetails *) entityToDelete;
- (NSArray *) selectActivityDetails: (Activity *)activity;

- (void) commit;

@end
