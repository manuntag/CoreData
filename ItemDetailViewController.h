//
//  ItemDetailViewController.h
//  CoreData
//
//  Created by David Manuntag on 2015-02-03.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Item.h"

@interface ItemDetailViewController : UIViewController

@property (strong, nonatomic) Item * item;

@property (strong, nonatomic) IBOutlet UILabel *itemLabel;

@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;



@end
