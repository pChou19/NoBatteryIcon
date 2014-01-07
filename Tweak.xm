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
	// TODO Refresh status bar once device is plugged in/out
	%orig;
}
%end
