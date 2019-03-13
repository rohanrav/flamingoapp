//
//  SuggestionViewController.h
//  Flamingo
//
//  Created by Ezra Kirsh on 2017-04-02.
//  Copyright © 2017 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Callkit/CallKit.h>

@interface SuggestionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) NSArray *headlines;
@property (nonatomic, strong) NSArray *similarities;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) NSArray *phones;



@end
