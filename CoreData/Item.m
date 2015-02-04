//
//  Item.m
//  CoreData
//
//  Created by David Manuntag on 2015-02-03.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "Item.h"

@import UIKit;
@implementation Item

@dynamic information;
@dynamic item;


+(NSManagedObjectContext*)managedObjectContext {
    
    
    NSManagedObjectContext * context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
        
    }
    
    return context;
}


+(instancetype)itemWithItemName:(NSString*)itemName withInformation:(NSString *)information {
    Item * newItem = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Item class]) inManagedObjectContext:[self managedObjectContext]];
    newItem.item = itemName;
    newItem.information = information;
    return newItem;
}

@end
