//
//  SuggestionViewController.m
//  Flamingo
//
//  Created by Ezra Kirsh on 2017-04-02.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "SuggestionViewController.h"
#import "CellTableViewCell.h"

@interface SuggestionViewController ()


@end

@implementation SuggestionViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINib *cell = [UINib nibWithNibName:@"Cell" bundle:nil];
    [_tableView registerNib:cell forCellReuseIdentifier:@"cell"];
    
    _names = @[@"Rishi Bhuwan", @"Rohan Ravindran"];
    _headlines = @[@"CTO at MoneyScents", @"CEO at Rokri"];
    _similarities = @[@"You both like VR and Finance", @"You both like AI and Hardware"];
    _images = @[@"rishi.jpg", @"rohan.jpg"];
    _urls = @[@"https://www.linkedin.com/in/rishi-bhuwan-306381b4/", @"https://www.linkedin.com/in/rohan-r-74506712b/"];
    _phones = @[@"6474632001", @"6479604640"];
    
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDown)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(void)swipeDown {
    [self performSegueWithIdentifier:@"backToMain" sender:self];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 115;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.name.text = _names[indexPath.row];
    cell.headline.text = _headlines[indexPath.row];
    cell.similarities.text = _similarities[indexPath.row];
    
    cell.plusButton.tag = indexPath.row;
    [cell.plusButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.phoneButton.tag = indexPath.row;
    cell.phoneButton.hidden = NO;
    [cell.phoneButton addTarget:self action:@selector(phone:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.profilePicture.image = [UIImage imageNamed:_images[indexPath.row]];
    cell.profilePicture.layer.cornerRadius = 25;
    cell.profilePicture.clipsToBounds = YES;
    
    return cell;
}

-(void)click:(UIButton *)sender {
    NSURL *newOpen = [NSURL URLWithString:[_urls objectAtIndex:sender.tag]];
    [[UIApplication sharedApplication] openURL:newOpen];
}

-(void)phone:(UIButton *)sender {
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:_phones[sender.tag]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
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
