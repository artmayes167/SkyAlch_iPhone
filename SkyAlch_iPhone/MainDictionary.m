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
@end

@implementation MainDictionary



-(BOOL)isPoison:(NSString *)candidate
{
    NSString *string = [candidate substringToIndex:4];
    BOOL poison = NO;
    if ([string isEqualToString:@"Dama"] || [string isEqualToString:@"Fear"] || [string isEqualToString:@"Fren"] || [string isEqualToString:@"Ling"] || [string isEqualToString:@"Para"] || [string isEqualToString:@"Rava"] || [string isEqualToString:@"Slow"] || [string isEqualToString:@"Weak"]) poison = YES;
    return poison;
}


-(BOOL)isMagicka:(NSString *)string
{
    if ([string isEqualToString:@"Fortify Magicka"] || [string isEqualToString:@"Regenerate Magicka"] || [string isEqualToString:@"Restore Magicka"] || [string isEqualToString:@"Weakness to Fire"] || [string isEqualToString:@"Weakness to Frost"] || [string isEqualToString:@"Weakness to Magic"] || [string isEqualToString:@"Weakness to Shock"]) {
        return YES;
    }
    NSArray *array = [string componentsSeparatedByString:@" "];
    for (NSString *newString in array) {
        if ([newString isEqualToString:@"Alteration"] || [newString isEqualToString:@"Conjuration"] || [newString isEqualToString:@"Destruction"] || [newString isEqualToString:@"Illusion"] || [newString isEqualToString:@"Restoration"]) {
            return YES;
        }
    }
    return NO;
}

-(BOOL)isMelee:(NSString *)string
{
    NSArray *array = [string componentsSeparatedByString:@" "];
    for (NSString *newString in array) {
        if ([newString isEqualToString:@"Armor"] || [newString isEqualToString:@"Marksman"] || [newString isEqualToString:@"One-Handed"] || [newString isEqualToString:@"Two-handed"] || [newString isEqualToString:@"Block"]) {
            return YES;
        }
    }
    return NO;
}
-(BOOL)isStealth:(NSString *)string
{
    NSArray *array = [string componentsSeparatedByString:@" "];
    for (NSString *newString in array) {
        if ([newString isEqualToString:@"Pickpocket"] || [newString isEqualToString:@"Sneak"] || [newString isEqualToString:@"Lockpicking"]) {
            return YES;
        }
    }
    return NO;
}
-(BOOL)isMiscellany:(NSString *)string
{
    NSArray *array = [string componentsSeparatedByString:@" "];
    for (NSString *newString in array) {
        if ([newString isEqualToString:@"Cure"] || [newString isEqualToString:@"Barter"] || [newString isEqualToString:@"Carry"] || [newString isEqualToString:@"Smithing"] || [newString isEqualToString:@"Invisibility"] || [newString isEqualToString:@"Paralysis"] || [newString isEqualToString:@"Slow"] || [newString isEqualToString:@"Waterbreathing"] || [newString isEqualToString:@"Fear"] || [newString isEqualToString:@"Frenzy"]) {
            return YES;
        }
    }
    return NO;
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
    }
    return self;
}

+(MainDictionary *)sharedDictionary{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDictionary = [[MainDictionary alloc] init];
    });
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
#define POISONS_DEFAULT_KEY @"poisons"
#define POTIONS_DEFAULT_KEY @"potions"
#define MAGICKA_DEFAULT_KEY @"magicka"
#define MELEE_DEFAULT_KEY @"melee"
#define STEALTH_DEFAULT_KEY @"stealth"
#define MISCELLANY_DEFAULT_KEY @"miscellany"

-(NSArray *)getPotions{
    // implement logic here
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     NSMutableArray *currentPotions = [NSMutableArray arrayWithArray:self.potions];
    for (NSString *string in self.potions) {
        if (![defaults boolForKey:POISONS_DEFAULT_KEY]) {
            if ([self isPoison:string]) {
                [currentPotions removeObject:string];
            }
        } else if (![defaults boolForKey:POTIONS_DEFAULT_KEY]) {
            if (![self isPoison:string]) {
                [currentPotions removeObject:string];
            }
        }
        if (![defaults boolForKey:MAGICKA_DEFAULT_KEY]) {
            if ([self isMagicka:string]) {
                [currentPotions removeObject:string];
            }
        }
        if (![defaults boolForKey:MELEE_DEFAULT_KEY]) {
            if ([self isMelee:string]) {
                [currentPotions removeObject:string];
            }
        }
        if (![defaults boolForKey:STEALTH_DEFAULT_KEY]) {
            if ([self isStealth:string]) {
                [currentPotions removeObject:string];
            }
        }
        if (![defaults boolForKey:MISCELLANY_DEFAULT_KEY]) {
            if ([self isMiscellany:string]) {
                [currentPotions removeObject:string];
            }
        }
    }
    return currentPotions;
}
-(int)getPotionsCount{
    return [self.potions count];
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
