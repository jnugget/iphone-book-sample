//
//  SampleForNavigation.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "SampleForNavigation.h"

@implementation SampleForNavigation

- (void)viewDidLoad {
  [super viewDidLoad];

  // １行メッセージの追加
  self.navigationItem.prompt = @"１行メッセージ";
  // タイトルの設定
  self.navigationItem.title = @"タイトル";

  // ボタンを右側に追加
  UIBarButtonItem* rightItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                   target:nil
                                                   action:nil ] autorelease];
  self.navigationItem.rightBarButtonItem = rightItem;


  // UIImageViewを左側に追加
  UIImage* image = [UIImage imageNamed:@"face.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  UIBarButtonItem* icon =
    [[[UIBarButtonItem alloc] initWithCustomView:imageView] autorelease];
  self.navigationItem.leftBarButtonItem = icon;

  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.backgroundColor = [UIColor blackColor];
  [self.view addSubview:label];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  self.navigationItem.leftBarButtonItem = nil;
}

@end
