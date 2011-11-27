//
//  PGNetworkInformation.m
//
//  Created by Jens Horch on 25.11.11.
//  Copyright (c) 2011 Jens Horch
//
#import <SystemConfiguration/CaptiveNetwork.h>
#import "PGNetworkInformation.h"

@implementation PGNetworkInformation

@synthesize callbackId;

//the method returns the name of the first ssid i´m currently connected to
-(void)getSSID:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options{
    
    self.callbackId = [arguments pop];
    
    NSArray *networkArray = (NSArray *)CNCopySupportedInterfaces();
    NSString *ssid;
    for (NSString *network in networkArray)
    {
        NSDictionary *infoDict = (NSDictionary *)CNCopyCurrentNetworkInfo((CFStringRef)network);
        
        ssid = [infoDict valueForKey:(NSString *)kCNNetworkInfoKeySSID];
        if (ssid)
            break;
        
        [infoDict release];
    }
    [networkArray release];
    
    PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK messageAsString:[ssid stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [self writeJavascript:[pluginResult toSuccessCallbackString:self.callbackId]];

}

@end
