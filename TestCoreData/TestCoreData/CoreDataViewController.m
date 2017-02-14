//
//  CoreDataViewController.m
//  TestCoreData
//
//  Created by aigegou on 2017/2/7.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "CoreDataViewController.h"
#import "CoreDataBase.h"
#import "AppDelegate.h"

@interface CoreDataViewController ()
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;

@end

@implementation CoreDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(AppDelegate *)delegate{
    
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (IBAction)addData:(id)sender {
    
    ShopCar *tmpshop = [NSEntityDescription insertNewObjectForEntityForName:@"ShopCar" inManagedObjectContext:[self delegate].managedObjectContext];
    
    tmpshop.shopInfo = @"a";
    tmpshop.shopName = @"你猜";
    tmpshop.shopSize = @[@"adsf",@"adsf"];
    tmpshop.shopPrice = 0.1;
    tmpshop.shopSalePrice = 0.5;
    
    [[CoreDataBase shareInstance] addNewShop:tmpshop];
    
    
}
- (IBAction)updateData:(id)sender {
    
    [[CoreDataBase shareInstance] updateShop:@"你" andNewName:@"水果"];
    
}
- (IBAction)deleteData:(id)sender {
    [[CoreDataBase shareInstance] deleteShop:@"猜"];
}
- (IBAction)queryData:(id)sender {
    
    self.infoTextView.text = [NSString stringWithFormat:@"%@",[[CoreDataBase shareInstance] loadAllShopInfo]];
    
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
