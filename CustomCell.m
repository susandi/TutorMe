//
//  CustomCell.m
//  TutorMeApp
//
//  Created by Su Sandi on 8/19/13.
//  Copyright (c) 2013 com.masonw. All rights reserved.
//

#import "CustomCell.h"
#import "TutorListViewController.h"

@implementation CustomCell
@synthesize UsernameLabel,FeesLabel,viewController;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //CGRectMake(x,y,width,height)
        UsernameLabel=[[UILabel alloc] initWithFrame:CGRectMake(10 ,8, 165,25 )];
        UsernameLabel.font= [UIFont systemFontOfSize:20.0];
        UsernameLabel.textColor=[UIColor blueColor];
        UsernameLabel.backgroundColor=[UIColor clearColor];
        UsernameLabel.highlightedTextColor=[UIColor whiteColor];
        UsernameLabel.adjustsFontSizeToFitWidth=YES;
        [self.contentView addSubview:UsernameLabel];
        
        FeesLabel=[[UILabel alloc] initWithFrame:CGRectMake(220 ,8, 165,25 )];
        FeesLabel.font= [UIFont systemFontOfSize:18.0];
        FeesLabel.textColor=[UIColor blueColor];
        FeesLabel.backgroundColor=[UIColor clearColor];
        FeesLabel.highlightedTextColor=[UIColor whiteColor];
        FeesLabel.adjustsFontSizeToFitWidth=YES;
        [self.contentView addSubview:FeesLabel];
        
//        customButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//        customButton.frame=CGRectMake(200,8, 110,30 );
//        [customButton addTarget:self action:@selector(ViewTutorButtonRow:) forControlEvents:UIControlEventTouchUpInside];
//        [self.contentView addSubview:customButton];
    }
    return self;
}
//-(void) ViewTutorButtonRow:(UIButton *) sender
//{
//
//    [viewController ViewTutorButtonRow: sender];
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
