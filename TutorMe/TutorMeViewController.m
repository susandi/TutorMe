//
//  TutorMeViewController.m
//  TutorMe
//
//  Created by Masey Mase on 1/1/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import "TutorMeViewController.h"

@interface TutorMeViewController ()

@end

@implementation TutorMeViewController
@synthesize userNameTxtFld,passwordTxtFld ;

-(IBAction)textFieldReturn:(id)sender
{
   [userNameTxtFld resignFirstResponder];
   [passwordTxtFld resignFirstResponder];
   //[self.view endEditing:(YES)];
}
-(IBAction)backgroundTouched:(id)sender
{
    [self.view endEditing:(YES)];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
