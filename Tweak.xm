#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

%hook UIStatusBarBatteryItemView
- (id)contentsImage {
	return nil;
}
%end

%hook UIStatusBarBatteryPercentItemView
- (float)extraRightPadding {
	[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
	if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging ||
		[[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateFull) {
	    return 3;
	}
    return %orig;
}
%end

%hook SBUIController
- (void)ACPowerChanged {
	//UIStatusBarBatteryItemView *itemView = MSHookIvar<UIStatusBarBatteryItemView*>(self, "_accessoryView");
	//[itemView _updateAccessoryImage];
	//[[%c(UIStatusBarBatteryItemView) sharedInstance] _updateAccessoryImage];
	%orig;
}
%end
