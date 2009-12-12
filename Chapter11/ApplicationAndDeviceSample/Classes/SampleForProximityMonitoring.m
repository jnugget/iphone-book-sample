//
//  SampleForProximityMonitoring.m
//
//  Created by ToKoRo on 2009-09-24.
//

#import "SampleForProximityMonitoring.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForProximityMonitoring ()
- (void)onDidPush;
- (void)offDidPush;
- (void)proximityStateDidChange;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForProximityMonitoring

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.textAlignment = UITextAlignmentCenter;
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:label_];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self onDidPush];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(proximityStateDidChange)
                                               name:UIDeviceProximityStateDidChangeNotification
                                             object:nil];
}

#pragma mark ----- Private Methods -----

- (void)onDidPush {
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"近接OFF"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(offDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
  // 近接センサーOFF
  [UIDevice currentDevice].proximityMonitoringEnabled = NO;
  label_.text = @"";
}

- (void)offDidPush {
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"近接ON"
                                      style:UIBarButtonItemStyleDone
                                     target:self
                                     action:@selector(onDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
  // 近接センサーON
  [UIDevice currentDevice].proximityMonitoringEnabled = YES;
}

- (void)proximityStateDidChange {
  if ( [UIDevice currentDevice].proximityState ) {
    label_.text = @"今、なんか暗くなったよー";
  } 
}

@end
