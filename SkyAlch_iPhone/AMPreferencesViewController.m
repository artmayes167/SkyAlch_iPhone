//
//  AMPreferencesViewController.m
//  MoviePods
//
//  Created by Arthur Mayes on 3/2/13.
//  Copyright (c) 2013 Arthur Mayes. All rights reserved.
//

#import "AMPreferencesViewController.h"

@interface AMPreferencesViewController ()
- (IBAction)potions:(UISwitch *)sender;
- (IBAction)poisons:(UISwitch *)sender;
- (IBAction)crafting:(UISwitch *)sender;
- (IBAction)melee:(UISwitch *)sender;
- (IBAction)stealth:(UISwitch *)sender;
- (IBAction)miscellany:(UISwitch *)sender;
@property (nonatomic, strong) NSArray *cellIdentifiers;
@property (nonatomic, strong) UISwitch *potionsSwitch;
@property (nonatomic, strong) UISwitch *poisonsSwitch;
@property (nonatomic, strong) UISwitch *magickaSwitch;
@property (nonatomic, strong) UISwitch *meleeSwitch;
@property (nonatomic, strong) UISwitch *stealthSwitch;
@property (nonatomic, strong) UISwitch *miscellanySwitch;
@end

@implementation AMPreferencesViewController

#define POISONS_DEFAULT_KEY @"poisons"
#define POTIONS_DEFAULT_KEY @"potions"
#define MAGICKA_DEFAULT_KEY @"magicka"
#define MELEE_DEFAULT_KEY @"melee"
#define STEALTH_DEFAULT_KEY @"stealth"
#define MISCELLANY_DEFAULT_KEY @"miscellany"
-(NSArray *)cellIdentifiers
{
    if (!_cellIdentifiers) _cellIdentifiers = @[@"PotionsCell", @"PoisonsCell", @"MagickaCell", @"MeleeCell", @"StealthCell", @"MiscellanyCell"];
    return _cellIdentifiers;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSLog(@"default wifi = %u", [defaults boolForKey:POTIONS_DEFAULT_KEY]);
    [self.poisonsSwitch setOn:[defaults boolForKey:POISONS_DEFAULT_KEY] animated:YES];
    [self.potionsSwitch setOn:[defaults boolForKey:POTIONS_DEFAULT_KEY] animated:YES];
    [self.magickaSwitch setOn:[defaults boolForKey:MAGICKA_DEFAULT_KEY] animated:YES];
    [self.meleeSwitch setOn:[defaults boolForKey:MELEE_DEFAULT_KEY] animated:YES];
    [self.stealthSwitch setOn:[defaults boolForKey:STEALTH_DEFAULT_KEY] animated:YES];
    [self.miscellanySwitch setOn:[defaults boolForKey:MISCELLANY_DEFAULT_KEY] animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.cellIdentifiers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifiers[indexPath.row] forIndexPath:indexPath];
    
    for (UIView *view in [cell.contentView subviews]) {
        if ([view isKindOfClass:[UISwitch class]]) {
            //NSLog(@"Found Switch");
            switch (indexPath.row) {
                case 0:
                    self.potionsSwitch = (UISwitch *)view;
                    break;
                case 1:
                    self.poisonsSwitch = (UISwitch *)view;
                    break;
                case 2:
                    self.magickaSwitch = (UISwitch *)view;
                    break;
                case 3:
                    self.meleeSwitch = (UISwitch *)view;
                    break;
                case 4:
                    self.stealthSwitch = (UISwitch *)view;
                    break;
                case 5:
                    self.miscellanySwitch = (UISwitch *)view;
                    break;
                default:
                    break;
            }
        }
    }
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)updatePreferences
{
    //NSLog(@"Switch touched");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.poisonsSwitch.on forKey:POISONS_DEFAULT_KEY];
    [defaults setBool:self.potionsSwitch.on forKey:POTIONS_DEFAULT_KEY];
    [defaults setBool:self.magickaSwitch.on forKey:MAGICKA_DEFAULT_KEY];
    [defaults setBool:self.meleeSwitch.on forKey:MELEE_DEFAULT_KEY];
    [defaults setBool:self.stealthSwitch.on forKey:STEALTH_DEFAULT_KEY];
    [defaults setBool:self.miscellanySwitch.on forKey:MISCELLANY_DEFAULT_KEY];
    [defaults synchronize];
}

- (IBAction)potions:(UISwitch *)sender {
    if (!sender.on) if (!self.poisonsSwitch.on) [self.poisonsSwitch setOn:YES animated:YES];
    if (!sender.on) if (self.magickaSwitch.on) [self.magickaSwitch setOn:NO animated:YES];
    if (!sender.on) if (self.meleeSwitch.on) [self.meleeSwitch setOn:NO animated:YES];
    [self updatePreferences];
}

- (IBAction)poisons:(UISwitch *)sender {
    if (sender.on) if (!self.meleeSwitch.on) [self.meleeSwitch setOn:YES animated:YES];
    if (!sender.on) if (!self.potionsSwitch.on) [self.potionsSwitch setOn:YES animated:YES];
    [self updatePreferences];
}

- (IBAction)crafting:(UISwitch *)sender {
    if (sender.on) if (!self.potionsSwitch.on) [self.potionsSwitch setOn:YES animated:YES];
    [self updatePreferences];
}

- (IBAction)melee:(UISwitch *)sender {
    if (sender.on) if (!self.potionsSwitch.on) [self.potionsSwitch setOn:YES animated:YES];
    if (!sender.on) if (self.poisonsSwitch.on) [self.poisonsSwitch setOn:NO animated:YES];
    [self updatePreferences];
}

- (IBAction)stealth:(UISwitch *)sender {
    [self updatePreferences];
}

- (IBAction)miscellany:(UISwitch *)sender {
    [self updatePreferences];
}

-(void)dealloc
{
#ifdef DEBUG
	//NSLog(@"dealloc %@", self);
#endif
}
@end
