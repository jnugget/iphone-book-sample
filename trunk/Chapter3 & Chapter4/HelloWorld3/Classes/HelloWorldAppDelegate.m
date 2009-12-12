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
  
  // ViewController1とViewController2を作成して、
  // そのviewをそれぞれwindowに追加
  viewController1_ = [[ViewController1 alloc] init];
  viewController2_ = [[ViewController2 alloc] init];
  [window_ addSubview:viewController1_.view];
  [window_ addSubview:viewController2_.view];

  // ViewController1のほうのviewを前面に出す
  [window_ bringSubviewToFront:viewController1_.view];

  [window_ makeKeyAndVisible];
}


- (void)dealloc {
  [viewController1_ release];
  [viewController2_ release];
  [window_ release];
  [super dealloc];
}


@end
