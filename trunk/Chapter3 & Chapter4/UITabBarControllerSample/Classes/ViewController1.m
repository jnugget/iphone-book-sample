//
//  ViewController1.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "ViewController1.h"

@implementation ViewController1

// initialize
- (id)init {
  if ( (self = [super init]) ) {
    // tabBar用設定
    self.title = @"Hello";
    UIImage* icon = [UIImage imageNamed:@"ball1.png"];
    self.tabBarItem =
      [[[UITabBarItem alloc] initWithTitle:@"Hello" image:icon tag:0] autorelease];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // Hello, world! ラベルを追加
  // 背景は白、文字は黒で
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"Hello, world!";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor whiteColor];
  label.textColor = [UIColor blackColor];
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  NSLog( @"parentViewController = %x", self.parentViewController );
  NSLog( @"tabBarController = %x", self.tabBarController );
}

@end
