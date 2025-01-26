#import <Foundation/Foundation.h>
@class Nest; // Объявление класса

@interface Bird : NSObject
@property (nonatomic, retain) Nest *nest; // Соединение с Nest

- (void)fly;
- (void)fall;
- (void)eat;

@end