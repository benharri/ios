//
//  DataViewController.m
//  PG2
//
//  Created by CS 344 Student on 9/12/16.
//  Copyright © 2016 Ben Harris. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.dataLabel.text = [self.dataObject description];
}

@end
