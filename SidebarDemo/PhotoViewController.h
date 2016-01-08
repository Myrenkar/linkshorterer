

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UITextField *url_text;
@property (weak, nonatomic) IBOutlet UIButton *add_url_button;
@property (strong, nonatomic) NSString *photoFilename;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (IBAction)add_URL_to_short:(id)sender;


@end
