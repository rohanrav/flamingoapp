
#import <UIKit/UIKit.h>
#import <linkedin-sdk/LISDK.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *fbLoginButton;

- (IBAction)login:(id)sender;

@end
