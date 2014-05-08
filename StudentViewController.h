//
//  StudentViewController.h
//  TutorMeApp
//
//  Created by Su Sandi on 1/22/14.
//  Copyright (c) 2014 com.masonw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface StudentViewController : UITableViewController

{
    
    NSMutableDictionary * jsonObject;
    NSMutableArray *filteredStrings;
    IBOutlet UITableView *mainTableView;
    BOOL isfiltered;
}

@property (weak, nonatomic) IBOutlet UISearchBar *TutorSearchBar;
@property (strong, nonatomic) NSString *selectTutorName;

@property (strong,retain) NSMutableData *receivedData;
@property (nonatomic, retain) NSString* course;
@property (nonatomic, retain) NSArray * tutorList;
@property (nonatomic, retain) NSArray * feesList;
- (NSArray *) parseJSON: (NSData *) data ;
- (NSArray *) parseJSONFees: (NSData *) data;
- (void) populateTutors : (NSString *) aCourse;
-(void)ViewTutorButtonRow: (UIButton *)sender;
@end
