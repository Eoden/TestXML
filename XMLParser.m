//
//  XMLParser.m
//  XML
//
//  Created by supinfo on 13/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"


@implementation XMLParser

@synthesize stories;
@synthesize delegate;


- (void)parseXMLFileAtPath:(NSString *)path {
    stories = [[NSMutableArray alloc] init]; // 1

    NSURL *xmlURL = [NSURL fileURLWithPath:path];

    textParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];

    [textParser setDelegate:self]; // 2

    [textParser parse]; // 3
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if (currentElement) {
        [currentElement release];
        currentElement = nil;
    }
    currentElement = [elementName copy];

    if ([elementName isEqualToString:kproduct]) {
        if (item) {
            [item release];
            item = nil;
        }
        if (currentCategoryId) {
            [currentCategoryId release];
            currentCategoryId = nil ;
        }
        if (currentLabel) {
            [currentLabel release];
            currentLabel = nil;
        }

        if (currentDescription) {
            [currentDescription release];
            currentDescription = nil;
        }
        if (currentDeposit) {
            [currentDeposit release];
            currentDeposit = nil ;
        }
        if (currentCategoryId) {
            [currentCategoryId release];
            currentCategoryId = nil;
        }

        if (currentOwnerId) {
            [currentOwnerId release];
            currentOwnerId = nil;
        }
        if (currentOwnerType) {
            [currentOwnerType release];
            currentOwnerType = nil;
        }
        item = [[NSMutableDictionary alloc] init];
        currentId = [[NSMutableString alloc] init];
        currentLabel = [[NSMutableString alloc] init];
        currentDescription = [[NSMutableString alloc] init];
        currentDeposit = [[NSMutableString alloc] init];
        currentCategoryId = [[NSMutableString alloc] init];
        currentOwnerId = [[NSMutableString alloc] init];
        currentOwnerType = [[NSMutableString alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    //string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([currentElement isEqualToString:kid])
        [currentId appendString:string];
    else if ([currentElement isEqualToString:klabel])
        [currentLabel appendString:string];
    else if ([currentElement isEqualToString:kdescription])
        [currentDescription appendString:trimmedString];
    else if ([currentElement isEqualToString:kdeposit])
        [currentDeposit appendString:string];
    else if ([currentElement isEqualToString:kcategoryId])
        [currentCategoryId appendString:string];
    else if ([currentElement isEqualToString:kownerId])
        [currentOwnerId appendString:string];
    else if ([currentElement isEqualToString:kownerType])
        [currentOwnerType appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:kproduct]) {
        [item setObject:currentId forKey:kid];
        [item setObject:currentLabel forKey:klabel];
        [item setObject:currentDescription forKey:kdescription];
        [item setObject:currentDeposit forKey:kdeposit];
        [item setObject:currentCategoryId forKey:kcategoryId];
        [item setObject:currentOwnerId forKey:kownerId];
        [item setObject:currentOwnerType forKey:kownerType];

        [stories addObject:item];

    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {

    NSLog(@"C’est fini !");
    NSLog(@"stories a %d pays", [stories count]);
    [self performSelectorOnMainThread:@selector(tellTheDelegateItIsFinished) withObject:nil waitUntilDone:NO];
}

- (void)tellTheDelegateItIsFinished {
    [delegate xmlParserdidFinishParsing];
}

- (void)dealloc {
    [stories release];
    [textParser release];
    [item release];
    [currentId release];
    [currentLabel release];
    [currentDescription release];
    [currentDeposit release];
    [currentCategoryId release];
    [currentOwnerId release];
    [currentOwnerType release];

    [super dealloc];
}

@end
