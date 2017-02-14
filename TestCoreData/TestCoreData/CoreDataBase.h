//
//  CoreDataBase.h
//  TestCoreData
//
//  Created by aigegou on 2017/2/6.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShopCar+CoreDataClass.h"

@interface CoreDataBase : NSObject

@property (nonatomic, strong) ShopCar *currEmp;
//@property (nonatomic, strong) /
@property (nonatomic, strong) NSString *infoStr ;
@property (nonatomic, strong) NSString *titleStr ;

//添加商品
-(BOOL) addNewShop:(ShopCar *)shop;
//更新商品
-(BOOL)updateShop:(NSString *)shopName andNewName:(NSString *)newShopName;
//删除商品
-(BOOL)deleteShop:(NSString *)shopName;
//加载所有商品信息
-(NSMutableArray *)loadAllShopInfo;
//根据标志查找商品信息
-(ShopCar *)findShopBuyInfo:(NSString *)tmpInfo;

+(CoreDataBase*)shareInstance;

@end
