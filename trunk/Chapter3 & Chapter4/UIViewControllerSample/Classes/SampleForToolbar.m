//
//  SampleForToolbar.m
//
//  Created by ToKoRo on 2009-08-19.
//

#import "SampleForToolbar.h"

@interface NextViewController ()
- (void)nextDidPush;
@end 

@implementation NextViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Next";
  self.view.backgroundColor = [UIColor whiteColor];

  // 次の画面に進むボタンを設置
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"次の画面へ" forState:UIControlStateNormal];
  [button sizeToFit];
  button.center = self.view.center;
  button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
  [button addTarget:self
             action:@selector(nextDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (void)nextDidPush {
  UIViewController* nextViewController = [[[NextViewController alloc] init] autorelease];

  // はじめの一度だけhidesBottomBarWhenPushedをYESにする
  static BOOL nowFirst = YES;
  if ( nowFirst ) {
    nextViewController.hidesBottomBarWhenPushed = YES;
    nowFirst = FALSE;
    NSLog( @"nowFirst" );
  } 

  [self.navigationController pushViewController:nextViewController animated:YES];
}

@end

#pragma mark ----- Private Methods Definition -----

@interface SampleForToolbar ()
- (void)buttonDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForToolbar

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"SampleForToolbar";

  // ツールバーの左側に表示するボタン
  UIBarButtonItem* button1 =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                                   target:self
                                                   action:@selector(buttonDidPush) ] autorelease];
  // 自動伸縮するボタンとボタンの間のスペース
  UIBarButtonItem* spacer =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                   target:nil
                                                   action:nil ] autorelease];
  // ツールバーの右側に表示するボタン
  UIBarButtonItem* button2 =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo
                                                   target:self
                                                   action:@selector(buttonDidPush) ] autorelease];
  // これらをすべてNSArrayに突っ込んで・・・
  NSArray* buttons = [NSArray arrayWithObjects:button1, spacer, button2, nil];

  // さきほど準備したNSArrayをツールバーのアイテムとして設定
  [self setToolbarItems:buttons animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:YES];
  [self.navigationController setToolbarHidden:NO animated:YES];
}

#pragma mark ----- Private Methods -----

- (void)buttonDidPush {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"INFORMATION"
                                                   message:@"buttonDidPush"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

@end
