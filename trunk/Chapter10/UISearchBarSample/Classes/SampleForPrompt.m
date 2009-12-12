//
//  SampleForPrompt.m
//
//  Created by ToKoRo on 2009-10-06.
//

#import "SampleForPrompt.h"

@implementation SampleForPrompt

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UISearchBar* searchBar = [[[UISearchBar alloc] init] autorelease];
  searchBar.frame = CGRectMake( 0, 0, 320, 70 );

  searchBar.prompt = @"世界の宿屋検索";
  searchBar.placeholder = @"宿屋の名前の一部を入力してください";

  [self.view addSubview:searchBar];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
