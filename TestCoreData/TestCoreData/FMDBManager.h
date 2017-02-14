//
//  FMDBManager.h
//  TestCoreData
//
//  Created by aigegou on 2017/2/7.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDBManager : NSObject

+ (FMDBManager *)shareInstance;

//添加数据
- (BOOL)insertShop:(NSString *)insertStr;

//修改数据
- (BOOL)motifyShop:(NSString *)motifyStr;

//查询数据
- (BOOL)selectShop:(NSString *)selectStr;

-(BOOL)deleteShop:(NSString *)deleteStr;

@end
