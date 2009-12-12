//
//  SampleForRealTimeSearch.m
//
//  Created by ToKoRo on 2009-10-06.
//

#import "SampleForRealTimeSearch.h"

@implementation SampleForRealTimeSearch

- (void)viewDidLoad {
  [super viewDidLoad];

  searchBar_.keyboardType = UIKeyboardTypeNumberPad;
  searchBar_.showsCancelButton = YES;
}

- (void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)searchText {
  if ( 0 == searchText.length ) {
    [dataSource_ release];
    dataSource_ = [[NSMutableArray alloc] initWithArray:dataBase_];
    [self.tableView reloadData];
  } else {
    [dataSource_ removeAllObjects];
    for ( NSString* data in dataBase_ ) {
      if ( [data hasPrefix:searchBar.text] ) {
        [dataSource_ addObject:data];
      } 
    }
    [self.tableView reloadData];
  }
}

- (void)searchBarCancelButtonClicked:(UISearchBar*)searchBar {
  searchBar.text = @"";
  [searchBar resignFirstResponder];
}

@end
