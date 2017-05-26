//
//  ViewController.m
//  TestCoreData
//
//  Created by aigegou on 2016/11/2.
//  Copyright © 2016年 aigegou. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>{

    NSArray *dataArr;

}
@property (weak, nonatomic) IBOutlet UITableView *mytable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"数据持久化方式";
    
    self.mytable.dataSource = self;
    self.mytable.delegate = self;
    [self.mytable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellidentifier"];
    
    dataArr = @[@"NSKeyedArchiver",@"NSUserDefaults",@"Write写入方式",@"FMDB",@"Coredata",@"Realm"];
//
    
}

////冒泡排序 从小到大
//- (void)maopaoset{
//
//    NSArray *tmpa  = @[@1,@3,@4,@8,@6,@10];
//    int count = (int)[tmpa count];
//    
//    for (int i =0; i<count-1; i++) {
//        //
//        bool isSorted = true;
//        for (int j=0; j<count-i-1; j++) {
//            if (tmpa[j]>tmpa[j+1]) {
//                isSorted = false;
//                int tmp = tmpa[j];
//                            }
//        }
//        if (!isSorted) {
//            break;
//        }
//    }
//
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellidentifier" forIndexPath:indexPath];
    cell.detailTextLabel.text = dataArr[indexPath.row];
    cell.textLabel.text = dataArr[indexPath.row];
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"NSKeyArchiverWay" sender:self];
        return;
    }

    if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"'KeyChainController" sender:self];
        return;
    }
    
    if (indexPath.row == 3) {
        [self performSegueWithIdentifier:@"FMDBPush" sender:self];
        return;
    }
    
    if (indexPath.row == 4) {
        [self performSegueWithIdentifier:@"CoreDataPush" sender:self];
        return;
    }
    
    if (indexPath.row == 5) {
        [self performSegueWithIdentifier:@"RealmPush" sender:self];
        return;
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
