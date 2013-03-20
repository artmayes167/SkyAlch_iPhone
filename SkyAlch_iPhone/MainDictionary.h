//
//  MainDictionary.h
//  SkyAlch
//
//  Created by Arthur Mayes on 4/6/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainDictionary : NSObject

+(MainDictionary *)sharedDictionary;
-(NSArray *)getArrayForKey:(NSString *)string;
-(NSArray *)getIngredients;
-(NSString *)getIngredient:(int)num;
-(NSArray *)getPotions;
-(int)getPotionsCount;
-(NSString *)getPotion:(int)i;
-(int)getIngredientsCount;
-(NSMutableArray *)getCompatibleIngredientsForIngredient:(NSString *)ing;
-(NSMutableArray *)getIngredientsForPotion:(NSString *)string;

@end
