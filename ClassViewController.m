//
//  ClassViewController.m
//  TutorMeApp
//
//  Created by Su Sandi on 6/14/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import "ClassViewController.h"
#import "GetMajorList.h"
#import "ShowTutorViewController.h"
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
    courseList = [[NSArray alloc] init];
    [self createConnection:major];
 
   
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
    
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


- (NSArray *) parseJSON: (NSData *) data ;
{
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                           error:&error];

    if (json == nil)
        return nil;
    /******************************
     *
     
     NEED TO DO ERROR CHECKING IN json object ("error" :    , "result" );
     */

    NSArray *resultArray = [json objectForKey:@"result"];
    
    /*
      NSString *result = nil;
    //error parsing
    if(!json)
    {
        NSLog(@"%@", error);
        result = @"failed";
    }
    else
    {
        NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
        result =  (NSString*)[json objectForKey:@"passed"];
        
        
        jsonObject=[json objectForKey:@"course"];//table name
        NSDictionary *dic = [jsonObject objectForKey:@"course_name"];
        [classNames addObject:dic];
        
        NSLog(@"classNames print out : %@",classNames);
        
    }
    
    json = nil;
    error = nil;
    return result;
     */
    
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
    return [courseList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString * courseName = [courseList objectAtIndex:indexPath.row];
    cell.textLabel.text= courseName;
    
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
        ShowTutorViewController * destVC = [segue destinationViewController];
        [destVC populateTutors:selectCourse];
    }
}
@end