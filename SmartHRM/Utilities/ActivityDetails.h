//
//  ActivityDetails.h
//  SmartHRM
//
//  Created by Nabi on 7/5/11.
//  Copyright (c) 2011 Rus Wizards LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Activity;

@interface ActivityDetails : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * Lon;
@property (nonatomic, retain) NSNumber * Alt;
@property (nonatomic, retain) NSNumber * LogID;
@property (nonatomic, retain) NSNumber * Lat;
@property (nonatomic, retain) NSDate * LogDateTime;
@property (nonatomic, retain) NSNumber * LogType;
@property (nonatomic, retain) NSNumber * HeartRate;
@property (nonatomic, retain) Activity * Activity;

@end
