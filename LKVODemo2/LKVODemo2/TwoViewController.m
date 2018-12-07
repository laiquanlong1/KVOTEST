//
//  TwoViewController.m
//  LKVODemo1
//
//  Created by HoTia on 2018/12/7.
//  Copyright © 2018 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [_p addObserver:self forKeyPath:NSStringFromSelector(@selector(name)) options:(NSKeyValueObservingOptionNew) context:nil];
    
    
    // Do any additional setup after loading the view.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@",change);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int b;
    _p.name = [NSString stringWithFormat:@"%@",@(b++)];
//    NSLog(@"%@",@(b++));
}

- (void)dealloc {
    [_p removeObserver:self forKeyPath:NSStringFromSelector(@selector(name))];
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
