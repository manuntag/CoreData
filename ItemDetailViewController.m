//
//  ItemDetailViewController.m
//  CoreData
//
//  Created by David Manuntag on 2015-02-03.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Item.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemLabel.text = self.item.item;
    self.descriptionLabel.text = self.item.information;
    
}


@end
