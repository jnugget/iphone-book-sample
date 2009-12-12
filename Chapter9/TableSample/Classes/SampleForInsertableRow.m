//
//  SampleForInsertableRow.m
//
//  Created by ToKoRo on 2009-09-22.
//

#import "SampleForInsertableRow.h"

@implementation SampleForInsertableRow

- (void)dealloc {
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSMutableArray alloc] initWithObjects:
                              @"ITEM 1", @"ITEM 2", @"ITEM 3",
                              @"新規追加", nil ];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.tableView setEditing:YES animated:YES];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return dataSource_.count;
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

- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView
  editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath
{
  // 編集モードの場合の最後のRowだけ挿入モードにする
  if ( tableView.editing && dataSource_.count <= indexPath.row + 1 ) {
    return UITableViewCellEditingStyleInsert;
  } else {
    return UITableViewCellEditingStyleDelete;
  }
}

// セルの追加/削除要求
- (void)tableView:(UITableView*)tableView
  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
   forRowAtIndexPath:(NSIndexPath*)indexPath
{
  if ( UITableViewCellEditingStyleDelete == editingStyle ) {
    // データソースから実データを削除
    [dataSource_ removeObjectAtIndex:indexPath.row];
    // テーブルからセルを削除
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationLeft];
  } else if ( UITableViewCellEditingStyleInsert == editingStyle ) {
    // データソースに１件追加
    [dataSource_ insertObject:@"NEW ITEM" atIndex:( dataSource_.count - 1 )];
    // テーブルにセルを追加
    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationBottom];
  }
}

@end
