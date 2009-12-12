//
//  SampleForSearchDisplay.m
//
//  Created by ToKoRo on 2009-10-05.
//

#import "SampleForSearchDisplay.h"

#pragma mark ----- Item -----

@implementation Item

@synthesize weapon = weapon_;
@synthesize armor = armor_;
@synthesize name = name_;

+ (id)weaponWithName:(NSString*)name {
  Item* item = [[[Item alloc] init] autorelease];
  item.name = name;
  item.weapon = YES;
  return item;
}

+ (id)armorWithName:(NSString*)name {
  Item* item = [[[Item alloc] init] autorelease];
  item.name = name;
  item.armor = YES;
  return item;
}

- (NSComparisonResult)compare:(Item*)aItem {
  if ( aItem == self ) {
    return NSOrderedSame;
  } 
  return [self.name compare:[aItem name]];
}

@end

#pragma mark ----- SampleForSearchDisplay -----

@implementation SampleForSearchDisplay

- (void)dealloc {
  [dataSource_ release];
  [searchResult_ release];
  [searchDisplay_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"装備検索";

  UISearchBar* searchBar = [[[UISearchBar alloc] init] autorelease];
  searchBar.frame = CGRectMake( 0, 0, self.tableView.bounds.size.width, 0 );
  [searchBar sizeToFit];
  searchBar.scopeButtonTitles = [NSArray arrayWithObjects:@"すべて", @"武器", @"防具", nil];
  searchBar.showsScopeBar = YES;
  self.tableView.tableHeaderView = searchBar;

  searchDisplay_ =
    [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
  searchDisplay_.delegate = self;
  searchDisplay_.searchResultsDataSource = self;
  searchDisplay_.searchResultsDelegate = self;

  NSArray* weapons = [NSArray arrayWithObjects:
                       @"セラミックのつるぎ",
                       @"セラミックのほうちょう",
                       @"セラミックピーラー",
                       @"聖なるものさし",
                       nil];
  NSArray* armors = [NSArray arrayWithObjects:
                       @"セラミックのよろい",
                       @"セラミックのたて",
                       @"セラミックのかぶと",
                       @"まほうのパーカー",
                       @"クールビズスーツ",
                       nil];
  dataSource_ = [[NSMutableArray alloc] initWithCapacity:16];
  for ( id name in weapons ) {
    [dataSource_ addObject:[Item weaponWithName:name]];
  }
  for ( id name in armors ) {
    [dataSource_ addObject:[Item armorWithName:name]];
  }
  [dataSource_ sortUsingSelector:@selector(compare:)];

  searchResult_ = [[NSMutableArray alloc] initWithCapacity:dataSource_.count];
}

- (BOOL)searchDisplayController:(UISearchDisplayController*)controller
  shouldReloadTableForSearchString:(NSString*)searchString
{
  // いったん全データを削除
  [searchResult_ removeAllObjects];
  // 検索文字列を含むデータだけ追加する
  for ( Item* item in dataSource_ ) {
    if ( NSNotFound != [item.name rangeOfString:searchString].location ) {
      [searchResult_ addObject:item];
    } 
  }
  return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController*)controller
  shouldReloadTableForSearchScope:(NSInteger)searchOption
{
  // いったん全データを削除
  [searchResult_ removeAllObjects];
  // 検索文字列を含み、かつ合致するスコープのデータだけを追加する
  NSString* searchString = controller.searchBar.text;
  for ( Item* item in dataSource_ ) {
    if ( NSNotFound != [item.name rangeOfString:searchString].location ) {
      if ( 0 == searchOption ) {
        [searchResult_ addObject:item];
      } else if ( 1 == searchOption ) {
        if ( [item isWeapon] ) {
          [searchResult_ addObject:item];
        } 
      } else {
        if ( [item isArmor] ) {
          [searchResult_ addObject:item];
        } 
      }
    }
  }
  return YES;
}

#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView*)tableView
  numberOfRowsInSection:(NSInteger)section
{
  if ( tableView == self.searchDisplayController.searchResultsTableView ) {
    return [searchResult_ count];
  } else {
    return [dataSource_ count];
  }
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  if ( tableView == self.searchDisplayController.searchResultsTableView ) {
    cell.textLabel.text = [[searchResult_ objectAtIndex:indexPath.row] name];
  } else {
    cell.textLabel.text = [[dataSource_ objectAtIndex:indexPath.row] name];
  }
  return cell;
}

@end
