//
//  MainViewController.m
//  Flamingo
//
//  Created by Ezra Kirsh on 2017-04-01.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _connectButton.layer.cornerRadius = 25;
    [[LISDKAPIHelper sharedInstance] getRequest:@"https://api.linkedin.com/v1/people/~"
                                        success:^(LISDKAPIResponse *response)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSData* data = [response.data dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@", dictResponse);
            _name.text = [NSString stringWithFormat:@"Hey, %@", dictResponse[@"firstName"]];
            
            [[LISDKAPIHelper sharedInstance] getRequest:@"https://api.linkedin.com/v1/people/~/picture-urls::(original)"
                                                success:^(LISDKAPIResponse *response)
             {
                 dispatch_async(dispatch_get_main_queue(), ^{
                     NSData* data = [response.data dataUsingEncoding:NSUTF8StringEncoding];
                     NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                     
                     NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:dictResponse[@"values"][0]]];
                     _imageView.layer.cornerRadius = 25;
                     _imageView.clipsToBounds = YES;
                     _imageView.image = [UIImage imageWithData:imageData];
                 });
             } error:^(LISDKAPIError *apiError)
             {
                 NSLog(@"Error : %@", apiError);
             }];
        });
    } error:^(LISDKAPIError *apiError)
    {
        NSLog(@"Error : %@", apiError);
    }];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDown)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeDown];
}

-(void)swipeDown {
    [self performSegueWithIdentifier:@"suggestions" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
