//
//  ActivityDetails.h
//  SmartHRM
//
//  Created by Nabi on 7/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ActivityDetails : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * ActivityID;
@property (nonatomic, retain) NSNumber * Lon;
@property (nonatomic, retain) NSNumber * Alt;
@property (nonatomic, retain) NSNumber * LogID;
@property (nonatomic, retain) NSNumber * Lat;
@property (nonatomic, retain) NSDate * LogDateTime;
@property (nonatomic, retain) NSNumber * LogType;
@property (nonatomic, retain) NSNumber * HeartRate;

@end
