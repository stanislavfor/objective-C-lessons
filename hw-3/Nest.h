#import <Foundation/Foundation.h>
@class Bird;

@interface Nest : NSObject

@property (nonatomic, weak) Bird *bird;
@property (nonatomic, assign) float area; 
@property (nonatomic, assign) NSInteger occupancy;

@end