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
@property (nonatomic, retain) NSString *path;
@property (nonatomic, retain) NSDictionary *dictionary;
@property (nonatomic, retain) NSArray *ingredients;
@property (nonatomic, retain) NSArray *potions;
@end

@implementation MainDictionary

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
    if (!sharedDictionary) {
		sharedDictionary = [[MainDictionary alloc] init];
	}
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
-(NSString *)getPotion:(int)i{
    return [self.potions objectAtIndex:i];
}
-(NSMutableArray *)getCompatibleIngredientsForIngredient:(NSString *)ing{
    
        NSArray *array = [self.dictionary objectForKey:ing];
        NSMutableArray *newArray = [NSMutableArray new];
        for (NSString *string in array) {
            [newArray addObjectsFromArray:(NSArray *)[self getIngredientsForPotion:string]];
        }
        for (int i = 0; i < newArray.count; ++i) {
            NSString *string = [newArray objectAtIndex:i];
            if ([string isEqualToString:ing]) {
                [newArray removeObjectAtIndex:i];
                i--;
            } else{
                // remove multiples
                for (int j = i+1; j < newArray.count; ++j) {
                    if ([string isEqualToString:[newArray objectAtIndex:j]]) {
                        [newArray removeObjectAtIndex:j];
                    }
                } 
            }
        }
        [newArray sortUsingSelector:@selector(compare:)];
        array = nil;
        return newArray;
    
}
-(NSMutableArray *)getIngredientsForPotion:(NSString *)string{
    
        NSMutableArray *newArray = [[NSMutableArray alloc] init];
        for (int j = 0; j < [self.ingredients count]; ++j) {
            NSArray *array = [self.dictionary objectForKey:[self.ingredients objectAtIndex:j]];
            for (NSString *newString in array) {
                if ([newString isEqualToString:string]) {
                    [newArray addObject:[self.ingredients objectAtIndex:j]];
                }
            }
            array = nil;
        }
        return newArray;
    
}

@end
