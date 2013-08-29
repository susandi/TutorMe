//
//  GetMajorList.m
//  TutorMeApp
//
//  Created by Su Sandi on 4/18/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import "GetMajorList.h"
#import "ClassViewController.h"
#import "TutorMeAppDelegate.h"
@interface GetMajorList()
@end



@implementation GetMajorList{}
@synthesize selectCourse;

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
    
    //[self.tableView reloadData];
    
    [self start];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name: UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name: UIKeyboardWillHideNotification object:nil];

}
-(void)keyboardHidden:(NSNotification *)note
{
    [self.tableView setFrame:self.view.bounds];
}
-(void)keyboardShown:(NSNotification *)note
{
    CGRect keyboardFrame;
    [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    CGRect tableViewFrame =self.tableView.frame;
    tableViewFrame.size.height-=keyboardFrame.size.height;
    [self.tableView  setFrame:tableViewFrame];
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length==0)
    {
        isFiltered = NO;
        [filteredStrings removeAllObjects];
        [filteredStrings addObjectsFromArray:ListOfMajors];
    }
    else
    {   [filteredStrings removeAllObjects];
        isFiltered=YES;
    }
    filteredStrings=[[NSMutableArray alloc]init];
    for(NSDictionary *item in ListOfMajors)
    {
        NSString *string =[item objectForKey:@"department"];
        NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
        
        
        if(stringRange.location !=NSNotFound)

            [filteredStrings addObject:item];
        }
    
    
    //[self.tableView reloadData];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.tableView resignFirstResponder];
    [searchBar resignFirstResponder];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.tableView resignFirstResponder];
    [searchBar resignFirstResponder];
}

-(void) getData:(NSData *)data
{   NSError *error;
    
    ListOfMajors = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    //[self.tableView reloadData];
}

-(void)start
{
    NSURL *url= [NSURL URLWithString:getUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    [self getData:data];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isFiltered) {return [filteredStrings count];}
    return [ListOfMajors count];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(!isFiltered)
    {
    
    NSDictionary *info = [ListOfMajors objectAtIndex:indexPath.row];
    cell.textLabel.text=[info objectForKey:@"department"]; // @"X": X is the attribute name in table to show in tableview
    }
    else
    {   cell.textLabel.text = [[filteredStrings objectAtIndex:indexPath.row] objectForKey:@"department"];
    }
    return cell;
        
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    
    //Retrieve class list for current selected course
    UITableViewCell *selectedCell=[tableView cellForRowAtIndexPath:indexPath];
    //store in a string
    selectCourse =selectedCell.textLabel.text;
    //print out what we have in the string
    //NSLog (@"string print out : %@", selectCourse);
   //stringwithFormat
    //
    [self performSegueWithIdentifier:@"FromMajorToCourses" sender:self];
    
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"FromMajorToCourses"])
    {
        ClassViewController * destVC = [segue destinationViewController];
        [destVC populateCourse:selectCourse];
    }
}
@end
