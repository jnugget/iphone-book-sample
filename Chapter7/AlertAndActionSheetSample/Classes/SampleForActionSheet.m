//
//  SampleForActionSheet.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForActionSheet.h"

@implementation SampleForActionSheet

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:YES animated:NO];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"アクションシート";
  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                  target:self
                                                  action:@selector(buttonDidPush)];
  self.navigationItem.rightBarButtonItem = button;
  [button release];
}

- (void)buttonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"アクション1"];
  [sheet addButtonWithTitle:@"アクション2"];
  [sheet addButtonWithTitle:@"キャンセル"];
  sheet.cancelButtonIndex = 2;
  [sheet showInView:self.view];

  /* こちらでも同じ
  UIActionSheet* sheet = [[[UIActionSheet alloc] initWithTitle:nil
                                                      delegate:self
                                             cancelButtonTitle:@"キャンセル"
                                        destructiveButtonTitle:nil
                                             otherButtonTitles:@"アクション1", @"アクション2", nil] autorelease];
  [sheet showInView:self.view];
  */
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
    NSLog( @"pushed Cancel button." );
  }
}

@end
