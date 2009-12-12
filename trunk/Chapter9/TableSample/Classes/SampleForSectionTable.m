//
//  SampleForSectionTable.m
//
//  Created by ToKoRo on 2009-09-22.
//

#import "SampleForSectionTable.h"

@implementation SampleForSectionTable

- (void)dealloc {
  [keys_ release];
  [dataSource_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super init]) ) {
    self.title = @"SectionTable";    
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 表示するデータを作成
  keys_ = [[NSArray alloc] initWithObjects:@"ほ乳類", @"爬虫類", @"両生類", @"魚類", nil];
  NSArray* object1 = [NSArray arrayWithObjects:@"Monkey", @"Dog", @"Lion", @"Elephant", nil];
  NSArray* object2 = [NSArray arrayWithObjects:@"Snake", @"Gecko", nil];
  NSArray* object3 = [NSArray arrayWithObjects:@"Frog", @"Newts", nil];
  NSArray* object4 = [NSArray arrayWithObjects:@"Shark", @"Salmon", nil];
  NSArray* objects = [NSArray arrayWithObjects:object1, object2, object3, object4, nil];
  dataSource_ = [[NSDictionary alloc] initWithObjects:objects forKeys:keys_];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  id key = [keys_ objectAtIndex:section];
  return [[dataSource_ objectForKey:key] count];
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
  id key = [keys_ objectAtIndex:indexPath.section];
  NSString* text = [[dataSource_ objectForKey:key] objectAtIndex:indexPath.row];
  cell.textLabel.text = text;
  return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
  return [keys_ count];
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
  return [keys_ objectAtIndex:section];
}

//- (NSString*)tableView:(UITableView*)tableView titleForFooterInSection:(NSInteger)section {
//  return [keys_ objectAtIndex:section];
//}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView*)tableView {
  return keys_;
}

@end
