//
//  TutorListViewController.h
//  TutorMeApp
//
//  Created by Su Sandi on 8/16/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
@interface TutorListViewController : UITableViewController
{
    NSMutableArray *tmpArr;
    NSMutableDictionary * jsonObject;
    IBOutlet UITableView *mainTableView;
}

@property (strong, nonatomic) NSString *selectCourse;

@property (strong,retain) NSMutableData *receivedData;
@property (nonatomic, retain) NSString* course;
@property (nonatomic, retain) NSArray * tutorList;
@property (nonatomic, retain) NSArray * feesList;
- (NSArray *) parseJSON: (NSData *) data ;
- (NSArray *) parseJSONFees: (NSData *) data;
- (void) populateTutors : (NSString *) aCourse;
-(void)ViewTutorButtonRow: (UIButton *)sender;
@end
