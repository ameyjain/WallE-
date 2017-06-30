//
//  Tab2ViewController.m
//  Template
//
//  Created by Vladyslav Gusakov on 6/2/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

#import "Tab2ViewController.h"
#import "Tab2CellTableViewCell.h"

@interface Tab2ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation Tab2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNibWithClass:[Tab2CellTableViewCell class]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (nonnull UITableViewCell *) tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    Tab2CellTableViewCell *cell = (Tab2CellTableViewCell*)[tableView dequeueReusableCellClass:[Tab2CellTableViewCell class] indexPath:indexPath];
    return cell;
}

- (NSInteger) tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

@end
