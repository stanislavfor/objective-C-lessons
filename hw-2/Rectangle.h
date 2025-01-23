#import "Figure.h"

@interface Rectangle : Figure

@property (nonatomic) float width;
@property (nonatomic) float height;

- (instancetype)initWithWidth:(float)width height:(float)height;

@end