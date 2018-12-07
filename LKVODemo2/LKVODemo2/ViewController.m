//
//  ViewController.m
//  LKVODemo1
//
//  Created by HoTia on 2018/12/5.
//  Copyright © 2018 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "TwoViewController.h"


@interface ViewController ()
@property (nonatomic, strong) Person *p;
@end

@implementation ViewController

- (IBAction)gototwocontrollerAction:(id)sender {
    TwoViewController *twovc = [[TwoViewController alloc] init];
    twovc.p = _p;
    [self.navigationController pushViewController:twovc animated:YES];
}

- (void)addBtn {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"Go to TwoController" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gototwocontrollerAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(100, 100, 120, 40)];
    [self.view addSubview:btn];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBtn];
    
    _p = [Person new];
    
    // 步骤一 注册
    [_p addObserver:self forKeyPath:NSStringFromSelector(@selector(name)) options:NSKeyValueObservingOptionNew context:nil];
}

// 步骤二
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@ viewController",change);
}
- (void)dealloc {
    // 步骤三
    [_p removeObserver:self forKeyPath:NSStringFromSelector(@selector(name))];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int a;
    [_p willChangeValueForKey:NSStringFromSelector(@selector(name))];
    _p.name = [NSString stringWithFormat:@"%@",@(a++)];
    [_p didChangeValueForKey:NSStringFromSelector(@selector(name))];
}



@end
