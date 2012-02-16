//
//  XMLAppDelegate.h
//  XML
//
//  Created by supinfo on 13/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLTableViewController.h"
#import "Detail.h"

@interface XMLAppDelegate : NSObject <UIApplicationDelegate> {
    UINavigationBar *navBar;
    UIWindow *window;
    Detail *detailview;
    XMLTableViewController *tableViewController;
    UINavigationController *navController;
}

@property (nonatomic,retain) IBOutlet UINavigationBar *navbar;
@property (nonatomic,retain) Detail *detailview;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) UINavigationController *navController;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
