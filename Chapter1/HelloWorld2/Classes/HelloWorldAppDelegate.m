//
//  HelloWorldAppDelegate.m
//  HelloWorld
//
//  Created by user00 on 8/1/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "HelloWorldAppDelegate.h"

@implementation HelloWorldAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// windowを自分で作成
	CGRect bounds = [[UIScreen mainScreen] bounds];
	window = [[UIWindow alloc] initWithFrame:bounds];
	
	// アプリのウィンドウと同じ大きさの四角形を取得
	CGRect rect = [window frame];	
	// UILabelのインスタンスを作り、初期化する
	// 先ほど取得した四角形と同じ位置で同じ大きさのUILabelが出来る
	UILabel* label = [[UILabel alloc] initWithFrame:rect];
	// UILabelに表示するメッセージは、もちろん「Hello, world!」
	label.text = @"Hello, world!";
	// 作ったUILabelをwindowに加えよう
	[window addSubview:label];
	// 最後にreleaseも忘れずに！
	[label release];
	

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
