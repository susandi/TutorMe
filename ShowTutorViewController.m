//
//  ShowTutorViewController.m
//  TutorMeApp
//
//  Created by Su Sandi on 8/8/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//
#import "GetMajorList.h"
#import "ShowTutorViewController.h"
#import "ClassViewController.h"
#import "TutorMeAppDelegate.h"

@interface ShowTutorViewController ()

@end


@implementation ShowTutorViewController

@synthesize receivedData, course, tutorList;


- (id) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if(self){ }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    tutorList =[[NSArray alloc] init];
    [self createConnection:course];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) createConnection : (NSString *) courseName
{
    NSString *url=[ NSString stringWithFormat:@"%@", @"http://localhost/Test%20Server/wwwroot/include_php/tutorData.php"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[ NSURL URLWithString: url]];

//    NSString *myRequestString =[NSString stringWithFormat: @"course_name=%@", courseName];
    
    NSString *myRequestString =[NSString stringWithFormat: @"courseName=%@", courseName];
    
    [request setHTTPMethod:@"POST"];
    
    //post section
    [request setHTTPBody: [myRequestString dataUsingEncoding: NSUTF8StringEncoding]];
    
    NSURLConnection *connection =[[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    if(connection)
    {
        self.receivedData=[NSMutableData data];
         NSLog(@"receivedData print out 1 : %@",self.receivedData);
    }
    
   

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    NSLog(@"showTutorVC Succeeded! Received %d bytes of data",[self.receivedData length]);
    tutorList = [self parseJSON: self.receivedData];
     NSLog(@"tutorname print out 2 : %@",tutorList);
    
    // release the connection, and the data object
    connection = nil;
    self.receivedData = nil;
    
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
    [self.receivedData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    // receivedData is an instance variable declared elsewhere.
    [self.receivedData setLength:0];
}


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
    
    NSArray *resultArray = [json objectForKey:@"resultUserData"];
    
    NSLog (@"tutor data=%@", json);
    return  resultArray;
    
}

- (void) populateTutors:(NSString *)aCourse 
{
    course = [[NSString alloc] init];
    course = aCourse;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tutorList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString * tutorName = [NSString stringWithFormat:@"%@", [self.tutorList objectAtIndex:indexPath.row]];
    cell.textLabel.text= tutorName;
    
    return cell;
}

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    //Retrieve tutor list for current selected course
    UITableViewCell *selectedCell=[tableView cellForRowAtIndexPath:indexPath];
    //store in a string
    selectCourse =selectedCell.textLabel.text;
    //print out what we have in the string
    NSLog (@"string print out : %@", selectCourse);
    //stringwithFormat
    //
    [self performSegueWithIdentifier:@"FromCourseToTutors" sender:self];
    */
}


@end


















