//
//  SampleForImagePicker.m
//
//  Created by ToKoRo on 2009-10-11.
//

#import "SampleForImagePicker.h"

@implementation SampleForImagePicker

- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                   target:self
                                                   action:@selector(barButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton] animated:NO];

  imageView_ = [[UIImageView alloc] init];
  imageView_.frame = self.view.bounds;
  imageView_.contentMode = UIViewContentModeScaleAspectFit;
  imageView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:imageView_];
}

- (void)barButtonDidPush {
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"PhotoLibrary"];
  [sheet addButtonWithTitle:@"Camera"];
  [sheet addButtonWithTitle:@"SavedPhotosAlbum"];
  [sheet addButtonWithTitle:@"キャンセル"];
  sheet.cancelButtonIndex = 3;
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
      picker.allowsEditing = YES;
      [self presentModalViewController:picker animated:YES];
    } else {
      NSLog( @"%d is not available.", sourceType );
    }
  }
}

//UIKIT_EXTERN NSString *const UIImagePickerControllerMediaType;      // an NSString (UTI, i.e. kUTTypeImage)
//UIKIT_EXTERN NSString *const UIImagePickerControllerOriginalImage;  // a UIImage
//UIKIT_EXTERN NSString *const UIImagePickerControllerEditedImage;    // a UIImage
//UIKIT_EXTERN NSString *const UIImagePickerControllerCropRect;       // an NSValue (CGRect)
//UIKIT_EXTERN NSString *const UIImagePickerControllerMediaURL;       // an NSURL

- (void)imagePickerController:(UIImagePickerController*)picker
  didFinishPickingMediaWithInfo:(NSDictionary*)info
{
  // 選択（or 撮影）した写真を取得
  UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
  if ( !image ) {
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
  } 
  imageView_.image = image;
  // フォトライブラリに保存する場合は以下のとおり
  UIImageWriteToSavedPhotosAlbum( image,
                                  self, 
                                  @selector(image:didFinishSavingWithError:contextInfo:),
                                  NULL );

  [self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker {
  [self dismissModalViewControllerAnimated:YES];
}

- (void)image:(UIImage*)image
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
