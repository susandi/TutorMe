//
//  TutorListViewController.m
//  TutorMeApp
//
//  Created by Su Sandi on 8/16/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import "TutorListViewController.h"
#import "CustomCell.h"

@interface TutorListViewController ()

@end

@implementation TutorListViewController


@synthesize receivedData, course, tutorList,feesList,selectTutorName;


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
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name: UIKeyboardDidShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name: UIKeyboardWillHideNotification object:nil];
//    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        [filteredStrings addObjectsFromArray:tutorList];
    }
    else
    {
        [filteredStrings removeAllObjects];
        isfiltered=YES;
    }
    filteredStrings=[[NSMutableArray alloc] init];
    for(NSString *str in tutorList)
    {
        NSRange stringRange=[str rangeOfString:searchText options:NSCaseInsensitiveSearch];
        if(stringRange.location !=NSNotFound)
            [filteredStrings addObject:str];
    }
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
    
    
    NSLog(@"showTutorVC Succeeded! Received %d bytes of Name data",[self.receivedData length]);
    tutorList = [self parseJSON: self.receivedData];
    NSLog(@"tutorname print out 2 : %@",tutorList);
    
    NSLog(@"showTutorVC Succeeded! Received %d bytes of Fees data",[self.receivedData length]);
    feesList = [self parseJSONFees: self.receivedData];
    NSLog(@"Fees print out 2 : %@",feesList);
    
    // release the connection, and the data object
    connection = nil;
    self.receivedData = nil;
    
    
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
- (NSArray *) parseJSONFees: (NSData *) data ;
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
    NSArray *FeesArray = [json objectForKey:@"resultUserFees"];
    
    NSLog (@"Fees data=%@", json);
    return  FeesArray;
    
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
     if(isfiltered){ return [filteredStrings count];}
    return [tutorList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCell *cell=(CustomCell *) [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    if(cell==nil)
    {
        cell=[[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    
    }
    if(!isfiltered)
    {
        cell=[[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
        NSString *tutorName=[NSString stringWithFormat:@"%@", [self.tutorList objectAtIndex:indexPath.row]];
    
        NSString *fees=[NSString stringWithFormat:@"%@", [self.feesList objectAtIndex:indexPath.row]];
    /*disable the UItableView selection highlighting
     we can also use cell.userInteractionEnabled = NO;
     
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.textLabel.enabled=NO;
    */
        
        cell.UsernameLabel.text= tutorName;
        cell.FeesLabel.text=fees;
        cell.viewController=self;
        //[cell.customButton setTitle:@"view this tutor" forState: UIControlStateNormal];

        }
        else
        {
            cell=[[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
            
            
            NSString *fees=[NSString stringWithFormat:@"%@", [self.feesList objectAtIndex:indexPath.row]];
          
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.textLabel.enabled=NO;
            
            cell.UsernameLabel.text= [filteredStrings objectAtIndex:indexPath.row];;
            cell.FeesLabel.text=fees;
            cell.viewController=self;
            //[cell.customButton setTitle:@"view this tutor" forState: UIControlStateNormal];
        }
    
        return (UITableViewCell *) cell;

}

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     //Retrieve tutor list for current selected course
     CustomCell *selectedCell=[tableView cellForRowAtIndexPath:indexPath];
     //store in a string
     selectTutorName =selectedCell.textLabel.text;
     //print out what we have in the string
     NSLog (@"string print out : %@", selectTutorName);
     //stringwithFormat
     //
    // [self performSegueWithIdentifier:@"FromCourseToTutors" sender:self];
 
  
}


@end


















