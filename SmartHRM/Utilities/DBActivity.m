//
//  DBActivity.m
//  SmartHRM
//
//  Created by Dmitry Sitnikov on 7/4/11.
//  Modified by Nabi on 7/5/11.
//  Copyright 2011 Rus Wizards LLC. All rights reserved.
//

#import "DbActivity.h"
#import "Helpers.h"
#import "SmartHRMAppDelegate.h"

NSString * const ENTITY_ACTIVITY = @"Activity";
NSString * const ENTITY_ACTIVITY_DETAILS = @"ActivityDetails";
NSString * const SORT_ACTIVITY_START = @"ActivityStartTime";
NSString * const SORT_ACTIVITY_ID = @"ActivityID";

@interface DbActivity (Private)
- (NSManagedObjectContext *)context;
- (NSFetchRequest *)getRequestForEntity: (NSString *)entityRq sortBy: (NSString *)sort ascending: (BOOL)asc predicatedBy: (NSPredicate *)predicate;
- (long long) nextActivityId;
@end

@implementation DbActivity

#pragma mark - Private methods

- (NSManagedObjectContext *)context {
    SmartHRMAppDelegate *appDelegate = (SmartHRMAppDelegate *)[[UIApplication sharedApplication] delegate];
    return [appDelegate managedObjectContext];
}

- (NSFetchRequest *)getRequestForEntity: (NSString *)entityRq sortBy: (NSString *)sort ascending: (BOOL)asc predicatedBy: (NSPredicate *)predicate {
    // Define our table/entity to use
	NSEntityDescription *entity = [NSEntityDescription entityForName:entityRq inManagedObjectContext:[self context]];
	
	// Setup the fetch request
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	
	// Define how we will sort the records
	if (sort) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sort ascending:asc];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        [request setSortDescriptors:sortDescriptors];
        [sortDescriptor release];
    }
    
    if (predicate) {
        [request setPredicate:predicate];
    }
    
    [request setReturnsObjectsAsFaults:NO];
    
    return request;
}

- (long long) nextActivityId {
    long long result = 1;
    
	NSError *error;
    NSFetchRequest *request = [self getRequestForEntity:ENTITY_ACTIVITY sortBy:SORT_ACTIVITY_ID ascending:YES predicatedBy:nil];
	NSArray *allActivities = [[self context] executeFetchRequest:request error:&error];
    NSUInteger count = [allActivities count];
    if (count > 0) {
        Activity *lastItem = [allActivities objectAtIndex:count-1];
        result = [lastItem.ActivityID longLongValue]+1;
    }
    
    return result;
}

#pragma mark - Activity

- (Activity *) insertActivity {
    long long nextId = [self nextActivityId];
    
    [[self context] setUndoManager:nil];
    Activity *activity = [NSEntityDescription insertNewObjectForEntityForName:ENTITY_ACTIVITY inManagedObjectContext:[self context]];
    activity.ActivityID = [NSNumber numberWithLongLong:nextId];
    
    return activity;
}

- (void) deleteActivity: (Activity *) entityToDelete {
    [[self context] deleteObject:entityToDelete];
}

- (Activity *) selectActivity: (NSNumber *) activityId {
    Activity *result = nil;
	NSError *error;

    NSFetchRequest *request = [self getRequestForEntity:ENTITY_ACTIVITY sortBy:nil ascending:NO predicatedBy:nil];
	NSArray *allActivities = [[self context] executeFetchRequest:request error:&error];
    
    for (Activity *activity in allActivities) {
        if ([activity.ActivityID isEqualToNumber:activityId]) {
            result = activity;
            break;
        }
    }
    
    return result;
}

- (NSArray *) selectActivitiesByDate: (NSDate *)date {
    NSDate *start = [Helpers startOfTheDay:date];
    NSDate *finish = [Helpers endOfTheDay:date];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(ActivityStartTime >= %@) AND (ActivityStartTime <= %@)", start, finish];

    NSFetchRequest *request = [self getRequestForEntity:ENTITY_ACTIVITY sortBy:SORT_ACTIVITY_START ascending:NO predicatedBy:predicate];
	
	NSError *error;
	NSArray *resultArray = [[self context] executeFetchRequest:request error:&error];
	
	[request release];

	if (!resultArray) return nil; else return resultArray;
}

#pragma mark - ActivityDetails

- (ActivityDetails *) insertActivityDetails {
    [[self context] setUndoManager:nil];
    ActivityDetails *details = [NSEntityDescription insertNewObjectForEntityForName:ENTITY_ACTIVITY_DETAILS inManagedObjectContext:[self context]];
    
    return details;
}

- (void) deleteActivityDetails: (ActivityDetails *) entityToDelete {
    [[self context] deleteObject:entityToDelete];
}

- (NSArray *) selectActivityDetails: (Activity *)activity {
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"ALL Activity.ActivityID = %@", activity.ActivityID];
    NSFetchRequest *request = [self getRequestForEntity:ENTITY_ACTIVITY_DETAILS sortBy:nil ascending:NO predicatedBy:predicate];
	
	NSError *error;
	NSArray *resultArray = [[self context] executeFetchRequest:request error:&error];
	
	[request release];
    
	if (!resultArray) return nil; else return resultArray;
}

#pragma mark - Common methods

- (void) commit {
    SmartHRMAppDelegate *appDelegate = (SmartHRMAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate saveContext];
}

@end
