//
//  RealmViewController.m
//  TestCoreData
//
//  Created by aigegou on 2017/2/10.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "RealmViewController.h"
#import "Market.h"

@interface RealmViewController ()
@property (weak, nonatomic) IBOutlet UITextView *datainfoTextView;

/**查询的结果集对象只能是realm提供的RLMResults类型 不支持OC的类型(NSArray) */
@property (nonatomic, strong) RLMResults *array;

@property (nonatomic, strong) RLMNotificationToken *notification;

@end

@implementation RealmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (IBAction)addData:(id)sender {
//    直接添加数据
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm beginWriteTransaction];
//    [Market createInRealm:realm withValue:@{@"name":@"爱生活",
//                                            @"location":@"中国",
//                                            @"areaSize":@1}];
//    
//    [realm commitWriteTransaction];
    //采用异步线程添加数据 一般采取这种方式
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        RLMRealm *realm = RLMRealm.defaultRealm;
        [realm beginWriteTransaction];
        [Market createInRealm:realm withValue:@{@"name":@"爱生活",
                                                                    @"location":@"中国",
                                                                    @"areaSize":@1}];
        [realm commitWriteTransaction];
    });
}

- (IBAction)updateData:(id)sender {
    RLMRealm *realm = RLMRealm.defaultRealm;
    RLMResults *otherResults = [Market objectsInRealm:realm where:@"areaSize >0"];
    [realm beginWriteTransaction];
    for (Market *market in otherResults) {
        market.areaSize = 6;
    }
    [realm commitWriteTransaction];

}

- (IBAction)deleteData:(id)sender {
    RLMRealm *realm = RLMRealm.defaultRealm;
    RLMResults *otherResults = [Market objectsInRealm:realm where:@"areaSize >5"];
    [realm beginWriteTransaction];
    for (Market *market in otherResults) {
        [realm deleteObject:market];
    }
    [realm commitWriteTransaction];
}

- (IBAction)queryData:(id)sender {
    
    self.array = [Market allObjects] ;
    self.datainfoTextView.text = [NSString stringWithFormat:@"%@",self.array];
    
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
