//
//  MainDictionary.m
//  SkyAlch
//
//  Created by Arthur Mayes on 4/6/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "MainDictionary.h"

static MainDictionary *sharedDictionary;

@interface MainDictionary()
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, strong) NSArray *ingredients;
@property (nonatomic, strong) NSArray *potions;
@property (nonatomic, strong) NSMutableArray *potionsWithoutPoisons;
@property (nonatomic, strong) NSMutableArray *poisonsWithoutPotions;
@property (nonatomic, strong) NSMutableArray *potionsWithoutPoisonsOrMagicka;
@end

@implementation MainDictionary

-(NSMutableArray *)potionsWithoutPoisons
{
    if (!_potionsWithoutPoisons) _potionsWithoutPoisons = [NSMutableArray new];
    return _potionsWithoutPoisons;
}
-(NSMutableArray *)poisonsWithoutPotions
{
    if (!_poisonsWithoutPotions) _poisonsWithoutPotions = [NSMutableArray new];
    return _poisonsWithoutPotions;
}
-(NSMutableArray *)potionsWithoutPoisonsOrMagicka
{
    if (!_potionsWithoutPoisonsOrMagicka) _potionsWithoutPoisonsOrMagicka = [NSMutableArray new];
    return _potionsWithoutPoisonsOrMagicka;
}

-(BOOL)isPoison:(NSString *)candidate
{
    NSString *string = [candidate substringToIndex:4];
    BOOL poison = NO;
    if ([string isEqualToString:@"Pois"] || [string isEqualToString:@"Dama"] || [string isEqualToString:@"Fear"] || [string isEqualToString:@"Fren"] || [string isEqualToString:@"Ling"] || [string isEqualToString:@"Para"] || [string isEqualToString:@"Rava"] || [string isEqualToString:@"Slow"] || [string isEqualToString:@"Weak"]) poison = YES;
    return poison;
}
-(void)checkForPotionsWithoutPoisonsOrMagicka:string
{
    // Rethink this
    BOOL isExcluded = NO;
    NSArray *array = [string componentsSeparatedByString:@" "];
    for (NSString *newString in array) {
        NSLog(@"%@", newString);
        if ([newString isEqualToString:@"Magicka"]) {
            isExcluded = YES;
        }
    }
    if (!isExcluded) {
        [self.potionsWithoutPoisonsOrMagicka addObject:string];
        NSLog(@"%@", string);
    }
}

-(id)init{
	if (self = [super init]){
        NSError *error;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
        NSString *documentsDirectory = [paths objectAtIndex:0]; //2
        self.path = [documentsDirectory stringByAppendingPathComponent:@"items.plist"]; //3
        
        
        if (![fileManager fileExistsAtPath: self.path]) //4
        {
            NSString *bundle = [[NSBundle mainBundle] pathForResource:@"items" ofType:@"plist"]; //5
            
            [fileManager copyItemAtPath:bundle toPath: self.path error:&error]; //6
        }
        self.dictionary = [[NSDictionary alloc] initWithContentsOfFile: self.path];
        self.ingredients = [self.dictionary objectForKey:@"Ingredients"];
        self.potions = [self.dictionary objectForKey:@"Potions"];
        
        for (NSString *string in self.potions) {
            if (![self isPoison:string]) {
                [self.potionsWithoutPoisons addObject:string];
                [self checkForPotionsWithoutPoisonsOrMagicka:string];
            }
            else {
                [self.poisonsWithoutPotions addObject:string];
            }
        }
    }
    return self;
}

+(MainDictionary *)sharedDictionary{
    if (!sharedDictionary) sharedDictionary = [[MainDictionary alloc] init];
	return sharedDictionary;
}

-(NSArray *)getArrayForKey:(NSString *)string{
    return [self.dictionary objectForKey:string];
}

-(NSArray *)getIngredients{
    return self.ingredients;
}

-(NSString *)getIngredient:(int)num{
    return [self.ingredients objectAtIndex:num];
}
-(int)getIngredientsCount{
    return self.ingredients.count;
}
-(NSArray *)getPotions{
    return self.potions;
}
-(int)getPotionsCount{
    return [self.potions count];
}
-(int)getPotionsWithoutPoisonsCount
{
    return [self.potionsWithoutPoisons count];
}
-(NSMutableArray *)getPotionsWithoutPoisons
{
    return self.potionsWithoutPoisons;
}
-(NSMutableArray *)getPoisonsWithoutPotions
{
    return self.poisonsWithoutPotions;
}
-(int)getPoisonsWithoutPotionsCount
{
    return [self.poisonsWithoutPotions count];
}
-(NSMutableArray *)getPotionsWithoutPoisonsOrMagicka
{
    return self.potionsWithoutPoisonsOrMagicka;
}
-(NSString *)getPotion:(int)i{
    return [self.potions objectAtIndex:i];
}
-(NSMutableArray *)getCompatibleIngredientsForIngredient:(NSString *)ing{
    
        NSArray *array = [self.dictionary objectForKey:ing];
        NSMutableArray *newArray = [NSMutableArray new];
        for (NSString *string in array) [newArray addObjectsFromArray:(NSArray *)[self getIngredientsForPotion:string]];
        for (int i = 0; i < newArray.count; ++i) {
            NSString *string = [newArray objectAtIndex:i];
            if ([string isEqualToString:ing]) {
                [newArray removeObjectAtIndex:i];
                i--;
            } else{
                // remove multiples
                for (int j = i+1; j < newArray.count; ++j) {
                    if ([string isEqualToString:[newArray objectAtIndex:j]]) [newArray removeObjectAtIndex:j];
                } 
            }
        }
        array = nil;
        return newArray;
    
}
-(NSMutableArray *)getIngredientsForPotion:(NSString *)string{
    
        NSMutableArray *newArray = [[NSMutableArray alloc] init];
        for (int j = 0; j < [self.ingredients count]; ++j) {
            NSArray *array = [self.dictionary objectForKey:[self.ingredients objectAtIndex:j]];
            for (NSString *newString in array) {
                if ([newString isEqualToString:string]) [newArray addObject:[self.ingredients objectAtIndex:j]];
            }
            array = nil;
        }
        return newArray;
}

@end
