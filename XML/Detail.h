//
//  Detail.h
//  XML
//
//  Created by supinfo on 19/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLTableViewController.h"



@interface Detail : UIViewController {
    IBOutlet UINavigationBar *bar;
    IBOutlet UIButton *bout;
    IBOutlet UILabel *label;
    NSString *variabletest;
    NSString *variableDescription;
    NSString *variableId;
    UILabel *labeltest;
    UILabel *Description;
    UILabel *ID;
    UIImageView *maPtiteImage;



    
}

@property (nonatomic,retain) IBOutlet UINavigationBar *bar;
@property (nonatomic,retain) IBOutlet UIImageView *maPtiteImage;
@property (nonatomic,retain) UIButton *bout;
@property (nonatomic,retain) UILabel *label;
@property (nonatomic,copy) NSString *variabletest;
@property (nonatomic,copy) NSString *variableDescription;
@property (nonatomic,copy) NSString *variableId;
@property (nonatomic,retain) IBOutlet UILabel *labeltest;
@property (nonatomic,retain) IBOutlet UILabel *Description;
@property (nonatomic,retain) IBOutlet UILabel *ID;

@end
