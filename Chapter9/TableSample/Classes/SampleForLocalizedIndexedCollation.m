//
//  SampleForLocalizedIndexedCollation.m
//
//  Created by ToKoRo on 2009-10-18.
//

#import "SampleForLocalizedIndexedCollation.h"

#pragma mark ----- Character -----

@implementation Character

@synthesize name = name_;
@synthesize job = job_;

@end

@implementation SampleForLocalizedIndexedCollation

@synthesize dataSource = dataSource_;

- (void)viewDidLoad {
  [super viewDidLoad];

  NSMutableArray* dataSourceTemp = [NSMutableArray arrayWithCapacity:22];
  for ( int i = 0; i < 20; ++i ){
    Character* dummy = [[Character alloc] init];
    dummy.name = ( i % 2 ) ? @"Dummy" : @"だみー";
    dummy.job = @"フリーター";
    [dataSourceTemp addObject:dummy];
    [dummy release];
  }
  Character* character1 = [[Character alloc] init];
  character1.name = @"なかむら";
  character1.job = @"魔導士";
  [dataSourceTemp addObject:character1];
  [character1 release];
  Character* character2 = [[Character alloc] init];
  character2.name = @"こだま";
  character2.job = @"遊び人";
  [dataSourceTemp addObject:character2];
  [character2 release];

  UILocalizedIndexedCollation* theCollation = [UILocalizedIndexedCollation currentCollation];
  // セクションの数だけ空のNSMutableArrayを持つ配列を作成
  NSInteger sectionCount = [[theCollation sectionTitles] count];
  NSMutableArray* sectionArrays = [NSMutableArray arrayWithCapacity:sectionCount];
  for ( int i = 0; i <= sectionCount; ++i ) {
    [sectionArrays addObject:[NSMutableArray arrayWithCapacity:1]];
  }
  // データをいったん、上で作った配列にセクションごとに入れ込む
  for ( Character* character in dataSourceTemp ) {
    NSInteger sect = [theCollation sectionForObject:character
                            collationStringSelector:@selector(name)];
    [[sectionArrays objectAtIndex:sect] addObject:character];
  }
  // セクションごとに、データを整理したうえでデータ管理用の配列に追加していく
  self.dataSource = [NSMutableArray arrayWithCapacity:sectionCount];
  for ( NSMutableArray* sectionArray in sectionArrays ) {
    NSArray* sortedSection = [theCollation sortedArrayFromArray:sectionArray
                                        collationStringSelector:@selector(name)];
    [self.dataSource addObject:sortedSection];
  }
}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView*)tableView {
  return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
  if ( [[self.dataSource objectAtIndex:section] count] < 1 ) {
    return nil;
  }
  return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView*)tableView
  sectionForSectionIndexTitle:(NSString*)title atIndex:(NSInteger)index
{
  return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
  return [self.dataSource count];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [[self.dataSource objectAtIndex:section] count];
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
  Character* character =
    [[self.dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  cell.textLabel.text = character.name;
  return cell;
}

@end
