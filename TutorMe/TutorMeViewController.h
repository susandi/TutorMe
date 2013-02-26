//
//  TutorMeViewController.h
//  TutorMe
//
//  Created by Masey Mase on 1/1/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorMeViewController : UIViewController
{ 
    UITextField *userNameTxtFld;
    UITextField *passwordTxtFld;

    
}
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *signUpButton;
@property (strong, nonatomic) IBOutlet UITextField *userNameTxtFld;
@property (strong, nonatomic) IBOutlet UITextField *passwordTxtFld;

-(IBAction)textFieldReturn:(id)sender;
- (IBAction)backgroundTouched:(id)sender;

@end
