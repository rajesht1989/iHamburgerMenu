//
//  HamburgerTableViewController.h
//
//

#import <UIKit/UIKit.h>

@protocol HamburgerDelegate <NSObject>

- (void)hamburgerMenuTapped:(NSString *)strTitle;

@end

@interface HamburgerTableViewController : UITableViewController

- (instancetype)initWithDelegate:(id<HamburgerDelegate>)objDlegate;

@property(nonatomic,assign) id<HamburgerDelegate> delegate;

@end
