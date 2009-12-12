//
//  SampleForSearchBar.m
//
//  Created by ToKoRo on 2009-10-05.
//

#import "SampleForSearchBar.h"

@implementation SampleForSearchBar

- (void)dealloc {
  [searchBar_ release];
  [dataSource_ release];
  [dataBase_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  searchBar_ = [[UISearchBar alloc] init];
  searchBar_.frame = CGRectMake( 0, 0, self.tableView.bounds.size.width, 0 );
  searchBar_.delegate = self;
  [searchBar_ sizeToFit];
  self.tableView.tableHeaderView = searchBar_;

  dataBase_ = [[NSMutableArray alloc] initWithCapacity:64];
  dataSource_ = [[NSMutableArray alloc] initWithCapacity:64];
  for ( int i = 0; i < 64; ++i ){
    [dataBase_ addObject:[NSString stringWithFormat:@"%d", i]];
    [dataSource_ addObject:[NSString stringWithFormat:@"%d", i]];
  }
}

- (void)searchBarSearchButtonClicked:(UISearchBar*)searchBar {
  [dataSource_ removeAllObjects];
  for ( NSString* data in dataBase_ ) {
    if ( [data hasPrefix:searchBar.text] ) {
      [dataSource_ addObject:data];
    } 
  }
  [self.tableView reloadData];
  [searchBar resignFirstResponder];
}

#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView*)tableView
  numberOfRowsInSection:(NSInteger)section
{
  return [dataSource_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];

  return cell;
}

@end
