//
//  ViewController.h
//  PG3
//
//  Created by CS344 Student on 9/22/16.
//  Copyright © 2016 Ben Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  NSString *dir;
}

@property (weak, nonatomic) IBOutlet UISearchBar *dirtextfield;
@property (weak, nonatomic) IBOutlet UIScrollView *listscrollview;

- (IBAction)butt:(id)sender;
- (void)loadpngsfromdir;

-(void)setDir:(NSString *)newdir;

@end

