//
//  GetMajorList.h
//  TutorMeApp
//
//  Created by Su Sandi on 4/18/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import <UIKit/UIKit.h>


#define getUrl @"http://localhost:80/Test%20Server/wwwroot/include_php/MajorList.php"

@interface GetMajorList : UITableViewController <UISearchBarDelegate>
{
    NSMutableArray *ListOfMajors;
    NSMutableArray *filteredStrings;
    BOOL isFiltered;
    
}
@property (strong,nonatomic) NSString *selectCourse;
@property (strong, nonatomic) IBOutlet UISearchBar *MajorSearchBar;
@end
