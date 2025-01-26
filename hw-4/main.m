#import <Foundation/Foundation.h>
#import "Robot.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Robot *robot = [[Robot alloc] init];
        [robot displayPosition];

        // Сообщения движения робота
        [robot run:^NSString *{
            return @"up";
        }];
        [robot displayPosition];

        [robot run:^NSString *{
            return @"right";
        }];
        [robot displayPosition];

        [robot run:^NSString *{
            return @"down";
        }];
        [robot displayPosition];

        [robot run:^NSString *{
            return @"left";
        }];
        [robot displayPosition];

        [robot run:^NSString *{
            return @"unknown destination";
        }];
        [robot displayPosition];

        [robot release];
    }
    return 0;
}