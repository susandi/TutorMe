//
//  ClassViewController.m
//  TutorMeApp
//
//  Created by Su Sandi on 6/14/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import "ClassViewController.h"
#import "GetMajorList.h"

@interface ClassViewController ()

@end

@implementation ClassViewController
@synthesize receivedData;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self start];

    [self.tableView reloadData];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
/*-(void) getData:(NSData *)data
{   NSError *error;
    
    classNames = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    [self.tableView reloadData];
}*/

- (void)start{
   
     NSError *error;
    //connect to database given by url
    NSString *url=[ NSString stringWithFormat:@"%@",@"http://192.168.1.149:80/Test%20Server/wwwroot/include_php/classData.php"];
    NSString *tmpstr= @"ART";
    
    
    NSString* myRequestString = [[NSString alloc]initWithFormat:@"%@", tmpstr];
    
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
 
    //NSMutableURLRequest *request = [[NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: url]]; 
   
    [request setHTTPMethod: @"POST"];
    [ request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];

    //post section
    [request setHTTPBody: myRequestData];
    
    
   
    NSURLResponse *response;
    NSData *returnData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //NSString *strData = [[NSString alloc]initWithData:myRequestData encoding:NSUTF8StringEncoding];
    NSString *content=[NSString stringWithUTF8String:[returnData bytes]];
     NSLog(@"responseData: %@",content);
     NSLog(@"Succeeded! Received %d bytes of data",[content length]);
    //[self getData:myRequestData];
    classNames = [NSJSONSerialization JSONObjectWithData:myRequestData options:kNilOptions error:&error];
    [self.tableView reloadData];
     
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  

    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
    NSString * result = [self parseJSON: receivedData];
    
    // release the connection, and the data object
    connection = nil;
    receivedData = nil;
    
    
    if([result caseInsensitiveCompare:@"passed"] == NSOrderedSame)
    {
        
         NSDictionary *dic = [jsonObject objectForKey:@"course_name"];
        [classNames addObject:dic];
        
         NSLog(@"classNames print out : %@",classNames);
    }


}
#pragma mark - Table view data source

- (NSString *) parseJSON: (NSData *) data ;
{
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                           error:&error];
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
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [classNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *info = [classNames objectAtIndex:indexPath.row];
    cell.textLabel.text=[info objectForKey:@"course_name"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
