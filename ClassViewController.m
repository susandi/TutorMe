//
//  ClassViewController.m
//  TutorMeApp
//
//  Created by Su Sandi on 6/14/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import "ClassViewController.h"
#import "GetMajorList.h"
#import "TutorListViewController.h"
#import "TutorMeAppDelegate.h"


@interface ClassViewController ()

@end

@implementation ClassViewController
@synthesize receivedData, major, courseList,selectCourse;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
     
    }
    return self;
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    courseList = [[NSMutableArray alloc] init];
    [self createConnection:major];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name: UIKeyboardDidShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name: UIKeyboardWillHideNotification object:nil];
//   
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];   
    
}
//-(void)keyboardHidden:(NSNotification *)note
//{
//    [self.tableView setFrame:self.view.bounds];
//}
//-(void)keyboardShown:(NSNotification *)note
//{
//    CGRect keyboardFrame;
//    [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
//    CGRect tableViewFrame =self.tableView.frame;
//    tableViewFrame.size.height-=keyboardFrame.size.height;
//    [self.tableView  setFrame:tableViewFrame];
//}
-(void) searchBar :(UISearchBar *) searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length==0)
    {
        isfiltered=NO;
        [filteredStrings removeAllObjects];
        [filteredStrings addObjectsFromArray:courseList];
    }
    else
    {
        [filteredStrings removeAllObjects];
        isfiltered=YES;
    }
    filteredStrings=[[NSMutableArray alloc] init];
    for(NSString *str in courseList)
    {
        NSRange stringRange=[str rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if(stringRange.location !=NSNotFound)
        [filteredStrings addObject:str];
    }
   // NSLog(@"filterStrings is %@",filteredStrings);
    
   /* for(NSDictionary *item in courseList)
    {
        NSString *string =[item objectForKey:@"result"];
        NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
        
        
        if(stringRange.location !=NSNotFound)
            
            [filteredStrings addObject:item];
    }*/
    [self.tableView reloadData];
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
  [self.tableView resignFirstResponder];
    [searchBar resignFirstResponder];
    searchBar.text=@"";
}
-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.tableView resignFirstResponder];
    [searchBar resignFirstResponder];
}

- (void)createConnection : (NSString *) departmentName
{

    NSString *url=[ NSString stringWithFormat:@"%@",@"http://localhost/Test%20Server/wwwroot/include_php/classData.php"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: url]];
    
    
    
    NSString *myRequestString =[NSString stringWithFormat:@"department=%@",departmentName];
    
    
   
    [request setHTTPMethod: @"POST"];
                                    
    //post section
    [request setHTTPBody: [myRequestString dataUsingEncoding:NSUTF8StringEncoding]];
    
  
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    if (connection)
    {
        receivedData=[NSMutableData data];
        
    }
     
}
                                

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  

    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
    courseList = [self parseJSON: receivedData];
    
    // release the connection, and the data object
    connection = nil;
    receivedData = nil;
    
    /*
    if([result caseInsensitiveCompare:@"passed"] == NSOrderedSame)
    {
        
         NSDictionary *dic = [jsonObject objectForKey:@"course_name"];
        [classNames addObject:dic];
        
         NSLog(@"classNames print out : %@",classNames);
    }
     */

    [self.tableView reloadData];
     

}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
    {
        // Append the new data to receivedData.
        // receivedData is an instance variable declared elsewhere.
        [receivedData appendData:data];
    }
 - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
    {
        // This method is called when the server has determined that it
        // has enough information to create the NSURLResponse.
        
        // It can be called multiple times, for example in the case of a
        // redirect, so each time we reset the data.
        // receivedData is an instance variable declared elsewhere.
        [receivedData setLength:0];
    }
        
        
        
#pragma mark - Table view data source


- (NSMutableArray *) parseJSON: (NSData *) data ;
{
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                           error:&error];

    if (json == nil)
        return nil;
   

    NSMutableArray *resultArray = [json objectForKey:@"result"];
   
    
       NSLog (@"course data=%@", json);
        return  resultArray;
    
}

- (void) populateCourse : (NSString *) aMajor
{
    major = [[NSString alloc] init];
    major = aMajor;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(isfiltered){ return [filteredStrings count];}
    return [courseList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if(!isfiltered)
    {
        
        cell.textLabel.text = [courseList objectAtIndex:indexPath.row];
        
      
    }
    else
    {
        cell.textLabel.text=[filteredStrings objectAtIndex:indexPath.row];
    }
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

//Retrieve tutor list for current selected course
UITableViewCell *selectedCell=[tableView cellForRowAtIndexPath:indexPath];
//store in a string
selectCourse =selectedCell.textLabel.text;
//print out what we have in the string
NSLog (@"string print out : %@", selectCourse);
//stringwithFormat
//
[self performSegueWithIdentifier:@"FromCourseToTutors" sender:self];
    

}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"FromCourseToTutors"])
    {
        TutorListViewController * destVC = [segue destinationViewController];
        [destVC populateTutors:selectCourse];
    }
}
@end