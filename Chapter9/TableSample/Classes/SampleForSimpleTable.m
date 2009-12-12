//
//  SampleForSimpleTable.m
//
//  Created by ToKoRo on 2009-09-21.
//

#import "SampleForSimpleTable.h"

@implementation SampleForSimpleTable

- (void)dealloc {
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSArray alloc] initWithObjects:
                              @"ITEM 1", @"ITEM 2", @"ITEM 3",
                              @"ITEM 4", @"ITEM 5", @"ITEM 6",
                              @"ITEM 7", @"ITEM 8", @"ITEM 9",
                              @"ITEM 10", @"ITEM 11", @"ITEM 12",
                              @"ITEM 13", @"ITEM 14", @"ITEM 15",
                              @"ITEM 16", @"ITEM 17", @"ITEM 18",
                              nil ];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [dataSource_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString* identifier = @"basis-cell";
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:identifier];
    [cell autorelease];
  }
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  NSString* message = [dataSource_ objectAtIndex:indexPath.row];
  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = message;
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

@end
