//
//  XMLTableViewController.h
//  XML
//
//  Created by supinfo on 13/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "MyCustomNavigationBar.h"

@interface XMLTableViewController : UITableViewController <XMLParserDelegate> {
    XMLParser *parser;
    NSMutableArray *tableau;

}

@property(nonatomic,retain) NSMutableArray *tableau;



@end
