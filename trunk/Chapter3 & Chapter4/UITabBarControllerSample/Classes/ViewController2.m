//
//  ViewController2.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "ViewController2.h"

@implementation ViewController2

// initialize
- (id)init {
  if ( (self = [super init]) ) {
    // tabBar用設定
    self.title = @"こんばんわ";
    UIImage* icon = [UIImage imageNamed:@"ball2.png"];
    self.tabBarItem =
      [[[UITabBarItem alloc] initWithTitle:@"こんばんわ" image:icon tag:0] autorelease];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // こんばんわ、世界！ ラベルを追加
  // 背景は黒、文字は白で
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"こんばんわ、世界！";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label];
}

@end
