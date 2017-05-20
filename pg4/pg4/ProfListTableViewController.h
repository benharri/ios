//
//  ProfListTableViewController.h
//  pg4
//
//  Created by CS 344 Student on 12/1/16.
//  Copyright © 2016 benharris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ProfListTableViewController : UITableViewController {
    NSString *dbpath;
    sqlite3 *db;
    NSIndexPath *selectedIndexPath;
}

@end
