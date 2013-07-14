//
//  ClassViewController.h
//  TutorMeApp
//
//  Created by Su Sandi on 6/14/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetMajorList.h"
//#define getUrl @"http://localhost:80/Test%20Server/wwwroot/include_php/MajorList.php"



@interface ServiceConnector : NSObject <NSURLConnectionDelegate,NSURLConnectionDataDelegate>
@end
@interface ClassViewController : UITableViewController
{
      NSMutableArray *tmpArr;
    NSMutableDictionary * jsonObject;
    
}
@property (nonatomic,retain) NSMutableData *receivedData;
@property (nonatomic, retain) NSString* course;
@property (nonatomic, retain) NSArray * courseList;
- (NSArray *) parseJSON: (NSData *) data ;
- (void) populateCourse : (NSString *) aCourse;
@end
