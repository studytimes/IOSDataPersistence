//
//  FMDBViewController.m
//  TestCoreData
//
//  Created by aigegou on 2017/2/7.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "FMDBViewController.h"
#import "FMDBManager.h"

@interface FMDBViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation FMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addShop:(id)sender {
//    注意：如果'%@'的两边不加单引号就会报错，所以要注意
    NSString *insertStr = [NSString stringWithFormat:@"insert into tb_shop (shopName,shopInfo) values ('%@','%@')",@"巧克力",@"饼干"];
    
    [[FMDBManager shareInstance] insertShop:insertStr];
}
- (IBAction)updateShop:(id)sender {
    
    NSString *motifyStr = @"update tb_shop  set shopName= '糖' where shopInfo = '饼干' ";
    [[FMDBManager shareInstance] motifyShop:motifyStr];
    
}
- (IBAction)deleteShop:(id)sender {
    NSString *motifyStr = @"delete from tb_shop  where shopName = '糖' ";
    [[FMDBManager shareInstance] deleteShop:motifyStr];
}
- (IBAction)searchShop:(id)sender {
    NSString *motifyStr = @"select * from tb_shop";
    [[FMDBManager shareInstance] selectShop:motifyStr];

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
