#import "Figure.h"

@interface Triangle : Figure

@property (nonatomic) float sideA;
@property (nonatomic) float sideB;
@property (nonatomic) float sideC;

- (instancetype)initWithSideA:(float)a sideB:(float)b sideC:(float)c;

@end
