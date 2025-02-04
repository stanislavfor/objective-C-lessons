#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *getQueryTextField;
@property (weak, nonatomic) IBOutlet UIButton *getButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UITextField *postQueryTextField;
@property (weak, nonatomic) IBOutlet UIButton *postButton;
@property (nonatomic, strong) NSArray *getData;
@property (nonatomic, strong) NSArray *postData;

@end
