#import "SecondViewController.h"
#import "Robot.h"

@interface SecondViewController ()
@property (nonatomic, strong) UITextField *xTextField;
@property (nonatomic, strong) UITextField *yTextField;
@property (nonatomic, strong) UITextView *coordinatesTextView;
@property (nonatomic, strong) Robot *robot;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.xTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 100, 40)];
    self.xTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.xTextField.placeholder = @"X";
    [self.view addSubview:self.xTextField];

    self.yTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, 100, 100, 40)];
    self.yTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.yTextField.placeholder = @"Y";
    [self.view addSubview:self.yTextField];

    self.coordinatesTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, 150, 300, 100)];
    self.coordinatesTextView.editable = NO;
    [self.view addSubview:self.coordinatesTextView];

    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    startButton.frame = CGRectMake(20, 260, 100, 40);
    [startButton setTitle:@"START" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startRobot) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];

    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeSystem];
    stopButton.frame = CGRectMake(140, 260, 100, 40);
    [stopButton setTitle:@"STOP" forState:UIControlStateNormal];
    [stopButton addTarget:self action:@selector(stopRobot) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];

    self.robot = [[Robot alloc] init];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger savedX = [userDefaults integerForKey:@"robotX"];
    NSInteger savedY = [userDefaults integerForKey:@"robotY"];
    self.robot.x = savedX;
    self.robot.y = savedY;
    [self updateCoordinatesTextView];
}

- (void)startRobot {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(moveRobot) userInfo:nil repeats:YES];
}

- (void)stopRobot {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)moveRobot {
    @try {
        NSString *direction = @"right"; 
        [self.robot run:^NSString *{
            return direction;
        }];
        [self updateCoordinatesTextView];
        [self saveRobotCoordinates];
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
}

- (void)updateCoordinatesTextView {
    self.coordinatesTextView.text = [NSString stringWithFormat:@"X: %d, Y: %d", self.robot.x, self.robot.y];
}

- (void)saveRobotCoordinates {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:self.robot.x forKey:@"robotX"];
    [userDefaults setInteger:self.robot.y forKey:@"robotY"];
    [userDefaults synchronize];
}

@end
