#import "SceneDelegate.h"
#import "FirstViewController.h"

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    if ([scene isKindOfClass:[UIWindowScene class]]) {
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
        FirstViewController *firstViewController = [[FirstViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
        self.window.rootViewController = navigationController;
        [self.window makeKeyAndVisible];
    }
}

@end
