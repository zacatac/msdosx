//
//  DetailViewController.h
//  temp
//
//  Created by Zack Field on 2/20/14.
//  Copyright (c) 2014 Zack Field. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
