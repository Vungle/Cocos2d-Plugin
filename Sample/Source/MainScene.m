#import "MainScene.h"
#import <VungleSDK/VungleSDK.h>

@implementation MainScene

- (void)didLoadFromCCB{
	rootview = [CCDirector sharedDirector].view.window.rootViewController;
    
    // get sdk instance
	VungleSDK* sdk = [VungleSDK sharedSDK];
    
    // set delegate to listen for events
	[sdk setDelegate: self];
    
    // initial check of ad availability
	[self setButtonsState:[[VungleSDK sharedSDK] isAdPlayable]];
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
- (void)vungleSDKAdPlayableChanged:(BOOL)isAdPlayable {
	[self setButtonsState:isAdPlayable];
}

@end
