//
//  XMLTableViewController.m
//  XML
//
//  Created by supinfo on 13/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "XMLTableViewController.h"
#import "XMLParser.h"
#import "Detail.h"
#import "MyCustomNavigationBar.h"
#define MAINLABEL_TAG 1
#define SECONDLABEL_TAG 2
#define PHOTO_TAG 3
#define BAS_TAG 4
#define THIRDLABEL_TAG 5
#define FOURTHLABEL_TAG 6



@implementation XMLTableViewController



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    Detail *detail = [[Detail alloc] initWithNibName:@"Detail" bundle:nil];
    NSDictionary *aDict = [parser.stories objectAtIndex:indexPath.row];
    NSString *titre = [aDict objectForKey:klabel];
    detail.variabletest=titre;
    NSString *description = [aDict objectForKey:kdescription];
    detail.variableDescription=description;
    NSString *identifiant = [aDict objectForKey:kid];
    detail.variableId=identifiant;
    [self.navigationController pushViewController:detail animated: YES];
    detail.label.text = [parser.stories objectAtIndex:[indexPath row]];
     NSDictionary *product = [parser.stories objectAtIndex:[indexPath row]];
    detail.title = [product objectForKey:klabel];

    [detail release];
}
-(void)criteresDidChange:(NSString*)criteres{
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"ImageOnLeftCell";
    
    UILabel *mainLabel, *secondLabel, *thirdLabel, *fourthLabel;
    UIImageView *photo;
    UIImageView *bas ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        //tableView.backgroundColor= [UIColor colorWithRed:230.0/255.0 green:107.0/255.0 blue:14.0/255.0 alpha:1.0];
        tableView.backgroundColor=[UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
        //[UIColor colorWithPatternImage:[UIImage imageNamed:@"bas.png"]];
       // tableView.backgroundColor= [UIColor colorWithRed:242.0/255.0 green:228.0/255.0 blue:206.0/255.0 alpha:1.0];
        tableView.contentStretch = CGRectMake(50, 50, 50, 50);
       // cell.backgroundColor = [UIColor greenColor];
        
        mainLabel = [[[UILabel alloc] initWithFrame:CGRectMake(65.0, 10.0, 220.0, 0.0)] autorelease];
        mainLabel.tag = MAINLABEL_TAG;
        mainLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];
        mainLabel.textAlignment = UITextAlignmentLeft;
        mainLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:86.0/255.0 blue:27.0/255.0 alpha:1.0];
        mainLabel.backgroundColor = [UIColor clearColor];
        mainLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:mainLabel];
        
        secondLabel = [[[UILabel alloc] initWithFrame:CGRectMake(277.0, 20.0, 50.0, 0.0)] autorelease];
        secondLabel.tag = SECONDLABEL_TAG;
        secondLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:10];
        secondLabel.textAlignment = UITextAlignmentLeft;
        secondLabel.textColor = [UIColor orangeColor];
        secondLabel.backgroundColor = [UIColor clearColor];
        secondLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        
        thirdLabel = [[[UILabel alloc] initWithFrame:CGRectMake(85.0, 38.0, 140.0, 0.0)] autorelease];
        thirdLabel.tag = THIRDLABEL_TAG;
        thirdLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:13];
        thirdLabel.textAlignment = UITextAlignmentLeft;
        thirdLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:86.0/255.0 blue:27.0/255.0 alpha:1.0];
        thirdLabel.backgroundColor = [UIColor clearColor];
        thirdLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:thirdLabel];
        
        fourthLabel = [[[UILabel alloc] initWithFrame:CGRectMake(302.0, 20.0, 80.0, 0.0)] autorelease];
        fourthLabel.tag = FOURTHLABEL_TAG;
        fourthLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:8];
        fourthLabel.textAlignment = UITextAlignmentLeft;
        fourthLabel.textColor = [UIColor orangeColor];
        fourthLabel.backgroundColor = [UIColor clearColor];
        fourthLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        
        photo = [[[UIImageView alloc] initWithFrame:CGRectMake(10.0, 10.0, 45.0, 25.0)] autorelease];
        photo.tag = PHOTO_TAG;
        photo.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:photo];
        
        bas = [[[UIImageView alloc] initWithFrame:CGRectMake(265.0, 10.0, 60.0, 30.0)] autorelease];
        bas.tag = BAS_TAG;
        bas.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:bas];
        UIImage *recup2 = [UIImage imageWithContentsOfFile:@"/Users/supinfo/Desktop/panneau.png"];
        bas.image = recup2;
        [cell.contentView addSubview:fourthLabel];
        [cell.contentView addSubview:secondLabel];
    } else {
        mainLabel = (UILabel *)[cell.contentView viewWithTag:MAINLABEL_TAG];
        secondLabel = (UILabel *)[cell.contentView viewWithTag:SECONDLABEL_TAG];
        photo = (UIImageView *)[cell.contentView viewWithTag:PHOTO_TAG];
        bas = (UIImageView *)[cell.contentView viewWithTag:BAS_TAG];
        thirdLabel = (UILabel *)[cell.contentView viewWithTag:THIRDLABEL_TAG];
        fourthLabel = (UILabel *)[cell.contentView viewWithTag:FOURTHLABEL_TAG];
    }



    
    NSDictionary *aDict = [parser.stories objectAtIndex:indexPath.row];
    mainLabel.text = [aDict objectForKey:klabel];
    
    NSString *eurosParJour = @"€/j";
    NSString *prix =(@"%@",[aDict objectForKey:kid]);
    NSString *prixParJour = [NSString stringWithFormat:@"%@%@",prix,eurosParJour];

    
    
    secondLabel.text = prix;
    fourthLabel.text = eurosParJour;
    thirdLabel.text = [NSString stringWithFormat:@"Loueur: %@",[aDict objectForKey:kdeposit]];
    NSString *lien =  [aDict objectForKey:kdescription] ;
    NSLog(lien);
    NSLog(@"ceci est le  2eme :%@",[aDict objectForKey:kdescription]);
   //NSURL *url = [NSURL URLWithString:[aDict objectForKey:kdescription]];
    
    NSURL *url2 =[[NSURL alloc] initWithString:[lien stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
   // NSURL *url2 =[NSURL URLWithString:lien];
    NSString *debutChemin = @"Documents/image";
    NSString *lid =(@"%@",[aDict objectForKey:kid]);
    NSString *ext =@".png";
    NSString *thePAth = [NSString stringWithFormat:@"%@%@%@",debutChemin,lid,ext];
    NSString *limage = [NSHomeDirectory()stringByAppendingPathComponent:thePAth];

  //  NSLog( @"toto est : %@",thePAth);
   // NSLog(@"%@",limage);
    
    NSString *debutCheminjpg = @"Documents/image";
    NSString *lidjpg =(@"%@",[aDict objectForKey:kid]);
    NSString *extjpg =@".png";
    NSString *thePAthjpg = [NSString stringWithFormat:@"%@%@%@",debutCheminjpg,lidjpg,extjpg];
    NSString *limagejpg = [NSHomeDirectory()stringByAppendingPathComponent:thePAthjpg];
    
    //NSLog( @"toto est : %@",thePAth);
  //  NSLog(@"%@",limage);

    
    UIImage *recup = [UIImage imageWithContentsOfFile: limage];
    //UIImage *recupjpg = [UIImage imageWithContentsOfFile: limagejpg];
    photo.image = recup;
   // photo.image = recupjpg;
    if (recup) {
    }
    else{
    
   // NSLog(@"%@",[ url2 absoluteString]);
    UIImage *imaage = [UIImage  imageWithData: [NSData dataWithContentsOfURL:url2] ];
    NSData* imagedata = UIImagePNGRepresentation(imaage);
  //  NSData* imagejpeg = UIImageJPEGRepresentation(imaage, 1);
  //  [imagejpeg writeToFile:limage atomically:NO];
    [imagedata writeToFile:limage atomically:NO];
    //NSLog(@"%@",[aDict objectForKey:kdescription]);
   // UIImage *theImage = [UIImage imageWithContentsOfFile:(NSString *)[aDict objectForKey:kdescription]];
    //NSLog(@"%@",[aDict objectForKey:kdescription]);
    photo.image = imaage;

    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {return 80;}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
   
     

    [super viewDidLoad];
     [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    // Do any additional setup after loading the view from its nib.
    
    self.clearsSelectionOnViewWillAppear = NO;
    NSString *xmlFilePath =[[NSBundle mainBundle] pathForResource:@"test" ofType:@"xml"];
    
    [self performSelectorInBackground:@selector(parseXMLFile:) withObject:xmlFilePath];


}

- (void)parseXMLFile:(NSString*)thePath {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; // 2
    
    parser = [[XMLParser alloc] init];
    parser.delegate = self; // 3
    
    if ([parser.stories count] == 0)
    {
        [parser parseXMLFileAtPath:thePath];
    }
    
    [pool release];
}  

#pragma mark - XMLParser delegate
- (void) xmlParserdidFinishParsing {
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [parser.stories count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Location";
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//    }
//    
//    cell.textColor = [UIColor blueColor];
//    
//    NSDictionary *product = [parser.stories objectAtIndex:[indexPath row]];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ — %@ — %@", [product objectForKey:kid], [product objectForKey:klabel], [product objectForKey:kdescription]];
//    
//    return cell;
//}

-(void)dealloc
{
    [super dealloc];
    [parser release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
