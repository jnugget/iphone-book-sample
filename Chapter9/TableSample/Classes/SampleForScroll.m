//
//  SampleForScroll.m
//
//  Created by ToKoRo on 2009-09-24.
//

#import "SampleForScroll.h"

@implementation SampleForScroll

- (void)viewDidLoad {
  [super viewDidLoad];
  UIBarButtonItem* topButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"top"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(topDidPush)] autorelease];
  UIBarButtonItem* currentButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"current"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(currentDidPush)] autorelease];
  UIBarButtonItem* bottomButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"bottom"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(bottomDidPush)] autorelease];
  NSArray* buttons = [NSArray arrayWithObjects:topButton, currentButton, bottomButton, nil];
  [self setToolbarItems:buttons animated:YES];
}

- (void)topDidPush {
  NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  [self.tableView scrollToRowAtIndexPath:indexPath
                        atScrollPosition:UITableViewScrollPositionNone
                                animated:YES];
}

- (void)currentDidPush {
  [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionNone
                                                    animated:YES];
}

- (void)bottomDidPush {
  NSIndexPath* indexPath = [NSIndexPath indexPathForRow:dataSource_.count-1 inSection:0];
  [self.tableView scrollToRowAtIndexPath:indexPath
                        atScrollPosition:UITableViewScrollPositionNone
                                animated:YES];
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
}

@end
