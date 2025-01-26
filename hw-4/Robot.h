#import <Foundation/Foundation.h>

@interface Robot : NSObject

@property (nonatomic, assign) int x;
@property (nonatomic, assign) int y;

- (instancetype)init;
- (void)run:(NSString *(^)(void))directionBlock;
- (void)displayPosition;

@end