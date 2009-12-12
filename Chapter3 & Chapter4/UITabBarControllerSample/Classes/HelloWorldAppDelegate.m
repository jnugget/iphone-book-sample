//
//  HelloWorldAppDelegate.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "HelloWorldAppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"

@implementation HelloWorldAppDelegate

@synthesize window = window_;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  
  // windowを自分で作成
  CGRect bounds = [[UIScreen mainScreen] bounds];
  window_ = [[UIWindow alloc] initWithFrame:bounds];

  // 基点となるControllerを作成
  rootController_ = [[UITabBarController alloc] init];
  
  // ViewController1とViewController2を作成する
  ViewController1* tab1 = [[[ViewController1 alloc] init] autorelease];
  ViewController2* tab2 = [[[ViewController2 alloc] init] autorelease];

  // 作ったViewControllerをControllerにまとめて追加
  NSArray* controllers = [NSArray arrayWithObjects:tab1, tab2, nil];
  [(UITabBarController*)rootController_ setViewControllers:controllers animated:NO];
  
  // windowにControllerのviewを追加
  [window_ addSubview:rootController_.view];

  [window_ makeKeyAndVisible];
}

- (void)dealloc {
  [rootController_ release];
  [window_ release];
  [super dealloc];
}

@end
