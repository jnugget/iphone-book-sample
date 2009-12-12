//
//  SampleForActionSheetObserving.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForActionSheetObserving.h"

@implementation SampleForActionSheetObserving

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:NO animated:YES];
  self.title = @"アクションシート";
  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
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
  } else {
    NSLog( @"pushed Any button." );
  }
}

- (void)willPresentActionSheet:(UIActionSheet*)actionSheet {
  NSLog( @"willPresentActionSheet" );
}

- (void)didPresentActionSheet:(UIActionSheet*)actionSheet {
  NSLog( @"didPresentActionSheet" );
}

- (void)actionSheetCancel:(UIActionSheet*)actionSheet {
  NSLog( @"actionSheetCancel" );
}

- (void)actionSheet:(UIActionSheet*)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
  NSLog( @"willDismissWithButtonIndex" );
}

- (void)actionSheet:(UIActionSheet*)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
  NSLog( @"didDismissWithButtonIndex" );
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return TRUE;
}

@end
