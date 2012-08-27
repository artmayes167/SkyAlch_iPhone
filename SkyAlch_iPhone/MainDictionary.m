//
//  MainDictionary.m
//  SkyAlch
//
//  Created by Arthur Mayes on 4/6/12.
//  Copyright (c) 2012 Arthur Mayes. All rights reserved.
//

#import "MainDictionary.h"

static MainDictionary *sharedDictionary;

@implementation MainDictionary

-(id)init{
	self = [super init];
    dictionary = [[NSMutableDictionary alloc] init];
    ingredients = [[NSArray alloc] initWithObjects:@"Abecean Longfin", @"Bear Claws", @"Bee", @"Beehive Husk", @"Berit's Ashes", @"Blisterwort", @"Bleeding Crown", @"Blue Butterfly Wing", @"Blue Dartwing", @"Blue Mountain Flower", @"Bone Meal", @"Briar Heart", @"Butterfly Wing", @"Canis Root", @"Charred Skeever Hide", @"Chaurus Eggs", @"Chaurus Hunter Antennae", @"Chicken's Egg", @"Creep Cluster", @"Crimson Nirnroot", @"Cyrodilic Spadetail", @"Daedra Heart", @"Deathbell", @"Dragon's Tongue", @"Dwarven Oil", @"Ectoplasm", @"Elves Ear", @"Eye of Sabre Cat", @"Falmer Ear", @"Fire Salts", @"Fly Amanita", @"Frost Mirriam", @"Frost Salts", @"Garlic", @"Giant Lichen", @"Giant's Toe", @"Gleamblossom", @"Glow Dust", @"Glowing Mushroom", @"Grass Pod", @"Hagraven Claw", @"Hagraven Feathers", @"Hanging Moss", @"Hawk Beak", @"Hawk Feathers", @"Histcarp", @"Honeycomb", @"Human Flesh", @"Human Heart", @"Ice Wraith Teeth", @"Imp Stool", @"Jarrin Root", @"Jazbay Grapes", @"Juniper Berries", @"Large Antlers", @"Lavender", @"Luna Moth Wing", @"Moon Sugar", @"Mora Tapinella", @"Mudcrab Chitin", @"Namira's Rot", @"Nightshade", @"Nirnroot", @"Nordic Barnacle", @"Orange Dartwing", @"Pearl", @"Pine Thrush Egg", @"Poison Bloom", @"Powdered Mammoth Tusk", @"Purple Mountain Flower", @"Red Mountain Flower", @"River Betty", @"Rock Warbler Egg", @"Sabre Cat Tooth", @"Salt Pile", @"Scaly Pholiata", @"Silverside Perch", @"Skeever Tail", @"Slaughterfish Egg", @"Slaughterfish Scales", @"Small Antlers", @"Small Pearl", @"Snowberries", @"Spider Egg", @"Spriggan Sap", @"Swamp Fungal Pod", @"Taproot", @"Thistle Branch", @"Torchbug Thorax", @"Troll Fat", @"Tundra Cotton", @"Vampire Dust", @"Void Salts", @"Wheat", @"White Cap", @"Wisp Wrappings", @"Yellow Mountain Flower", nil];
    potions = [[NSArray alloc] initWithObjects:@"Cure Disease", @"Damage Health", @"Damage Magicka", @"Damage Magicka Regen", @"Damage Stamina", @"Damage Stamina Regen", @"Fear", @"Fortify Alteration", @"Fortify Barter", @"Fortify Block", @"Fortify Carry Weight", @"Fortify Conjuration", @"Fortify Destruction", @"Fortify Enchanting", @"Fortify Health", @"Fortify Heavy Armor", @"Fortify Illusion", @"Fortify Light Armor", @"Fortify Lockpicking", @"Fortify Magicka", @"Fortify Marksman", @"Fortify One-Handed", @"Fortify Pickpocket", @"Fortify Restoration", @"Fortify Smithing", @"Fortify Sneak", @"Fortify Stamina", @"Fortify Two-handed", @"Frenzy", @"Invisibility", @"Lingering Damage Health", @"Lingering Damage Magicka", @"Lingering Damage Stamina", @"Paralysis", @"Ravage Health", @"Ravage Magicka", @"Ravage Stamina", @"Regenerate Health", @"Regenerate Magicka", @"Regenerate Stamina", @"Resist Fire", @"Resist Frost", @"Resist Magic", @"Resist Poison", @"Resist Shock", @"Restore Health", @"Restore Magicka", @"Restore Stamina", @"Slow", @"Waterbreathing", @"Weakness to Fire", @"Weakness to Frost", @"Weakness to Magic", @"Weakness to Poison", @"Weakness to Shock", nil];
    [self setUpDictionary];
    return self;
}

+(MainDictionary *)sharedDictionary{
    if (!sharedDictionary) {
		sharedDictionary = [[MainDictionary alloc] init];
	}
	return sharedDictionary;
}

-(NSArray *)getArrayForKey:(NSString *)string{
    return [dictionary objectForKey:string];
}

-(void)setUpDictionary{
    @autoreleasepool {
        // Potions for Ingredients
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"Fortify Restoration", @"Fortify Sneak", @"Weakness to Frost", @"Weakness to Poison", nil];
        [dictionary setValue:array forKey:@"Abecean Longfin"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka Regen", @"Fortify Health", @"Fortify One-Handed", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Bear Claws"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Ravage Stamina", @"Regenerate Stamina", @"Restore Stamina", @"Weakness to Shock", nil];
        [dictionary setValue:array forKey:@"Bee"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Destruction", @"Fortify Light Armor", @"Fortify Sneak", @"Resist Poison", nil];
        [dictionary setValue:array forKey:@"Beehive Husk"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina", @"Fortify Conjuration", @"Ravage Stamina", @"Resist Fire", nil];
        [dictionary setValue:array forKey:@"Berit's Ashes"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina", @"Fortify Smithing", @"Frenzy", @"Restore Health", nil];
        [dictionary setValue:array forKey:@"Blisterwort"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Block", @"Resist Magic", @"Weakness to Fire", @"Weakness to Poison", nil];
        [dictionary setValue:array forKey:@"Bleeding Crown"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka Regen", @"Damage Stamina", @"Fortify Conjuration", @"Fortify Enchanting", nil];
        [dictionary setValue:array forKey:@"Blue Butterfly Wing"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fear", @"Fortify Pickpocket", @"Resist Shock", @"Restore Health", nil];
        [dictionary setValue:array forKey:@"Blue Dartwing"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka Regen", @"Fortify Conjuration", @"Fortify Health", @"Restore Health", nil];
        [dictionary setValue:array forKey:@"Blue Mountain Flower"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina", @"Fortify Conjuration", @"Ravage Stamina", @"Resist Fire", nil];
        [dictionary setValue:array forKey:@"Bone Meal"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Block", @"Fortify Magicka", @"Paralysis", @"Restore Magicka", nil];
        [dictionary setValue:array forKey:@"Briar Heart"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka", @"Fortify Barter", @"Lingering Damage Stamina", @"Restore Health", nil];
        [dictionary setValue:array forKey:@"Butterfly Wing"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina", @"Fortify Marksman", @"Fortify One-Handed", @"Paralysis", nil];
        [dictionary setValue:array forKey:@"Canis Root"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Cure Disease", @"Resist Poison", @"Restore Health", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Charred Skeever Hide"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka", @"Fortify Stamina", @"Invisibility", @"Weakness to Poison", nil];
        [dictionary setValue:array forKey:@"Chaurus Eggs"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina", @"Fortify Conjuration", @"Damage Magicka Regen", @"Fortify Enchanting", nil];
        [dictionary setValue:array forKey:@"Chaurus Hunter Antennae"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka Regen", @"Lingering Damage Stamina", @"Resist Magic", @"Waterbreathing", nil];
        [dictionary setValue:array forKey:@"Chicken's Egg"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina Regen", @"Fortify Carry Weight", @"Restore Magicka", @"Weakness to Magic", nil];
        [dictionary setValue:array forKey:@"Creep Cluster"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Damage Stamina", @"Invisibility", @"Resist Magic", nil];
        [dictionary setValue:array forKey:@"Crimson Nirnroot"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina", @"Fear", @"Fortify Restoration", @"Ravage Health", nil];
        [dictionary setValue:array forKey:@"Cyrodilic Spadetail"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka", @"Damage Stamina Regen", @"Fear", @"Restore Health", nil];
        [dictionary setValue:array forKey:@"Daedra Heart"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Ravage Stamina", @"Slow", @"Weakness to Poison", nil];
        [dictionary setValue:array forKey:@"Deathbell"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Barter", @"Fortify Illusion", @"Fortify Two-handed", @"Resist Fire", nil];
        [dictionary setValue:array forKey:@"Dragon's Tongue"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Illusion", @"Regenerate Magicka", @"Restore Magicka", @"Weakness to Magic", nil];
        [dictionary setValue:array forKey:@"Dwarven Oil"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Fortify Destruction", @"Fortify Magicka", @"Restore Magicka", nil];
        [dictionary setValue:array forKey:@"Ectoplasm"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Marksman", @"Resist Fire", @"Restore Magicka", @"Weakness to Frost", nil];
        [dictionary setValue:array forKey:@"Elves Ear"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka", @"Ravage Health", @"Restore Health", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Eye of Sabre Cat"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Fortify Lockpicking", @"Frenzy", @"Resist Poison", nil];
        [dictionary setValue:array forKey:@"Falmer Ear"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Regenerate Magicka", @"Resist Fire", @"Restore Magicka", @"Weakness to Frost", nil];
        [dictionary setValue:array forKey:@"Fire Salts"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Two-handed", @"Frenzy", @"Regenerate Stamina", @"Resist Fire", nil];
        [dictionary setValue:array forKey:@"Fly Amanita"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina Regen", @"Fortify Sneak", @"Ravage Magicka", @"Resist Frost", nil];
        [dictionary setValue:array forKey:@"Frost Mirriam"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Conjuration", @"Resist Frost", @"Restore Magicka", @"Weakness to Fire", nil];
        [dictionary setValue:array forKey:@"Frost Salts"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Stamina", @"Regenerate Health", @"Regenerate Magicka", @"Resist Poison", nil];
        [dictionary setValue:array forKey:@"Garlic"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Ravage Health", @"Restore Magicka", @"Weakness to Poison", @"Weakness to Shock", nil];
        [dictionary setValue:array forKey:@"Giant Lichen"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina", @"Damage Stamina Regen", @"Fortify Carry Weight", @"Fortify Health", nil];
        [dictionary setValue:array forKey:@"Giant's Toe"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Regenerate Health", @"Resist Magic", @"Paralysis", @"Fear", nil];
        [dictionary setValue:array forKey:@"Gleamblossom"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka", @"Damage Magicka Regen", @"Fortify Destruction", @"Resist Shock", nil];
        [dictionary setValue:array forKey:@"Glow Dust"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Destruction", @"Fortify Health", @"Fortify Smithing", @"Resist Shock", nil];
        [dictionary setValue:array forKey:@"Glowing Mushroom"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Alteration", @"Ravage Magicka", @"Resist Poison", @"Restore Magicka", nil];
        [dictionary setValue:array forKey:@"Grass Pod"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Barter", @"Fortify Enchanting", @"Lingering Damage Magicka", @"Resist Magic", nil];
        [dictionary setValue:array forKey:@"Hagraven Claw"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka", @"Fortify Conjuration", @"Frenzy", @"Weakness to Shock", nil];
        [dictionary setValue:array forKey:@"Hagraven Feathers"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka", @"Damage Magicka Regen", @"Fortify Health", @"Fortify One-Handed", nil];
        [dictionary setValue:array forKey:@"Hanging Moss"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Carry Weight", @"Resist Frost", @"Resist Shock", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Hawk Beak"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Cure Disease", @"Fortify Light Armor", @"Fortify One-Handed", @"Fortify Sneak", nil];
        [dictionary setValue:array forKey:@"Hawk Feathers"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina Regen", @"Fortify Magicka", @"Restore Stamina", @"Waterbreathing", nil];
        [dictionary setValue:array forKey:@"Histcarp"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Block", @"Fortify Light Armor", @"Ravage Stamina", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Honeycomb"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Fortify Sneak", @"Paralysis", @"Restore Magicka", nil];
        [dictionary setValue:array forKey:@"Human Flesh"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Damage Magicka", @"Damage Magicka Regen", @"Frenzy", nil];
        [dictionary setValue:array forKey:@"Human Heart"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Heavy Armor", @"Invisibility", @"Weakness to Fire", @"Weakness to Frost", nil];
        [dictionary setValue:array forKey:@"Ice Wraith Teeth"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Lingering Damage Health", @"Paralysis", @"Restore Health", nil];
        [dictionary setValue:array forKey:@"Imp Stool"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Damage Magicka", @"Damage Magicka Regen", @"Damage Stamina", nil];
        [dictionary setValue:array forKey:@"Jarrin Root"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Magicka", @"Ravage Health", @"Regenerate Magicka", @"Weakness to Magic", nil];
        [dictionary setValue:array forKey:@"Jazbay Grapes"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina Regen", @"Fortify Marksman", @"Regenerate Health", @"Weakness to Fire", nil];
        [dictionary setValue:array forKey:@"Juniper Berries"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina Regen", @"Fortify Stamina", @"Restore Stamina", @"Slow", nil];
        [dictionary setValue:array forKey:@"Large Antlers"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Conjuration", @"Fortify Stamina", @"Ravage Magicka", @"Resist Magic", nil];
        [dictionary setValue:array forKey:@"Lavender"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka", @"Fortify Light Armor", @"Invisibility", @"Regenerate Health", nil];
        [dictionary setValue:array forKey:@"Luna Moth Wing"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Regenerate Magicka", @"Resist Frost", @"Restore Magicka", @"Weakness to Fire", nil];
        [dictionary setValue:array forKey:@"Moon Sugar"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Illusion", @"Lingering Damage Health", @"Regenerate Stamina", @"Restore Magicka", nil];
        [dictionary setValue:array forKey:@"Mora Tapinella"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Cure Disease", @"Resist Fire", @"Resist Poison", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Mudcrab Chitin"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka", @"Fear", @"Fortify Lockpicking", @"Regenerate Health", nil];
        [dictionary setValue:array forKey:@"Namira's Rot"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Damage Magicka Regen", @"Fortify Destruction", @"Lingering Damage Stamina", nil];
        [dictionary setValue:array forKey:@"Nightshade"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Damage Stamina", @"Invisibility", @"Resist Magic", nil];
        [dictionary setValue:array forKey:@"Nirnroot"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka", @"Fortify Pickpocket", @"Regenerate Health", @"Waterbreathing", nil];
        [dictionary setValue:array forKey:@"Nordic Barnacle"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Pickpocket", @"Lingering Damage Health", @"Ravage Magicka", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Orange Dartwing"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Block", @"Resist Shock", @"Restore Magicka", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Pearl"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Lockpicking", @"Resist Shock", @"Restore Stamina", @"Weakness to Poison", nil];
        [dictionary setValue:array forKey:@"Pine Thrush Egg"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Fear", @"Fortify Carry Weight", @"Slow", nil];
        [dictionary setValue:array forKey:@"Poison Bloom"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fear", @"Fortify Sneak", @"Restore Stamina", @"Weakness to Fire", nil];
        [dictionary setValue:array forKey:@"Powdered Mammoth Tusk"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Sneak", @"Lingering Damage Magicka", @"Resist Frost", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Purple Mountain Flower"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Fortify Magicka", @"Ravage Magicka", @"Restore Magicka", nil];
        [dictionary setValue:array forKey:@"Red Mountain Flower"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Fortify Alteration", @"Fortify Carry Weight", @"Slow", nil];
        [dictionary setValue:array forKey:@"River Betty"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina", @"Fortify One-Handed", @"Restore Health", @"Weakness to Magic", nil];
        [dictionary setValue:array forKey:@"Rock Warbler Egg"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Heavy Armor", @"Fortify Smithing", @"Restore Stamina", @"Weakness to Poison", nil];
        [dictionary setValue:array forKey:@"Sabre Cat Tooth"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Restoration", @"Regenerate Magicka", @"Slow", @"Weakness to Magic", nil];
        [dictionary setValue:array forKey:@"Salt Pile"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Carry Weight", @"Fortify Illusion", @"Regenerate Stamina", @"Weakness to Magic", nil];
        [dictionary setValue:array forKey:@"Scaly Pholiata"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina Regen", @"Ravage Health", @"Resist Frost", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Silverside Perch"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Damage Stamina Regen", @"Fortify Light Armor", @"Ravage Health", nil];
        [dictionary setValue:array forKey:@"Skeever Tail"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Pickpocket", @"Fortify Stamina", @"Lingering Damage Health", @"Resist Poison", nil];
        [dictionary setValue:array forKey:@"Slaughterfish Egg"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Block", @"Fortify Heavy Armor", @"Lingering Damage Health", @"Resist Frost", nil];
        [dictionary setValue:array forKey:@"Slaughterfish Scales"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Fortify Restoration", @"Lingering Damage Stamina", @"Weakness to Poison", nil];
        [dictionary setValue:array forKey:@"Small Antlers"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify One-Handed", @"Fortify Restoration", @"Resist Frost", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Small Pearl"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Enchanting", @"Resist Fire", @"Resist Frost", @"Resist Shock", nil];
        [dictionary setValue:array forKey:@"Snowberries"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka Regen", @"Damage Stamina", @"Fortify Lockpicking", @"Fortify Marksman", nil];
        [dictionary setValue:array forKey:@"Spider Egg"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Magicka Regen", @"Fortify Alteration", @"Fortify Enchanting", @"Fortify Smithing", nil];
        [dictionary setValue:array forKey:@"Spriggan Sap"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Lingering Damage Magicka", @"Paralysis", @"Resist Shock", @"Restore Health", nil];
        [dictionary setValue:array forKey:@"Swamp Fungal Pod"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Illusion", @"Regenerate Magicka", @"Restore Magicka", @"Weakness to Magic", nil];
        [dictionary setValue:array forKey:@"Taproot"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Heavy Armor", @"Ravage Stamina", @"Resist Frost", @"Resist Poison", nil];
        [dictionary setValue:array forKey:@"Thistle Branch"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Stamina", @"Lingering Damage Magicka", @"Restore Stamina", @"Weakness to Magic", nil];
        [dictionary setValue:array forKey:@"Torchbug Thorax"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Fortify Two-handed", @"Frenzy", @"Resist Poison", nil];
        [dictionary setValue:array forKey:@"Troll Fat"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Barter", @"Fortify Block", @"Fortify Magicka", @"Resist Magic", nil];
        [dictionary setValue:array forKey:@"Tundra Cotton"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Cure Disease", @"Invisibility", @"Regenerate Health", @"Restore Magicka", nil];
        [dictionary setValue:array forKey:@"Vampire Dust"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Health", @"Fortify Magicka", @"Resist Magic", @"Weakness to Shock", nil];
        [dictionary setValue:array forKey:@"Void Salts"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina Regen", @"Fortify Health", @"Lingering Damage Magicka", @"Restore Health", nil];
        [dictionary setValue:array forKey:@"Wheat"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Heavy Armor", @"Ravage Magicka", @"Restore Magicka", @"Weakness to Frost", nil];
        [dictionary setValue:array forKey:@"White Cap"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Fortify Carry Weight", @"Fortify Destruction", @"Resist Magic", @"Restore Stamina", nil];
        [dictionary setValue:array forKey:@"Wisp Wrappings"];
        array = nil;
        array = [NSMutableArray arrayWithObjects:@"Damage Stamina Regen", @"Fortify Health", @"Fortify Restoration", @"Resist Poison", nil];
        [dictionary setValue:array forKey:@"Yellow Mountain Flower"];
        array = nil;
    }
}

-(NSString *)getIngredient:(int)num{
    return [ingredients objectAtIndex:num];
}
-(int)getIngredientsCount{
    return ingredients.count;
}
-(NSArray *)getPotions{
    return potions;
}
-(int)getPotionsCount{
    return potions.count;
}
-(NSString *)getPotion:(int)i{
    return [potions objectAtIndex:i];
}
-(NSMutableArray *)getCompatibleIngredientsForIngredient:(NSString *)ing{
    @autoreleasepool {
        NSArray *array = [dictionary objectForKey:ing];
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
}
-(NSMutableArray *)getIngredientsForPotion:(NSString *)string{
    @autoreleasepool {
        NSMutableArray *newArray = [[NSMutableArray alloc] init];
        for (int j = 0; j < [ingredients count]; ++j) {
            NSMutableArray *array = [dictionary objectForKey:[ingredients objectAtIndex:j]];
            for (NSString *newString in array) {
                if ([newString isEqualToString:string]) {
                    [newArray addObject:[ingredients objectAtIndex:j]];
                }
            }
            array = nil;
        }
        return newArray;
    }
}

@end
