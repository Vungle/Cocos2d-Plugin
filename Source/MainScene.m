#import "MainScene.h"
#import <VungleSDK/VungleSDK.h>

@implementation MainScene

- (void)didLoadFromCCB{
	rootview = [CCDirector sharedDirector].view.window.rootViewController;
	VungleSDK* sdk = [VungleSDK sharedSDK];
	[sdk setDelegate: self];
	[self setButtonsState:[[VungleSDK sharedSDK] isCachedAdAvailable]];
}

- (void)setButtonsState:(BOOL)state{
	[_playCustomAdButton setEnabled:state];
	[_playDefaultAdButton setEnabled:state];
	[_playIncentivizedAdButton setEnabled:state];
}

- (void)playDefault{
	[[VungleSDK sharedSDK] playAd:rootview error:nil];
}
- (void)playCustom{
	[[VungleSDK sharedSDK] playAd:rootview withOptions:@{VunglePlayAdOptionKeyLargeButtons: @"1"} error:nil];
}
- (void)playIncentivized{
	[[VungleSDK sharedSDK] playAd:rootview withOptions:@{VunglePlayAdOptionKeyIncentivized: @"1"} error:nil];
}

- (void)vungleSDKwillShowAd {
	[self setButtonsState:NO];
}
- (void)vungleSDKhasCachedAdAvailable {
	[self setButtonsState:YES];
}

@end
