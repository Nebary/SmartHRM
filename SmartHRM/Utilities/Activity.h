//
//  Activity.h
//  SmartHRM
//
//  Created by Nabi on 7/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ActivityDetails;

@interface Activity : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * TargetHeartRateMax;
@property (nonatomic, retain) NSNumber * ActivityEffortTime;
@property (nonatomic, retain) NSString * UserID;
@property (nonatomic, retain) NSString * ActivityType;
@property (nonatomic, retain) NSString * SyncID;
@property (nonatomic, retain) NSNumber * StartLon;
@property (nonatomic, retain) NSNumber * EndLat;
@property (nonatomic, retain) NSString * Weather;
@property (nonatomic, retain) NSNumber * TargetEffortTime;
@property (nonatomic, retain) NSNumber * TargetHeartRateHigh;
@property (nonatomic, retain) NSString * Location;
@property (nonatomic, retain) NSNumber * ActivityElapsedTime;
@property (nonatomic, retain) NSNumber * TotalDistanceKm;
@property (nonatomic, retain) NSDate * ActivityStartTime;
@property (nonatomic, retain) NSNumber * AverageHeartRate;
@property (nonatomic, retain) NSDate * ActivityEndTime;
@property (nonatomic, retain) NSNumber * StartLat;
@property (nonatomic, retain) NSNumber * TargetAverageHeartRate;
@property (nonatomic, retain) NSString * Description;
@property (nonatomic, retain) NSNumber * Calories;
@property (nonatomic, retain) NSNumber * ActivityID;
@property (nonatomic, retain) NSString * Notes;
@property (nonatomic, retain) NSNumber * Weight;
@property (nonatomic, retain) NSNumber * EndLon;
@property (nonatomic, retain) NSNumber * StartAlt;
@property (nonatomic, retain) NSNumber * EndAlt;
@property (nonatomic, retain) NSNumber * TargetHeartRateLow;
@property (nonatomic, retain) NSSet* ActivityDetails;

@end
