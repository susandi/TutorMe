//
//  CustomCell.h
//  TutorMeApp
//
//  Created by Su Sandi on 8/19/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TutorListViewController;

@interface CustomCell : UITableViewCell
{
    UILabel *customLabel;
    UIButton *customButton;

}
@property (nonatomic,retain) UILabel *UsernameLabel;
@property (nonatomic,retain) UILabel *FeesLabel;
@property (nonatomic, retain) UIButton *customButton;
@property   (nonatomic) TutorListViewController *viewController;



@end
