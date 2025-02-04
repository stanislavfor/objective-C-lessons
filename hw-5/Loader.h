#import <Foundation/Foundation.h>

@interface Loader : NSObject

- (void)fetchDataWithQuery:(NSString *)query completion:(void (^)(NSArray *data, NSError *error))completion;

@end
