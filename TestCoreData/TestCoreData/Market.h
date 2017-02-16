//
//  Market.h
//  TestCoreData
//
//  Created by aigegou on 2017/2/16.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface Market : RLMObject

@property NSString *name;
@property NSString *location;
/**面积 */
@property float areaSize;

@end
