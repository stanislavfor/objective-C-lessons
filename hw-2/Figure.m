#import "Figure.h"
// Абстрактные методы
@implementation Figure

- (float)calculateArea {    
    return 0;
}

- (float)calculatePerimeter {    
    return 0;
}

- (void)displayInfo {
    NSLog(@"For a Figure? area: %.2f, perimeter: %.2f", [self calculateArea], [self calculatePerimeter]);
}

@end
