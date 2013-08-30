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


@synthesize receivedData, course, tutorList,feesList;


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
    
    
    NSLog(@"showTutorVC Succeeded! Received %d bytes of Name data",[self.receivedData length]);
    tutorList = [self parseJSON: self.receivedData];
    NSLog(@"tutorname print out 2 : %@",tutorList);
    
    NSLog(@"showTutorVC Succeeded! Received %d bytes of Fees data",[self.receivedData length]);
    feesList = [self parseJSONFees: self.receivedData];
    NSLog(@"Fees print out 2 : %@",feesList);
    
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
    return [tutorList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   /* static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString * tutorName = [NSString stringWithFormat:@"%@", [self.tutorList objectAtIndex:indexPath.row]];
    cell.textLabel.text= tutorName;
    
    return cell;*/
    
    CustomCell *cell=(CustomCell *) [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    if(cell==nil)
        cell=[[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    NSString *tutorName=[NSString stringWithFormat:@"%@", [self.tutorList objectAtIndex:indexPath.row]];
    
      NSString *fees=[NSString stringWithFormat:@"%@", [self.feesList objectAtIndex:indexPath.row]];
/*disable the UItableView selection highlighting
  we can also use cell.userInteractionEnabled = NO;
 */
cell.selectionStyle=UITableViewCellSelectionStyleNone;
cell.textLabel.enabled=NO;
    
cell.UsernameLabel.text= tutorName;
cell.FeesLabel.text=fees;
cell.viewController=self;
[cell.customButton setTitle:@"view this tutor" forState: UIControlStateNormal];
return (UITableViewCell *) cell;

}
-(void) ViewTutorButtonRow:(UIButton *)sender
{
    UITableViewCell *parentCell=[[sender superview] superview];
    NSIndexPath *indexPathOfCell =[mainTableView indexPathForCell:parentCell];
    NSLog(@"index path of button's cell: %d",indexPathOfCell.row);
}
#pragma mark - Table view delegate

/*
- (void)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath:(NSIndexPath *)indexPath
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
 
  
}*/


@end


















