//
//  Detail.m
//  XML
//
//  Created by supinfo on 19/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Detail.h"


@implementation Detail

@synthesize bout;
@synthesize labeltest;
@synthesize label;
@synthesize variableId;
@synthesize variableDescription;
@synthesize variabletest;
@synthesize Description;
@synthesize ID;
@synthesize maPtiteImage;
@synthesize bar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc{
    [label release];
    [super dealloc];
}



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
//    NSString *debutChemin = @"Documents/image";
//    NSString *lid =(@"%@",variableId);
//    NSString *ext =@".png";
//    NSString *thePAth = [NSString stringWithFormat:@"%@%@%@",debutChemin,lid,ext];
//    NSString *limage = [NSHomeDirectory()stringByAppendingPathComponent:thePAth];
//    UIImage *recup = [UIImage imageWithContentsOfFile: limage];
    
    NSURL *url2 =[[NSURL alloc] initWithString:[@"http://www.adepem.com/img/logos/logo-fers-a-repasser.png"stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
     UIImage *recup = [UIImage  imageWithData: [NSData dataWithContentsOfURL:url2] ];
    
    //UIImage *recup = [UIImage 
                      

    [super viewDidLoad];
    [labeltest setText:(@"%@",variabletest)];
    [labeltest setFont:[UIFont systemFontOfSize:19.0]];
    [Description setText:(@"%@",variableDescription)];
    [maPtiteImage setImage: recup] ;
    [ID setText:(@"%@",variableId)];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)viewDidUnload
{
    [label release];
    [super dealloc];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

}


@end
