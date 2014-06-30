//
//  PossessionStore.h
//  Homepwner
//
//  Created by peter mac on 14-6-5.
//  Copyright (c) 2014年 peter mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Possession;

@interface PossessionStore : NSObject
{
    NSMutableArray *allPossessions;
}

+ (PossessionStore *)defaultStore;
- (NSArray *)allPossessions;
- (Possession *)createPossession;
- (void)removePossession:(Possession *)p;
- (void)movePossessionAtIndex:(int)from toIndex:(int)to;


@end
