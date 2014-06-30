//
//  PossessionStore.m
//  Homepwner
//
//  Created by peter mac on 14-6-5.
//  Copyright (c) 2014年 peter mac. All rights reserved.
//

#import "Possession.h"
#import "PossessionStore.h"

static PossessionStore *defaultStore = nil;

@implementation PossessionStore

+ (PossessionStore *)defaultStore
{
    if ( !defaultStore ){
        defaultStore = [[super allocWithZone:NULL] init];
    }
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init
{
    if ( defaultStore ){
        return defaultStore;
    }
    
    self = [super init];
    
    if ( self ) {
        allPossessions = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allPossessions
{
    return allPossessions;
}

- (Possession *)createPossession
{
    Possession *p = [Possession randomPossession];
    [allPossessions addObject:p];
    
    return p;
}

-(void)removePossession:(Possession *)p
{
    [allPossessions removeObjectIdenticalTo:p];
}

-(void)movePossessionAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }
    
    Possession *p = [allPossessions objectAtIndex:from];
    
    [allPossessions removeObjectAtIndex:from];
    [allPossessions insertObject:p atIndex:to];
    
}

@end
