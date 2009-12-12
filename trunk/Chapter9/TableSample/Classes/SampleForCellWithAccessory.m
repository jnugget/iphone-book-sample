//
//  SampleForCellWithAccessory.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForCellWithAccessory.h"

@implementation SampleForCellWithAccessory

- (void)viewDidLoad {
  [super viewDidLoad];
  // ナビゲーションバーにボタンを追加
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"AccesoryType"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(buttonDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
  cell.accessoryType = accessoryType_;
  return cell;
}

- (void)buttonDidPush {
  if ( UITableViewCellAccessoryCheckmark < ++accessoryType_ ) {
    accessoryType_ = UITableViewCellAccessoryNone;
  } 
  [self.tableView reloadData];
}

- (void)tableView:(UITableView*)tableView
  accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath
{
  UIViewController* viewController = [[SampleForCellWithDetail alloc] init];
  [self.navigationController pushViewController:viewController animated:YES];
  [viewController release];
}

@end
