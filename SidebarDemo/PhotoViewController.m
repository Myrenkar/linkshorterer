
#import "PhotoViewController.h"
#import "SWRevealViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface PhotoViewController ()

@end


@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Load image
    self.photoImageView.image = [UIImage imageNamed:self.photoFilename];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [self.navigationBar setTitle:@"Skróć link"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)add_URL_to_short:(id)sender {
    NSString *api_url = @"http://to.ly/api.php?longurl=";
    NSString *user_url = self.url_text.text;
    
    
    
    NSPredicate *url_regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"];
    
    
    if ([url_regex evaluateWithObject:user_url]) {
        
        
        NSString *result = [api_url stringByAppendingString:user_url];
        
        
        NSURL *url = [NSURL URLWithString:[result stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *server_response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        
        NSLog(@"Server response: =%@", server_response);
        
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        NSManagedObjectContext *context =
        [appDelegate managedObjectContext];
        
        NSManagedObject *newURL;
        newURL = [NSEntityDescription insertNewObjectForEntityForName:@"Link" inManagedObjectContext:context];
        [newURL setValue: user_url forKey:@"longLink"];
        [newURL setValue: server_response forKey:@"shortLink"];
        
        
        NSError *error;
        if (![context save:&error]) {
            NSLog(@"Couldn't save: %@", [error localizedDescription]);
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        self.url_text.text = @"http://";
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uwaga!"
                                                        message:@"Niepoprawny adres. Spróbuj ponownie!" delegate:self cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
        self.url_text.text = @"http://";
    }
    
}


@end

