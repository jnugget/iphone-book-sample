//
//  SampleForAlertWithLongMessage.m
//
//  Created by ToKoRo on 2009-09-19.
//

#import "SampleForAlertWithLongMessage.h"

@implementation SampleForAlertWithLongMessage

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.title = @"messageが長い場合";
  alert.message = @"1行目\n2行目\n3行目\n4行目\n5行目\n6行目\n7行目\n8行目\n9行目\n10行目\n11行目\n12行目\n13行目";
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

@end
