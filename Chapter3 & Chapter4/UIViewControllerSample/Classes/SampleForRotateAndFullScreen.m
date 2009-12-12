//
//  SampleForRotateAndFullScreen.m
//
//  Created by ToKoRo on 2009-08-27.
//

#import "SampleForRotateAndFullScreen.h"

@implementation SampleForRotateAndFullScreen

- (void)viewDidLoad {
  [super viewDidLoad];

  // 画像の追加
  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  imageView.frame = self.view.bounds;
  imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  imageView.contentMode = UIViewContentModeScaleAspectFill;
  [self.view addSubview:imageView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  fullScreen_ = NO;
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];

  // ステータスバー/ナビゲーションバー/ツールバーを透過
  [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
  self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
  self.navigationController.navigationBar.translucent = YES;
  self.navigationController.toolbar.barStyle = UIBarStyleBlack;
  self.navigationController.toolbar.translucent = YES;
  // これを指定しないとステータスバーの下に描画できない
  self.wantsFullScreenLayout = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  fullScreen_ = !fullScreen_;

  BOOL needAnimation = YES;

  if ( needAnimation ) {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
  } 

  [[UIApplication sharedApplication] setStatusBarHidden:fullScreen_ animated:needAnimation];
  // APIリファレンスではnavigationBarのalpha値を直接いじることを推奨していない
  self.navigationController.navigationBar.alpha = fullScreen_ ? 0.0 : 1.0;
  self.navigationController.toolbar.alpha = fullScreen_ ? 0.0 : 1.0;

  if ( needAnimation ) {
    [UIView commitAnimations];
  }

  if ( !fullScreen_ ) {
    // これをしないと、フルスクリーン状態で回転させた後にフルスクリーンを解除すると
    // ナビゲーションバーの位置がずれてしまう
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setToolbarHidden:YES animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController setToolbarHidden:NO animated:NO];
  } 
}

@end
