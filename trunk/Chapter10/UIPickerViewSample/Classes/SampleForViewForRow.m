//
//  SampleForViewForRow.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForViewForRow.h"

@implementation SampleForViewForRow

- (void)dealloc {
  [dataSource_ release];
  [picker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  picker_ = [[UIPickerView alloc] init];
  picker_.delegate = self;
  picker_.showsSelectionIndicator = YES;
  [self.view addSubview:picker_];

  UIImage* imageDog = [UIImage imageNamed:@"Dog.png"];
  UIImage* imageMonkey = [UIImage imageNamed:@"Monkey.png"];
  UIImage* imageElephant = [UIImage imageNamed:@"Elephant.png"];
  UIImage* imageLion = [UIImage imageNamed:@"Lion.png"];
  NSArray* components1 =
    [NSArray arrayWithObjects:imageDog, imageMonkey, imageElephant, imageLion, nil];
  NSArray* components2 =
    [NSArray arrayWithObjects:imageDog, imageMonkey, imageElephant, imageLion, nil];
  NSArray* components3 =
    [NSArray arrayWithObjects:imageDog, imageMonkey, imageElephant, imageLion, nil];
  dataSource_ = [[NSArray alloc] initWithObjects:components1, components2, components3, nil];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"情報表示" forState:UIControlStateNormal];
  [button sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 50;
  button.center = newPoint;
  [button addTarget:self
             action:@selector(buttonDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 3;
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 4;
}

- (UIView*)pickerView:(UIPickerView*)pickerView
  viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView*)view
{
  UIImageView* imageView = (UIImageView*)view;
  if ( !imageView ) {
    UIImage* image = [[dataSource_ objectAtIndex:component] objectAtIndex:row];
    imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  }
  return imageView;
}

- (void)buttonDidPush {
  static const int kNumbersOfComponent = 3;
  NSMutableArray* items = [[NSMutableArray alloc] initWithCapacity:3];
  for ( int i = 0; i < kNumbersOfComponent; ++i ){
    UIImageView* imageView =
      (UIImageView*)[picker_ viewForRow:[picker_ selectedRowInComponent:i] forComponent:i];
    UIImageView* newImageView =
      [[[UIImageView alloc] initWithImage:imageView.image] autorelease];
    UIBarButtonItem* barButton =
      [[[UIBarButtonItem alloc] initWithCustomView:newImageView] autorelease];
    [items addObject:barButton];
  }
  [self setToolbarItems:items];
  [items release];
}

@end
