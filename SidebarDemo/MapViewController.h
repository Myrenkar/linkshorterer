

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MapViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;


@end
