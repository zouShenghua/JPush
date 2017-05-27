

#import "LoginVC.h"
#import "TabBarController.h"


@interface LoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
@end



@implementation LoginVC
- (IBAction)LoginBtnClick:(id)sender {
    [JMSGUser loginWithUsername:self.userNameTxt.text password:self.passwordTxt.text completionHandler:^(id resultObject, NSError *error) {
        if (error==nil) {
            NSLog(@"登录成功");
            TabBarController *v=[TabBarController new];
            [self presentViewController:v animated:YES completion:nil];
        }else{
            NSLog(@"%@",error);
        }
    }];
}
- (IBAction)RegistBtnClick:(id)sender {
    NSString *username = self.userNameTxt.text;
    NSString *password = self.passwordTxt.text;
    
    [JMSGUser registerWithUsername:username password:password completionHandler:^(id resultObject, NSError *error) {
        if (error==nil) {
            NSLog(@"注册成功");
        }else{
            NSLog(@"%@",error);
        }
    }];

    }
- (IBAction)out:(id)sender {
    [JMSGUser logout:^(id resultObject, NSError *error) {
        NSLog(@"退出登录");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
