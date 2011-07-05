//
//  Activity.m
//  SmartHRM
//
//  Created by Nabi on 7/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Activity.h"
#import "ActivityDetails.h"


@implementation Activity
@dynamic TargetHeartRateMax;
@dynamic ActivityEffortTime;
@dynamic UserID;
@dynamic ActivityType;
@dynamic SyncID;
@dynamic StartLon;
@dynamic EndLat;
@dynamic Weather;
@dynamic TargetEffortTime;
@dynamic TargetHeartRateHigh;
@dynamic Location;
@dynamic ActivityElapsedTime;
@dynamic TotalDistanceKm;
@dynamic ActivityStartTime;
@dynamic AverageHeartRate;
@dynamic ActivityEndTime;
@dynamic StartLat;
@dynamic TargetAverageHeartRate;
@dynamic Description;
@dynamic Calories;
@dynamic ActivityID;
@dynamic Notes;
@dynamic Weight;
@dynamic EndLon;
@dynamic StartAlt;
@dynamic EndAlt;
@dynamic TargetHeartRateLow;
@dynamic ActivityDetails;

- (void)addActivityDetailsObject:(ActivityDetails *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"ActivityDetails" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"ActivityDetails"] addObject:value];
    [self didChangeValueForKey:@"ActivityDetails" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeActivityDetailsObject:(ActivityDetails *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"ActivityDetails" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"ActivityDetails"] removeObject:value];
    [self didChangeValueForKey:@"ActivityDetails" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addActivityDetails:(NSSet *)value {    
    [self willChangeValueForKey:@"ActivityDetails" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"ActivityDetails"] unionSet:value];
    [self didChangeValueForKey:@"ActivityDetails" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeActivityDetails:(NSSet *)value {
    [self willChangeValueForKey:@"ActivityDetails" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"ActivityDetails"] minusSet:value];
    [self didChangeValueForKey:@"ActivityDetails" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
