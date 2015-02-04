//
//  MainTableViewController.m
//  CoreData
//
//  Created by David Manuntag on 2015-02-03.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "MainTableViewController.h"
#import <CoreData/CoreData.h>
#import "ItemDetailViewController.h"


@interface MainTableViewController ()
@property (nonatomic, strong) NSMutableArray *mutableItems;
@end

@implementation MainTableViewController

- (NSArray *)items {
    return [self.mutableItems copy];
}

-(NSManagedObjectContext*)managedObjectContext {
    
    
    NSManagedObjectContext * context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
        
    }
    
    return context;
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    //fetch the items from the persistent data store
    
    NSManagedObjectContext * managedObjectContext = [self managedObjectContext];

    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Item"];
    
    self.mutableItems = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    [self.tableView reloadData];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //configure the cell
    
    Item * item = [self.items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.item;
    cell.detailTextLabel.text = item.information;

    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSManagedObjectContext * context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [context deleteObject:[self.items objectAtIndex:indexPath.row]];
        
        NSError * error = nil;
        if(![context save:&error]) {
            
            NSLog(@"Cannot save %@, %@", error, [error localizedDescription]);
            return;
            
        }
    
        // Remove item from table view
        [self.mutableItems removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
    
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        
        ItemDetailViewController * detailViewController = segue.destinationViewController;
        
        Item * item = [self.items objectAtIndex:self.tableView.indexPathForSelectedRow.row];
       
        detailViewController.item = item;
        
        
    }
    
}


@end
