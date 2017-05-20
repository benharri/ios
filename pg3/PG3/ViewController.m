//
//  ViewController.m
//  PG3
//
//  Created by Ben Harris on 9/22/16.
//  Copyright © 2016 Ben Harris. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <dirent.h>
#import "pngViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize dirtextfield;
@synthesize listscrollview;

- (void)viewDidLoad {
  [super viewDidLoad];
  
//  dirtextfield.text = @"/Users/cs344student/benharri/pg3";
  


  dirtextfield.placeholder = @"Enter a directory to look for PNGs";
  

  listscrollview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-0);
  self.automaticallyAdjustsScrollViewInsets= NO;
  listscrollview.scrollEnabled= YES;
  listscrollview.userInteractionEnabled= YES;
  [listscrollview setShowsHorizontalScrollIndicator:NO];
  [listscrollview setShowsVerticalScrollIndicator:YES];
  [self.view addSubview:listscrollview];
  

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void) viewDidAppear:(BOOL)animated {
  if (![dir isEqualToString:@""]) {
    dirtextfield.text = dir;
    NSLog(@"dir var isnot empty");
    NSLog(@"%@", dir);
    [self loadpngsfromdir];
  }
}

-(void)setDir:(NSString *)newdir {
  dir = newdir;
}


- (void) loadpngsfromdir {
  
//  dir = dir?dir:dirtextfield.text;
  
  DIR *dd = opendir([dir UTF8String]);
  if(!dd) return;
  struct dirent *entry;
  
  int offset = 0;
  
  while ((entry = readdir(dd)) != NULL) {
    NSString *flname = [[NSString alloc] initWithUTF8String:entry->d_name];
    NSString *extension = [flname pathExtension];
    if ([flname isEqualToString:@"."]
        || [flname isEqualToString:@".."]
        || [extension caseInsensitiveCompare:@"png"] != NSOrderedSame) continue;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(showimage:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:flname forState:UIControlStateNormal];
    button.frame = CGRectMake(0.0, offset * 60, 320.0, 40.0);
    button.backgroundColor = [UIColor blackColor];
    
    [listscrollview addSubview:button];
    
    NSLog(@"%@", flname);
    
    offset++;
  }
  
  listscrollview.contentSize= CGSizeMake(listscrollview.frame.size.width ,60 + offset*60);
  
}


- (IBAction)butt:(id)sender {
  dir = dirtextfield.text;
  [self loadpngsfromdir];
}


-(IBAction)showimage:(id)sender {

  NSString *fpath = dir;
  if (![dir hasSuffix:@"/"]) fpath = [fpath stringByAppendingString:@"/"];
  UIButton *curbutt = (UIButton*) sender;
  fpath = [fpath stringByAppendingString:curbutt.currentTitle];
  
  NSLog(@"%@", fpath);
  
  pngViewController * pngview = [self.storyboard instantiateViewControllerWithIdentifier:@"pngview"];
  [pngview setPath:fpath];
  [pngview setDir:dir];
  
  [self presentViewController:pngview animated:YES completion:nil];


}


@end
