//
//  CoreDataBase.m
//  TestCoreData
//
//  Created by aigegou on 2017/2/6.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "CoreDataBase.h"
#import "AppDelegate.h"

@implementation CoreDataBase

+(CoreDataBase *)shareInstance{

    static CoreDataBase *shareDatabase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareDatabase = [[CoreDataBase alloc] init];
    });
    return shareDatabase;

}

-(AppDelegate *)delegate{

    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

-(BOOL)addNewShop:(ShopCar *)shop{

    //让CoreData在上下文中创建一个新对象(托管对象)
    NSError *error;

    
    //托管对象准备好后调用托管对象的上下文的save方法将数据写入数据库
    BOOL isSaveSuccess = [[self delegate].managedObjectContext save:&error];
    
    if (!isSaveSuccess) {
        
        NSLog(@"%@",[error localizedDescription]);
        
        return NO;

    }else {
    
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"添加成功" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alter show];
        return YES;
    }
    
}

-(BOOL)updateShop:(NSString *)shopName andNewName:(NSString *)newShopName{
    
    //查询条件
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"shopName like %@",shopName];//通配符 *shopName* 以shopName开头结尾 
    //包含
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"shopName CONTAINS %@",shopName];
    //创建取回数据请求
    NSFetchRequest *request = [self requestWithPredicate:predicate];
    //设置最大查询数目
//    [request setFetchLimit:1];
    NSError *error ;
    //执行获取数据请求，返回数组
    NSMutableArray *mutableFetchResult = [[[self delegate].managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        return NO;
    }
    
    for (ShopCar *emp in mutableFetchResult) {
        emp.shopName = newShopName;
        [[self delegate].managedObjectContext save:&error];
    }
    
    return YES;
}

//返回一个查询请求
-(NSFetchRequest *)requestWithPredicate:(NSPredicate *)predicate{

    //创建取回数据请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    //设置要检索那种类型的实体对象
    NSEntityDescription *entify = [NSEntityDescription entityForName:@"ShopCar" inManagedObjectContext:[self delegate].managedObjectContext];
    //设置请求实体
    [request setEntity:entify];
    //查询条件
    [request setPredicate:predicate];

    return request;
}

-(BOOL)deleteShop:(NSString *)shopName{

    //查询条件
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"shopName BEGINSWITH %@",shopName];//以shopName开头
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"shopName ENDSWITH %@",shopName];//以shopName结尾
    //创建取回数据请求
    NSFetchRequest *request = [self requestWithPredicate:predicate];
    //设置最大查询数目
    [request setFetchLimit:1];
    NSError *error ;
    //执行获取数据请求，返回数组
    NSMutableArray *mutableFetchResult = [[[self delegate].managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        return NO;
    }
    
    for (ShopCar *emp in mutableFetchResult) {
        [[self delegate].managedObjectContext deleteObject:emp];
        [[self delegate].managedObjectContext save:&error];
        return YES;
    }
    
    return NO;
}

-(NSMutableArray *)loadAllShopInfo{
    //创建取回数据请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    //设置要检索那种类型的实体对象
    NSEntityDescription *entify = [NSEntityDescription entityForName:@"ShopCar" inManagedObjectContext:[self delegate].managedObjectContext];
    //设置请求实体
    [request setEntity:entify];
    NSError *error ;
    //执行获取数组请求，返回数组
    NSMutableArray *tmarr = [[[self delegate].managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    for (ShopCar *tmpshop  in tmarr) {
        NSLog(@"%@",tmpshop.shopName);
        NSLog(@"%f",tmpshop.shopSalePrice);

    }
    
    return tmarr;
}

-(ShopCar *)findShopBuyInfo:(NSString *)tmpInfo{
    
    [self loadAllShopInfo];
    return nil;
}

@end
