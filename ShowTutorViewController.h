//
//  ShowTutorViewController.h
//  TutorMeApp
//
//  Created by Su Sandi on 8/8/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassViewController.h"



@interface ShowTutorViewController : UITableViewController
{
    NSMutableArray *tmpArr;
    NSMutableDictionary * jsonObject;
}
@property (strong, nonatomic) NSString *selectCourse;

@property (strong,retain) NSMutableData *receivedData;
@property (nonatomic, retain) NSString* course;
@property (nonatomic, retain) NSArray * tutorList;
- (NSArray *) parseJSON: (NSData *) data ;
- (void) populateTutors : (NSString *) aCourse;
@end