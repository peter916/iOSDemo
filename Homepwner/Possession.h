//
//  Possession.h
//  Homepwner
//
//  Created by peter mac on 14-6-5.
//  Copyright (c) 2014年 peter mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSObject
{
    NSString *possessionName;
    NSString *serialNumber;
    int      valueInDollars;
    NSDate   *dateCreated;
}
- (void)setPossessionName:(NSString *)str;
- (NSString *)possessionName;

- (void)setSerialNumber:(NSString *) str;
- (NSString *)serialNumber;

- (void)setValueInDollars : (int) i;
- (int)valueInDollars;


- (NSDate *)dateCreated;

+ (id)randomPossession;
- (id)initWithPossessionName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *) sNumber;

- (id)init;

@end
