//
//  SampleForVideoEditor.m
//
//  Created by ToKoRo on 2009-10-12.
//

#import "SampleForVideoEditor.h"

@implementation SampleForVideoEditor

- (void)viewDidLoad {
  [super viewDidLoad];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                   target:self
                                                   action:@selector(barButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton] animated:NO];
}

- (void)barButtonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"VideoEditor"];
  [sheet addButtonWithTitle:@"キャンセル"];
  sheet.cancelButtonIndex = 1;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
  } else {
    UIVideoEditorController* videoEditor = [[[UIVideoEditorController alloc] init] autorelease];
    videoEditor.delegate = self;
    NSString* videoPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"MOV"];
    if ( [UIVideoEditorController canEditVideoAtPath:videoPath] ) {
      videoEditor.videoPath = videoPath;
      [self presentModalViewController:videoEditor animated:YES];
    } else {
      NSLog( @"can't edit video at %@", videoPath );
    }
  }
}

- (void)videoEditorControllerDidCancel:(UIVideoEditorController*)editor {
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)videoEditorController:(UIVideoEditorController*)editor
  didSaveEditedVideoToPath:(NSString*)editedVideoPath
{
  // 写真アルバムに保存
  if ( UIVideoAtPathIsCompatibleWithSavedPhotosAlbum( editedVideoPath ) ) {
    UISaveVideoAtPathToSavedPhotosAlbum( editedVideoPath,
                                         self,
                                         @selector(video:didFinishSavingWithError:contextInfo:),
                                         NULL );
  } else {
    NSLog( @"写真アルバムに保存できない場合の処理" );
  }
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)videoEditorController:(UIVideoEditorController*)editor didFailWithError:(NSError*)error {
  NSLog( @"%X", error );
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)video:(NSString*)videoPath
  didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
  if ( error ) {
    // errorがnilでない場合保存失敗
    NSLog( [error localizedDescription] );
  } else {
    // nilなら保存成功
  }
}

@end
