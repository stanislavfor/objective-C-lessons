#import "AppDelegate.h"
#import "FirstViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
