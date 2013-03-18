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
@property (nonatomic, strong) NSArray *cellIdentifiers;
@property (nonatomic, strong) UISwitch *potionsSwitch;
@property (nonatomic, strong) UISwitch *poisonsSwitch;
@property (nonatomic, strong) UISwitch *magickaSwitch;
@end

@implementation AMPreferencesViewController

#define POISONS_DEFAULT_KEY @"poisons"
#define POTIONS_DEFAULT_KEY @"potions"
#define MAGICKA_DEFAULT_KEY @"magicka"
-(NSArray *)cellIdentifiers
{
    if (!_cellIdentifiers) _cellIdentifiers = @[@"PotionsCell", @"PoisonsCell", @"MagickaCell"];
    return _cellIdentifiers;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"default wifi = %u", [defaults boolForKey:POTIONS_DEFAULT_KEY]);
    [self.poisonsSwitch setOn:[defaults boolForKey:POISONS_DEFAULT_KEY] animated:NO];
    [self.potionsSwitch setOn:[defaults boolForKey:POTIONS_DEFAULT_KEY] animated:NO];
    [self.magickaSwitch setOn:[defaults boolForKey:MAGICKA_DEFAULT_KEY] animated:NO];
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
            NSLog(@"Found Switch");
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
    NSLog(@"Switch touched");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.poisonsSwitch.on forKey:POISONS_DEFAULT_KEY];
    [defaults setBool:self.potionsSwitch.on forKey:POTIONS_DEFAULT_KEY];
    [defaults setBool:self.magickaSwitch.on forKey:MAGICKA_DEFAULT_KEY];
    [defaults synchronize];
}

- (IBAction)potions:(UISwitch *)sender {
    if (!sender.on) if (!self.poisonsSwitch.on) [self.poisonsSwitch setOn:YES animated:YES];
    if (!sender.on) if (self.magickaSwitch.on) [self.magickaSwitch setOn:NO animated:YES];
    [self updatePreferences];
}

- (IBAction)poisons:(UISwitch *)sender {
    //NSLog(@"Switched offline, value = %u", sender.on);
    if (!sender.on) if (!self.potionsSwitch.on) [self.potionsSwitch setOn:YES animated:YES];
    [self updatePreferences];
}

- (IBAction)crafting:(UISwitch *)sender {
    if (sender.on) if (!self.potionsSwitch.on) [self.potionsSwitch setOn:YES animated:YES];
    [self updatePreferences];
}

-(void)dealloc
{
#ifdef DEBUG
	//NSLog(@"dealloc %@", self);
#endif
}
@end
