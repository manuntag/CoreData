//
//  Item.h
//  CoreData
//
//  Created by David Manuntag on 2015-02-03.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * information;
@property (nonatomic, retain) NSString * item;

+(instancetype)itemWithItemName:(NSString*)itemName withInformation:(NSString *)information;


@end
