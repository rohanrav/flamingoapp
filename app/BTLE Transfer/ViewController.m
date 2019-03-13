
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    _loginButton.layer.cornerRadius = 25;
    _fbLoginButton.layer.cornerRadius = 25;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
    NSArray *permissions = [NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, nil];
    [LISDKSessionManager createSessionWithAuth:permissions state:nil showGoToAppStoreDialog:YES successBlock:^(NSString *returnState)
    {
        NSLog(@"%s","success called!");
        LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
        [self performSegueWithIdentifier:@"loggedIn" sender:self];
    } errorBlock:^(NSError *error)
    {
        NSLog(@"Error: %d", error.code);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
