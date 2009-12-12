//
//  SampleForToolbarSystemItem.m
//
//  Created by ToKoRo on 2009-08-26.
//

#import "SampleForToolbarSystemItem.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForToolbarSystemItem ()
- (UIBarButtonItem*)barButtonSystemItem:(UIBarButtonSystemItem)systemItem;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForToolbarSystemItem

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UIBarButtonSystemItem一覧";

  [self setToolbarItems:[NSArray arrayWithObjects:
          [self barButtonSystemItem:UIBarButtonSystemItemDone],
          [self barButtonSystemItem:UIBarButtonSystemItemCancel],
          [self barButtonSystemItem:UIBarButtonSystemItemEdit],
          [self barButtonSystemItem:UIBarButtonSystemItemSave],
          [self barButtonSystemItem:UIBarButtonSystemItemAdd],
          [self barButtonSystemItem:UIBarButtonSystemItemCompose],
          [self barButtonSystemItem:UIBarButtonSystemItemReply],
          [self barButtonSystemItem:UIBarButtonSystemItemAction],
          [self barButtonSystemItem:UIBarButtonSystemItemOrganize],
          [self barButtonSystemItem:UIBarButtonSystemItemBookmarks],
          [self barButtonSystemItem:UIBarButtonSystemItemSearch],
          [self barButtonSystemItem:UIBarButtonSystemItemRefresh],
          [self barButtonSystemItem:UIBarButtonSystemItemStop],
          [self barButtonSystemItem:UIBarButtonSystemItemCamera],
          [self barButtonSystemItem:UIBarButtonSystemItemTrash],
          [self barButtonSystemItem:UIBarButtonSystemItemPlay],
          [self barButtonSystemItem:UIBarButtonSystemItemPause],
          [self barButtonSystemItem:UIBarButtonSystemItemRewind],
          [self barButtonSystemItem:UIBarButtonSystemItemFastForward],
          [self barButtonSystemItem:UIBarButtonSystemItemUndo],
          [self barButtonSystemItem:UIBarButtonSystemItemRedo],
          nil]];

  // ラベルを追加
  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.numberOfLines = 3;
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"画面をタップすると、ツールバーのボタンが左にシフトしていきます。";
  [self.view addSubview:label];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  // シフト後のツールバーボタン群を入れる配列を用意
  NSMutableArray* newItems =
    [[[NSMutableArray alloc] initWithCapacity:self.toolbarItems.count] autorelease];
  // まず、左から２番目以降のボタンを抽出して追加
  NSRange range = NSMakeRange( 1, self.toolbarItems.count - 1 );
  [newItems addObjectsFromArray:[self.toolbarItems subarrayWithRange:range]];
  // 次に、左端のボタンを最後に追加
  [newItems addObject:[self.toolbarItems objectAtIndex:0]];
  // 順番をシフトしたツールバーボタン群をツールバーに設定
  [self setToolbarItems:newItems animated:YES];
}

#pragma mark ----- Private Methods -----

- (UIBarButtonItem*)barButtonSystemItem:(UIBarButtonSystemItem)systemItem {
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem
                                                   target:nil
                                                   action:nil] autorelease];
  return button;
}

@end
