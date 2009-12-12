//
//  SampleForActionSheetWithToolbar.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForActionSheetWithToolbar.h"

@implementation SampleForActionSheetWithToolbar

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:NO animated:YES];
  self.title = @"アクションシート";
  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply
                                                  target:self
                                                  action:@selector(buttonDidPush)];
  [self setToolbarItems:[NSArray arrayWithObjects:button, nil] animated:YES];
  [button release];
}

- (void)buttonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"返信"];
  [sheet addButtonWithTitle:@"転送"];
  [sheet addButtonWithTitle:@"キャンセル"];
  sheet.cancelButtonIndex = 2;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
    NSLog( @"pushed Cancel button." );
  }
}

@end
