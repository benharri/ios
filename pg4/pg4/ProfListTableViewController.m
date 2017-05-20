//
//  ProfListTableViewController.m
//  pg4
//
//  Created by CS 344 Student on 12/1/16.
//  Copyright © 2016 benharris. All rights reserved.
//

#import "ProfListTableViewController.h"
#import "EditAddTableViewController.h"
#import <sqlite3.h>

@interface ProfListTableViewController ()

@end

@implementation ProfListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"NMU Professors"];
    
//    dbpath = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"db"];
#warning needs absolute dbpath
    dbpath = @"/Users/cs344student/benharri/pg4/app.db";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if ((sqlite3_open_v2([dbpath UTF8String], &db, SQLITE_OPEN_READWRITE, NULL)) != SQLITE_OK) {
        NSLog(@"failed to open app.db");
        return 0;
    }
    
    sqlite3_stmt *stmt;
    sqlite3_prepare_v2(db, "select count(distinct department) from profs", -1, &stmt, NULL);
    sqlite3_step(stmt);
    int num_sections = sqlite3_column_int(stmt, 0);
    sqlite3_finalize(stmt);
    sqlite3_close(db);
//    NSLog(@"num_sections = %d", num_sections);
    return num_sections;
}





- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if ((sqlite3_open_v2([dbpath UTF8String], &db, SQLITE_OPEN_READWRITE, NULL)) != SQLITE_OK) {
        NSLog(@"failed to open app.db");
        return 0;
    }
    
    sqlite3_stmt *stmt;
    NSString *query = [NSString stringWithFormat:@"select distinct department from profs order by department limit 1 offset %ld", (long)section];
    sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
    sqlite3_step(stmt);
    NSString *dept_title = [NSString stringWithUTF8String:(const char * _Nonnull)sqlite3_column_text(stmt, 0)];
    sqlite3_finalize(stmt);
    sqlite3_close(db);
    return dept_title;
}






- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ((sqlite3_open_v2([dbpath UTF8String], &db, SQLITE_OPEN_READWRITE, NULL)) != SQLITE_OK) {
        NSLog(@"failed to open app.db");
        return 0;
    }
    
    sqlite3_stmt *stmt;
    NSString *query = [NSString stringWithFormat:@"select count (prof_id) from profs where department = (select distinct department from profs order by department limit 1 offset %ld)", (long)section];
    sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
    sqlite3_step(stmt);
    int num_rows = sqlite3_column_int(stmt, 0);
    sqlite3_finalize(stmt);
    sqlite3_close(db);
    return num_rows;
}






// get cell from index path
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"prof_cell" forIndexPath:indexPath];
    
    // Configure the cell...

    if ((sqlite3_open_v2([dbpath UTF8String], &db, SQLITE_OPEN_READWRITE, NULL)) != SQLITE_OK) {
        NSLog(@"failed to open app.db");
        return 0;
    }
    
    NSString *query = [NSString stringWithFormat:
                       @"select name from profs where prof_id =\
                            (select prof_id from profs where department = \
                                (select distinct department from profs order by department limit 1 offset %ld)\
                            order by name limit 1 offset %ld)",
                       (long)indexPath.section, (long)indexPath.row];
    
    sqlite3_stmt *stmt;
    sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
    sqlite3_step(stmt);
    
    cell.textLabel.text = [NSString stringWithUTF8String:(const char * _Nonnull)sqlite3_column_text(stmt, 0)];
    sqlite3_finalize(stmt);
    sqlite3_close(db);
    
    return cell;
}


-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
}
- (void)viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [(EditAddTableViewController *)[segue destinationViewController] setDBPath:dbpath];
    if ([segue.identifier isEqualToString:@"showProf"]) {
        [(EditAddTableViewController *)[segue destinationViewController] setSelectedIndexPath:[self.tableView indexPathForSelectedRow]];
    }
}






 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

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




@end
