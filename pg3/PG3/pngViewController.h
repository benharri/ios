//
//  pngViewController.h
//  PG3
//
//  Created by CS 344 Student on 10/10/16.
//  Copyright © 2016 Ben Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pngViewController : UIViewController {
  NSString *path;
  NSString *dir;
}

@property (weak, nonatomic) IBOutlet UIImageView *pngview;
-(void) setPath:(NSString *)fpath;
-(void) setDir:(NSString *)newdir;

@end
