//
//  AppDelegate.h
//  TestCoreData
//
//  Created by aigegou on 2016/11/2.
//  Copyright © 2016年 aigegou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
/*对象管理上下文 负责实体对象和数据库之间的交互 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
/*对象模型 对应Xcode中创建的模型文件 */
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
/**存储持久对象的数据库 */
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;



@end

