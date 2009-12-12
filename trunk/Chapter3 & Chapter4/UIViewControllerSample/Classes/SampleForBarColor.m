//
//  SampleForBarColor.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForBarColor.h"

@implementation SampleForBarColor

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"tintColor";

  UIBarButtonItem* button1 =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                                   target:nil
                                                   action:nil] autorelease];
  UIBarButtonItem* spacer =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                   target:nil
                                                   action:nil ] autorelease];
  UIBarButtonItem* button2 =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo
                                                   target:nil
                                                   action:nil ] autorelease];
  NSArray* buttons = [NSArray arrayWithObjects:button1, spacer, button2, nil];
  [self setToolbarItems:buttons animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];

  // ナビゲーションバーを赤にする
  self.navigationController.navigationBar.tintColor = [UIColor redColor];
  // ツールバーを青にする
  self.navigationController.toolbar.tintColor = [UIColor blueColor];
}

@end
