//
//  EditAddTableViewController.m
//  pg4
//
//  Created by Ben Harris on 12/3/16.
//  Copyright © 2016 benharris. All rights reserved.
//

#import "EditAddTableViewController.h"
#import <sqlite3.h>

@interface EditAddTableViewController ()

@end

@implementation EditAddTableViewController

@synthesize nameTextField;
@synthesize deptTextField;
@synthesize emailTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Add/Edit"];
    
    // if we are loading an existing professor
    if (selectedIndexPath != nil) {

        if ((sqlite3_open_v2([dbpath UTF8String], &db, SQLITE_OPEN_READWRITE, NULL)) != SQLITE_OK) {
            NSLog(@"failed to open app.db");
        }
        
        NSString *query = [NSString stringWithFormat:
                           @"select name, email, department\
                           from profs where prof_id =\
                           (select prof_id from profs where department = \
                           (select distinct department from profs order by department limit 1 offset %ld)\
                           order by name limit 1 offset %ld)",
                           (long)selectedIndexPath.section, (long)selectedIndexPath.row];
        
        sqlite3_stmt *stmt;
        sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        sqlite3_step(stmt);
        
        nameTextField.text = [NSString stringWithUTF8String:(const char * _Nonnull)sqlite3_column_text(stmt, 0)];
        emailTextField.text = [NSString stringWithUTF8String:(const char * _Nonnull)sqlite3_column_text(stmt, 1)];
        deptTextField.text = [NSString stringWithUTF8String:(const char * _Nonnull)sqlite3_column_text(stmt, 2)];
        
        sqlite3_finalize(stmt);
        sqlite3_close(db);
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                                                              target:self
                                                                                              action:@selector(deleteProf)];
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) setSelectedIndexPath:(NSIndexPath *)indexPath {
    selectedIndexPath = indexPath;
}

- (void) setDBPath:(NSString *) db_path {
    dbpath = db_path;
}

- (void) deleteProf {
    
    if ((sqlite3_open_v2([dbpath UTF8String], &db, SQLITE_OPEN_READWRITE, NULL)) != SQLITE_OK) {
        NSLog(@"failed to open app.db");
    }
    
    NSString *query = [NSString stringWithFormat:
                       @"delete from profs where prof_id =\
                       (select prof_id from profs where department = \
                       (select distinct department from profs order by department limit 1 offset %ld)\
                       order by name limit 1 offset %ld)",
                       (long)selectedIndexPath.section, (long)selectedIndexPath.row];
    
    sqlite3_stmt *stmt;
    sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
    sqlite3_step(stmt);
    sqlite3_finalize(stmt);
    sqlite3_close(db);

    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // name is required!! don't do anything if the field is empty
    if ([nameTextField.text isEqualToString:@""]) return;
    
    if ((sqlite3_open_v2([dbpath UTF8String], &db, SQLITE_OPEN_READWRITE, NULL)) != SQLITE_OK) {
        NSLog(@"failed to open app.db");
    }
    
    NSString *query;
    // if there is no selected cell
    if (selectedIndexPath != nil) {
        // update

        query = [NSString stringWithFormat:
                 @"update profs set name = '%@', department = '%@', email = '%@'\
                 where prof_id = (select prof_id from profs where department = \
                 (select distinct department from profs order by department limit 1 offset %ld)\
                 order by name limit 1 offset %ld)",
                 nameTextField.text, deptTextField.text, emailTextField.text,
                 (long)selectedIndexPath.section, (long)selectedIndexPath.row];
        
    } else { // insert
        query = [NSString stringWithFormat:@"insert into profs (name, department, email) values ('%@', '%@', '%@')",
                 nameTextField.text, deptTextField.text, emailTextField.text];
    }
    
    sqlite3_stmt *stmt;
    sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
    sqlite3_step(stmt);
    sqlite3_finalize(stmt);
    sqlite3_close(db);
}



@end
