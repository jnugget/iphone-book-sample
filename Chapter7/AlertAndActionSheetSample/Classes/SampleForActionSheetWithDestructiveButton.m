//
//  SampleForActionSheetWithDestructiveButton.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForActionSheetWithDestructiveButton.h"

@implementation SampleForActionSheetWithDestructiveButton

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"アクションシート";
  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                  target:self
                                                  action:@selector(buttonDidPush)];
  [self setToolbarItems:[NSArray arrayWithObjects:button, nil] animated:YES];
  [button release];
}

- (void)buttonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"削除する"];
  [sheet addButtonWithTitle:@"キャンセル"];
  sheet.destructiveButtonIndex = 0;
  sheet.cancelButtonIndex = 1;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.destructiveButtonIndex ) {
    NSLog( @"pushed Delete button." );
  } else if ( buttonIndex == actionSheet.cancelButtonIndex ) {
    NSLog( @"pushed Cancel button." );
  }
}

@end
