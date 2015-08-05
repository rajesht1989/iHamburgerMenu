//
//  HamburgerTableViewController.m
//
//

#import "HamburgerTableViewController.h"

@interface HamburgerTableViewController ()<UITableViewDataSource>
{
    NSArray *arrMenu;
}
@end

@implementation HamburgerTableViewController

- (instancetype)initWithDelegate:(id<HamburgerDelegate>)objDlegate
{
    if (self = [super initWithStyle:UITableViewStylePlain])
    {
        _delegate = objDlegate;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    arrMenu = [NSArray arrayWithObjects:@"Menu 1", @"Menu 2", @"Menu 3", @"Menu 4", @"Menu 5", @"Menu 6" , @"Menu 7" ,@"Menu 8", @"Menu 9", @"Menu 10", nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"hamburgerCell"];
    [self.tableView setShowsVerticalScrollIndicator:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrMenu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hamburgerCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    [cell.textLabel setText:arrMenu[indexPath.row]];
    [cell.textLabel setFont:[UIFont boldSystemFontOfSize:20]];
    
    return cell;
}

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [_delegate hamburgerMenuTapped:arrMenu[indexPath.row]];
}

@end
