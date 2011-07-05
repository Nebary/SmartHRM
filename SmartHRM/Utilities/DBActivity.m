//
//  DBActivity.m
//  SmartHRM
//
//  Created by Dmitry Sitnikov on 7/4/11.
//  Modified by Nabi on 7/5/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import "DbActivity.h"

@implementation DbActivity

-(Activity*) insertActivity {
    Activity *activity = (Activity *)[NSEntityDescription insertNewObjectForEntityForName:@"Activity" inManagedObjectContext:managedObjectContext];
    return activity;
}

-(void) removeActivity:(NSManagedObject *)activityToDelete {
    [managedObjectContext deleteObject:activityToDelete];
}

-(BOOL) commitChanges {
    NSError *error;
	if (![managedObjectContext save:&error]) {
		// This is a serious error saying the record could not be saved.
		// Advise the user to restart the application
        return NO;
	}
    return YES;
}

-(NSMutableArray*) fetchData {
    // Define our table/entity to use
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Activity" inManagedObjectContext:managedObjectContext];
	
	// Setup the fetch request
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	
	// Define how we will sort the records
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"ActivityStartTime" ascending:NO];
	NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
	
	[request setSortDescriptors:sortDescriptors];
	[sortDescriptor release];
	
	// Fetch the records and handle an error
	NSError *error;
	NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
	
	if (!mutableFetchResults) {
		// Handle the error.
		// This is a serious error and should advise the user to restart the application
        return nil;
	}
	
	// Save our fetched data to an array
    //[self setEventArray: mutableFetchResults];
	NSMutableArray *resultArray = [[NSMutableArray alloc] initWithArray: mutableFetchResults];
	
	[mutableFetchResults release]; 
	[request release];
    
    return resultArray;
}

-(Activity*) selectActivity:(NSNumber*) activityId {
    return nil;
}

-(void) deleteActivity:(NSNumber*) activityId {
}

-(void) updateActivity:(NSNumber*) activityId {

}

@end
