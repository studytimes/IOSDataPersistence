//
//  FMDBManager.m
//  TestCoreData
//
//  Created by aigegou on 2017/2/7.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "FMDBManager.h"
#import "FMDatabase.h"

@implementation FMDBManager {

    //数据库对象
    FMDatabase *mydatabase;
    
}

+(FMDBManager *)shareInstance{

    static FMDBManager *dbmanager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbmanager = [[FMDBManager alloc] init];
    });
    return dbmanager;
}

//重写初始化方法 用于创建数据库对象
-(instancetype)init{

    self = [super init];
    if (self) {
        //初始化数据库对象
        [self createDatabase];
    }
    return self;
}

-(void)createDatabase{

    //数据库文件路径
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path = [document stringByAppendingPathComponent:@"ShopCar.sqlite"];
    //初始化数据库对象
    mydatabase = [FMDatabase databaseWithPath:path];
    
    //打开数据库
    BOOL ret = [mydatabase open];
    if (!ret) {
        NSLog(@"数据库打开失败：%@",mydatabase.lastErrorMessage);
    }else {
       //打开成功
       //创建商品数据表
        NSString *shopsql = @"create table if not exists tb_shop(shopId integer primary key autoincrement, shopName text, shopInfo text,shopPrice float)";
        
        BOOL isshopsqlSuccess = [mydatabase executeUpdate:shopsql];
        
        if (isshopsqlSuccess) {
            NSLog(@"创建表成功");
        }
        
    }
    
    
    
}

//添加数据
- (BOOL)insertShop:(NSString *)insertStr{

    if (insertStr ) {
        if ([mydatabase open]) {
            BOOL isInsertok =   [mydatabase executeUpdate:insertStr];
            
            if (isInsertok) {
                NSLog(@"插入成功");
                [mydatabase close];
                
                return YES;
            }else {
                NSLog(@"插入失败");
                return NO;
            }
        } else {
        
            return NO;
        }

    } else {
        NSLog(@"字符串为空");
        return NO;
    }
}

- (BOOL)motifyShop:(NSString *)motifyStr{

    if ([mydatabase open]) {
        
        BOOL res = [mydatabase executeUpdate:motifyStr];
        if (!res) {
            NSLog(@"修改失败");
            [mydatabase close];

            return NO;

        }else {
            NSLog(@"修改成功");
            [mydatabase close];

            return NO;

        }
        
    }

    return NO;
}

- (BOOL)selectShop:(NSString *)selectStr{

    if ([mydatabase open]) {
        FMResultSet *rs = [mydatabase executeQuery:selectStr];
        
        while ([rs next]) {
            NSLog(@"%d %@ %@",[rs  intForColumn:@"shopId"],[rs  stringForColumn:@"shopName"],[rs  stringForColumn:@"shopInfo"]);
        }
        [mydatabase close];
        return YES;
    }

    return NO;
}

-(BOOL)deleteShop:(NSString *)deleteStr{

    if ([mydatabase open]) {
        
        BOOL res  = [mydatabase executeUpdate:deleteStr];
        
        if (!res) {
            NSLog(@"删除失败");
            [mydatabase close];
            
            return NO;
            
        }else {
            NSLog(@"删除成功");
            [mydatabase close];
            
            return NO;
            
        }

    }
    
    return NO;

}

@end
