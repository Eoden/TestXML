//
//  XMLParser.h
//  XML
//
//  Created by supinfo on 13/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kproduct @"product"
#define kid @"id"
#define klabel @"label"
#define kdescription @"description"
#define kdeposit @"deposit"
#define kcategoryId @"category-id"
#define kownerId @"owner-id"
#define kownerType @"owner-type"


@protocol XMLParserDelegate;


@interface XMLParser : NSObject <NSXMLParserDelegate> {
 
    NSXMLParser *textParser;
    NSMutableArray *stories;
    
    NSMutableDictionary *item;
    
    // On va parser le document de haut en bas.
    // On va donc collecter chaque sous-élements, les sauver dans item, puis ajouter dans le tableau
    
    NSString *currentElement;
    NSMutableString *currentId;
    NSMutableString *currentLabel;
    NSMutableString *currentDescription;
    NSMutableString *currentDeposit;
    NSMutableString *currentCategoryId;
    NSMutableString *currentOwnerId;
    NSMutableString *currentOwnerType;
    
    id<XMLParserDelegate> delegate;
}    

-(void)parseXMLFileAtPath:(NSString *)path;

@property (nonatomic,retain) NSMutableArray *stories;
@property (nonatomic,assign) id<XMLParserDelegate> delegate;


@end

@protocol XMLParserDelegate <NSObject>

-(void) xmlParserdidFinishParsing;

@end