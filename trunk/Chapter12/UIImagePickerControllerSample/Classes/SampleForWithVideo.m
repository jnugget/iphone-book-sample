//
//  SampleForWithVideo.m
//
//  Created by ToKoRo on 2009-10-11.
//

#import "SampleForWithVideo.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation SampleForWithVideo

- (void)viewDidLoad {
  [super viewDidLoad];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                   target:self
                                                   action:@selector(barButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton] animated:NO];
}

- (void)barButtonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"PhotoLibrary"];
  [sheet addButtonWithTitle:@"Video"];
  [sheet addButtonWithTitle:@"キャンセル"];
  sheet.cancelButtonIndex = 2;
  [sheet showFromToolbar:self.navigationController.toolbar];
}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
  } else {
    UIImagePickerControllerSourceType sourceType = buttonIndex;
    if ( [UIImagePickerController isSourceTypeAvailable:sourceType] ) {

      UIImagePickerController* picker = [[[UIImagePickerController alloc] init] autorelease];
      picker.delegate = self;
      picker.sourceType = sourceType;
      picker.videoQuality = UIImagePickerControllerQualityTypeLow;
      picker.videoMaximumDuration = 10;

      NSArray* mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
      if ( [mediaTypes containsObject:(NSString*)kUTTypeMovie] ) {
        picker.mediaTypes = [NSArray arrayWithObject:(NSString*)kUTTypeMovie];
      } else {
        NSLog( @"%@ is not available.", kUTTypeMovie );
      }
      [self presentModalViewController:picker animated:YES];
    } else {
      NSLog( @"%d is not available.", sourceType );
    }
  }
}

- (void)imagePickerController:(UIImagePickerController*)picker
  didFinishPickingMediaWithInfo:(NSDictionary*)info
{
  // 選択したのがビデオであることを判断
  NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];
  if ( [mediaType isEqualToString:(NSString*)kUTTypeMovie] ) {
    NSURL* mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
    NSString* mediaPath = [mediaURL path];
    if ( UIVideoAtPathIsCompatibleWithSavedPhotosAlbum( mediaPath ) ) {
      UISaveVideoAtPathToSavedPhotosAlbum( mediaPath,
                                           self,
                                           @selector(video:didFinishSavingWithError:contextInfo:),
                                           NULL );
    } else {
      NSLog( @"写真アルバムに保存できない場合の処理" );
    }
  } else {
    NSLog( @"ビデオでないときの処理" );
  }
  [self dismissModalViewControllerAnimated:YES];
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
