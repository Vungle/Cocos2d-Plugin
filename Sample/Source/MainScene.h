#import <VungleSDK/VungleSDK.h>

@interface MainScene : CCNode <VungleSDKDelegate>{
	CCButton* _playDefaultAdButton;
	CCButton* _playCustomAdButton;
	CCButton* _playIncentivizedAdButton;
	
	UIViewController* rootview;
}

- (void)didLoadFromCCB;

- (void)playDefault;
- (void)playCustom;
- (void)playIncentivized;

- (void)vungleSDKwillShowAd;
- (void)vungleSDKhasCachedAdAvailable;

- (void)setButtonsState:(BOOL)state;
@end
