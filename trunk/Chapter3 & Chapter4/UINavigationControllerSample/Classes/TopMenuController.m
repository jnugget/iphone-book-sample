//
//  TopMenuController.m
//
//  Created by ToKoRo on 2009-08-16.
//

#import "TopMenuController.h"

@implementation TopMenuController

- (void)dealloc {
  [items_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super initWithStyle:UITableViewStylePlain]) ) {
    self.title = @"トップメニュー";
    // 表示するデータを作成
    items_ = [[NSMutableArray alloc] initWithObjects:
                  @"ViewController1",
                  @"ViewController2",
                  nil ];
  }
  return self;
}

#pragma mark ----- UITableViewDataSource Methods -----

- (NSInteger)tableView:(UITableView*)tableView
numberOfRowsInSection:(NSInteger)section {

  return [items_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
cellForRowAtIndexPath:(NSIndexPath*)indexPath {

  // 既にセルの型が登録済みかどうかをチェック
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"simple-cell"];
  if ( !cell ) {
    // セルの型が登録済みでないなら新しく登録する
    cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"simple-cell"] autorelease];
  } 
  // セルのラベルに表示するテキストを設定
  cell.textLabel.text = [items_ objectAtIndex:indexPath.row];
  return cell;
}

#pragma mark ----- UITableViewDelegate Methods -----

- (void)tableView:(UITableView*)tableView
didSelectRowAtIndexPath:(NSIndexPath*)indexPath {

  Class class = NSClassFromString( [items_ objectAtIndex:indexPath.row] );
  id viewController = [[[class alloc] init] autorelease];
  if ( viewController ) {
    [self.navigationController pushViewController:viewController animated:YES];
  } 
}

@end
