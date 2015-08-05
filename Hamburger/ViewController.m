//
//  ViewController.m
//  Hamburger
//
//  Created by Rajesh on 5/11/15.
//

#import "ViewController.h"
#import "HamburgerTableViewController.h"

@interface ViewController ()<HamburgerDelegate>
{
    UINavigationController *hamburgerController;
    UIView *vwHamburgerMenu;
    UIView *vwHamburgerBg;
    BOOL isHamburgerOpen;
    __weak IBOutlet UILabel *lblState;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onClickHamburgerMenu:(UIBarButtonItem *)sender {
    
    if (!vwHamburgerMenu)
    {
        vwHamburgerBg = [[UIView alloc]initWithFrame:self.view.bounds];
        [vwHamburgerBg setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        
        hamburgerController = [[UINavigationController alloc] initWithRootViewController:[[HamburgerTableViewController alloc] initWithDelegate:self]];
        CGRect rectFrame = self.view.frame;
        rectFrame.size.width = vwHamburgerBg.frame.size.width/2;
        [hamburgerController.view setFrame:rectFrame];
        [hamburgerController.view  setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [vwHamburgerBg addSubview:hamburgerController.view];
        [self.view addSubview:vwHamburgerBg];
        vwHamburgerMenu = hamburgerController.view;

        rectFrame.origin.x = rectFrame.size.width;
        UIButton *btnHamburger = [[UIButton alloc] initWithFrame:rectFrame];
        [btnHamburger addTarget:self action:@selector(animateHamburgerShouldClose:) forControlEvents:UIControlEventTouchUpInside];
        [btnHamburger  setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [vwHamburgerBg addSubview:btnHamburger];
    }
    [self animateHamburgerShouldClose:isHamburgerOpen];
}

- (void)animateHamburgerShouldClose:(BOOL)shouldClose
{
    isHamburgerOpen = !shouldClose;
    if (shouldClose)
    {
        CGRect rect  = vwHamburgerMenu.frame;
        rect.origin.x = -rect.size.width;
        [UIView animateWithDuration:.3 animations:^{
            [vwHamburgerMenu setFrame:rect];
            [vwHamburgerBg setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
        } completion:^(BOOL finished) {
            [vwHamburgerBg setHidden:YES];
        }];
    }
    else
    {
        [vwHamburgerBg setHidden:NO];
        [vwHamburgerBg setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
        CGRect rect  = vwHamburgerMenu.frame;
        rect.origin.y = 0;
        rect.origin.x = -rect.size.width;
        [vwHamburgerMenu setFrame:rect];
        rect.origin.x = 0;
        [UIView animateWithDuration:.3 animations:^{
            [vwHamburgerMenu setFrame:rect];
            [vwHamburgerBg setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.2]];
        } completion:nil];
    }
}

- (void)hamburgerMenuTapped:(NSString *)strTitle
{
    [lblState setText:strTitle];
    [self animateHamburgerShouldClose:YES];
}



@end
