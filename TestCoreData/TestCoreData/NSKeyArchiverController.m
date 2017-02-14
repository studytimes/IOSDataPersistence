//
//  NSKeyArchiverController.m
//  TestCoreData
//
//  Created by aigegou on 2017/2/8.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "NSKeyArchiverController.h"
#import "Shop.h"

@interface NSKeyArchiverController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation NSKeyArchiverController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    默认情况下，只能对NSDate, NSNumber, NSString, NSArray, or NSDictionary来进行归档。
    NSString *docpath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path = [docpath stringByAppendingPathComponent:@"shop.archiver"];
    //自定义归档对象 实现NSCoding协议
    Shop *tmpshop = [[Shop alloc] init];
    tmpshop.shopInfo = @"🍊";
    tmpshop.shopNum= 100;
    
    [NSKeyedArchiver archiveRootObject:tmpshop toFile:path];
    
    
}
- (IBAction)showArchiverData:(id)sender {
    NSString *docpath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path = [docpath stringByAppendingPathComponent:@"shop.archiver"];

    Shop *tmpinfo =  [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    self.textView.text = [NSString stringWithFormat:@"%d %@",tmpinfo.shopNum,tmpinfo.shopInfo];
    
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
