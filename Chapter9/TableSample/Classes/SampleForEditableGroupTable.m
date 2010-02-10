//
//  SampleForEditableGroupTable.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForEditableGroupTable.h"

@implementation SampleForEditableGroupTable

- (void)dealloc {
  [keys_ release]; 
  [dataSource_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super initWithStyle:UITableViewStyleGrouped]) ) {
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 表示するデータを作成
  keys_ = [[NSArray alloc] initWithObjects:@"READ ONLY", @"SECITON 2", nil];
  NSMutableArray* object1 =
    [NSMutableArray arrayWithObjects:@"ITEM 1", @"ITEM 2", @"ITEM 3", nil];
  NSMutableArray* object2 =
    [NSMutableArray arrayWithObjects:@"ITEM 1", @"ITEM 2", nil];
  dataSource_ = [[NSMutableArray alloc] initWithObjects:object1, object2, nil];

  self.navigationItem.rightBarButtonItem = [self editButtonItem];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [[dataSource_ objectAtIndex:section] count];
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
  NSString* text = [[dataSource_ objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  cell.textLabel.text = text;
  return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
  return [keys_ count];
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
  return [keys_ objectAtIndex:section];
}

- (void)tableView:(UITableView*)tableView
  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
   forRowAtIndexPath:(NSIndexPath*)indexPath
{
  if ( UITableViewCellEditingStyleDelete == editingStyle ) {
    // データソースから実データを削除
    NSMutableArray* datas = [dataSource_ objectAtIndex:indexPath.section];
    [datas removeObjectAtIndex:indexPath.row];
    [dataSource_ replaceObjectAtIndex:indexPath.section withObject:datas];
    // テーブルからセルを削除
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationLeft];
  }
}


- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath*)indexPath {
  return ( 1 == indexPath.section );
}

- (void)tableView:(UITableView*)tableView
  moveRowAtIndexPath:(NSIndexPath*)fromIndexPath toIndexPath:(NSIndexPath*)toIndexPath
{
  // 同じセクションへ
  NSMutableArray* datas = [dataSource_ objectAtIndex:fromIndexPath.section];
  NSUInteger fromRow = fromIndexPath.row;
  NSUInteger toRow = toIndexPath.row;
  while ( fromRow < toRow ) {
    [datas exchangeObjectAtIndex:fromRow withObjectAtIndex:fromRow+1];
    fromRow++;
  }
  while ( fromRow > toRow ) {
    [datas exchangeObjectAtIndex:fromRow withObjectAtIndex:fromRow-1];
    fromRow--;
  }
  [dataSource_ replaceObjectAtIndex:fromIndexPath.section withObject:datas];
}

- (NSIndexPath*)tableView:(UITableView*)tableView
  targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath*)sourceIndexPath toProposedIndexPath:(NSIndexPath*)proposedDestinationIndexPath
{
  if ( 1 == proposedDestinationIndexPath.section ) {
    return proposedDestinationIndexPath;
  } else {
    return sourceIndexPath;
  }
}

- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath*)indexPath {
}

- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath*)indexPath {
}

@end
