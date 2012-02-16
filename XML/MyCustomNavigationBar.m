//
//  MyCustomNavigationBar.m
//  XML
//
//  Created by supinfo on 10/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MyCustomNavigationBar.h"


@implementation MyCustomNavigationBar 

-(void)drawRect:(CGRect)rect{
    UIImage *image =[UIImage imageNamed:@"bas.png"];
    
    [image drawInRect:rect];  
}

@end
