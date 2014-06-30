//
//  Possession.m
//  Homepwner
//
//  Created by peter mac on 14-6-5.
//  Copyright (c) 2014年 peter mac. All rights reserved.
//

#import "Possession.h"

@implementation Possession

- (void) setPossessionName:(NSString *) str
{
    possessionName = str;
}

- (NSString *)possessionName
{
    return possessionName;
}

- (void) setSerialNumber : (NSString *) str
{
    serialNumber = str;
}

- (NSString *) serialNumber
{
    return serialNumber;
}

- (void) setValueInDollars:(int) i
{
    valueInDollars = i;
}

- (int) valueInDollars
{
    return valueInDollars;
}

- (NSDate *) dateCreated
{
    return dateCreated;
}

- (id)init
{
    return [self initWithPossessionName:@"Possession" valueInDollars:0 serialNumber:@""];
}

- (id)initWithPossessionName:(NSString *)name
              valueInDollars:(int)value
                serialNumber:(NSString *) sNumber
{
    self = [super init];
    
    if ( self ){
        [self setPossessionName:name];
        [self setSerialNumber:sNumber];
        [self setValueInDollars:value];
        dateCreated = [[NSDate alloc] init];
        
    }
    
    return self;
}

+ (id)randomPossession
{
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                    @"Rusty",@"Shiny", nil];
    
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear",@"Spork",@"Mac", nil];
    
    int adjectiveIndex = rand()%[randomAdjectiveList count];
    int nounIndex = rand() % [randomNounList count];
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = rand() % 100;
    
    NSString * randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                     '0'+ rand() % 10,
                                     'A'+ rand() % 26,
                                     '0'+ rand() % 10,
                                     'A'+ rand() % 26,
                                     '0'+ rand() % 10];
    
    Possession * newPossession = [[self alloc] initWithPossessionName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newPossession;
}

-(NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d,recorded on %@",possessionName,
     serialNumber,valueInDollars,dateCreated];
    
    return descriptionString;
}

@end
