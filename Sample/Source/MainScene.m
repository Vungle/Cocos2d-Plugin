#import "MainScene.h"

// Include VungleSDK header file
#import <VungleSDK/VungleSDK.h>

@implementation MainScene

- (void)didLoadFromCCB{
	rootview = [CCDirector sharedDirector].view.window.rootViewController;
    
    // get sdk instance
	VungleSDK* sdk = [VungleSDK sharedSDK];
    
    // set delegate to listen for events
	[sdk setDelegate: self];
    
    // initial check of ad availability
    // later we'll listen for vungleSDKAdPlayableChange to be
    // notified for ad availability
    //
    // if ad is already available event will not be triggered
    // so we checking it explicetly
	[self setButtonsState:[[VungleSDK sharedSDK] isAdPlayable]];
}

- (void)setButtonsState:(BOOL)state{
	[_playCustomAdButton setEnabled:state];
	[_playDefaultAdButton setEnabled:state];
	[_playIncentivizedAdButton setEnabled:state];
}

- (void)playDefault{
    // play ad with default options
	[[VungleSDK sharedSDK] playAd:rootview error:nil];
}
- (void)playCustom{
    // play ad with larged buttons
	[[VungleSDK sharedSDK] playAd:rootview withOptions:@{VunglePlayAdOptionKeyLargeButtons: @"1"} error:nil];
}
- (void)playIncentivized{
    // play ad in incetiviced mode
	[[VungleSDK sharedSDK] playAd:rootview withOptions:@{VunglePlayAdOptionKeyIncentivized: @"1"} error:nil];
}

- (void)vungleSDKwillShowAd {
    // disable button when ad begun
	[self setButtonsState:NO];
}
- (void)vungleSDKAdPlayableChanged:(BOOL)isAdPlayable {
    // adjust buttons state based on ad availability
	[self setButtonsState:isAdPlayable];
}

@end
