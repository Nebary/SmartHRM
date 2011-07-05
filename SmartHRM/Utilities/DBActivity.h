//
//  DBActivity.h
//  SmartHRM
//
//  Created by Dmitry Sitnikov on 7/4/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Activity.h"


@interface DbActivity : NSObject {
    
}
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

///Add new activity and return corresponding managed object to wotk with their fields.
-(Activity*) insertActivity;
///Remove activity.
-(void) removeActivity:(NSManagedObject*) activityToDelete;
///Commit all changes that were made by insertActivity and removeActivity methods.
-(BOOL) commitChanges;
-(NSMutableArray*) fetchData;

-(Activity*) selectActivity:(NSNumber*) activityId;
-(void) deleteActivity:(NSNumber*) activityId;
-(void) updateActivity:(NSNumber*) activityId;

@end
