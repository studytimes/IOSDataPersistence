//
//  KeyChainController.m
//  TestCoreData
//
//  Created by aigegou on 2017/3/23.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "KeyChainController.h"
#import "SAMKeychain.h"

@interface KeyChainController ()

@end

@implementation KeyChainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //保存一个UUID字符串到钥匙串:
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    assert(uuid != NULL);
    CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
    [SAMKeychain setPassword:[NSString stringWithFormat:@"%@",uuid] forService:@"js.testcoredata" account:@"user"];
    //从钥匙串读取UUID
    NSString *retrieveuuid = [SAMKeychain passwordForService:@"js.testcoredata" account:@"user"];
    
}

- (NSString *)getDevieId {

    NSString *currentDeviceUUIDStr = [SAMKeychain passwordForService:@"js.testcoredata" account:@"user"];
    if (currentDeviceUUIDStr == nil || [currentDeviceUUIDStr isEqualToString:@""]) {
        
        NSUUID *currentDeviceUUID = [UIDevice currentDevice].identifierForVendor;
        currentDeviceUUIDStr = currentDeviceUUID.UUIDString;
        currentDeviceUUIDStr = [currentDeviceUUIDStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
        currentDeviceUUIDStr = [currentDeviceUUIDStr lowercaseString];
        [SAMKeychain setPassword:currentDeviceUUIDStr forService:@"js.testcoredata" account:@"user"];
        
    }
    return currentDeviceUUIDStr;
    
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
