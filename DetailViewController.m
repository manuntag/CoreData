//
//  DetailViewController.m
//  CoreData
//
//  Created by David Manuntag on 2015-02-03.
//  Copyright (c) 2015 David Manuntag. All rights reserved.
//

#import "DetailViewController.h"
#import "Item.h"
#import <CoreData/CoreData.h>

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *itemTextField;
@property (weak, nonatomic) IBOutlet UITextField *informationTextField;

- (IBAction)cancelButton:(id)sender;

- (IBAction)saveButton:(id)sender;

@end

@implementation DetailViewController

-(NSManagedObjectContext*)managedObjectContext {
    
    
    NSManagedObjectContext * context=nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
    }
    
    
    return context;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)saveButton:(id)sender {
    
    NSManagedObjectContext * context = [self managedObjectContext];
    
    //create a new managed object

    [Item itemWithItemName:self.itemTextField.text withInformation:self.itemTextField.text];
    
    NSError * error = nil;
    
    //save object to persistent store
    
    if (![context save:&error]) {
        NSLog(@"Can't save %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end



