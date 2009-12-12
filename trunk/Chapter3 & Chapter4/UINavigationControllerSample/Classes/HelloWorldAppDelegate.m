//
//  HelloWorldAppDelegate.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "HelloWorldAppDelegate.h"
#import "TopMenuController.h"

@implementation HelloWorldAppDelegate

@synthesize window = window_;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  
  // windowを自分で作成
  CGRect bounds = [[UIScreen mainScreen] bounds];
  window_ = [[UIWindow alloc] initWithFrame:bounds];

  // 基点となるControllerを作成
  TopMenuController* topMenu = [[[TopMenuController alloc] init] autorelease];  
  rootController_ = [[UINavigationController alloc] initWithRootViewController:topMenu];
  
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
