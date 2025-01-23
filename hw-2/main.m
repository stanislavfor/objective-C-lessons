#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Circle.h"
#import "Triangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *figures = [NSMutableArray array];
        
        [figures addObject:[[Rectangle alloc] initWithWidth:5 height:3]];
        [figures addObject:[[Circle alloc] initWithRadius:4]];
        [figures addObject:[[Triangle alloc] initWithSideA:3 sideB:4 sideC:5]];
        
        NSLog(@"Figure Informations:");
        for (Figure *figure in figures) {
            [figure displayInfo];
        }
    }
    return 0;
}