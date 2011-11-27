//
//  PGNetworkInformation.h
//  
//
//  Created by Jens Horch on 25.11.11.
//  Copyright (c) 2011 Jens Horch
//

#import <Foundation/Foundation.h>
#import <PhoneGap/PGPlugin.h>

@interface PGNetworkInformation : PGPlugin{
    NSString *callbackId;
}

@property (nonatomic, copy) NSString* callbackId;

-(void)getSSID:(NSMutableArray*)arguments withDict:(NSMutableDictionary*) options;

@end
