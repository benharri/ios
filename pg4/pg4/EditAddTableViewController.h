//
//  EditAddTableViewController.h
//  pg4
//
//  Created by Sarah Head on 12/3/16.
//  Copyright © 2016 benharris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface EditAddTableViewController : UITableViewController {
    NSIndexPath *selectedIndexPath;
    NSString *dbpath;
    sqlite3 *db;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *deptTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;


//- (IBAction) deleteButtonClicked:(id)sender;
- (void) setSelectedIndexPath:(NSIndexPath *)indexPath;
- (void) deleteProf;
- (void) setDBPath:(NSString *) db_path;

@end
