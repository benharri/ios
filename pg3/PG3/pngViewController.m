//
//  pngViewController.m
//  PG3
//
//  Created by CS 344 Student on 10/10/16.
//  Copyright © 2016 Ben Harris. All rights reserved.
//

#import "pngViewController.h"
#import "ViewController.h"

@interface pngViewController ()

@end

@implementation pngViewController

@synthesize pngview;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  UIImage *img = [UIImage imageWithContentsOfFile:path];
//  UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
  [pngview setImage:img];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setPath:(NSString *)fpath {
  path = fpath;
}
-(void) setDir:(NSString *)newdir {
  dir = newdir;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  
//  NSLog(@"prepareforsegue");
  
  if ([segue.identifier isEqualToString:@"backtodirlist"]) {
//    NSLog(@"backtodirlist");
//    ViewController *vc = segue.destinationViewController;
    [segue.destinationViewController setDir:dir];
    [segue.destinationViewController loadpngsfromdir];
  }
}


- (IBAction)backbutton:(id)sender {
}
@end
