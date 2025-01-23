#import "Figure.h"

@interface Circle : Figure

@property (nonatomic) float radius;

- (instancetype)initWithRadius:(float)radius;

@end