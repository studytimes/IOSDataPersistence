//
//  Shop.m
//  TestCoreData
//
//  Created by aigegou on 2017/2/8.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "Shop.h"

@implementation Shop

-(void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeInt:_shopNum forKey:@"num"];
    [aCoder encodeObject:_shopInfo  forKey:@"shopInfo"];

}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    NSLog(@"%s",__FUNCTION__);
    self.shopNum = [aDecoder decodeIntForKey:@"num"];
    self.shopInfo = [aDecoder decodeObjectForKey:@"shopInfo"];

    return self;

}

@end
