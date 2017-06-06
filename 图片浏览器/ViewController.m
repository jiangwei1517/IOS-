//
//  ViewController.m
//  图片浏览器
//
//  Created by jiangwei18 on 17/6/6.
//  Copyright © 2017年 jiangwei18. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ivWatcher;
@property (weak, nonatomic) IBOutlet UILabel *index;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property(nonatomic, strong)NSArray* pics;
@property(nonatomic, assign)int id;
@property (weak, nonatomic) IBOutlet UIButton *btnNextProperty;
@property (weak, nonatomic) IBOutlet UIButton *btnPreProperty;

- (IBAction)btnNext;
- (IBAction)btnPre;

@end

@implementation ViewController

- (NSArray*)pics {
    if (_pics == nil) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"pic" ofType:@".plist"];
        _pics = [NSArray arrayWithContentsOfFile:path];
    }
    return _pics;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.ivWatcher setImage:[UIImage imageNamed:@"biaoqingdi"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnNext {
    if (self.id == self.pics.count - 1) {
        return;
    }
    self.btnPreProperty.enabled = YES;
    self.btnNextProperty.enabled = YES;
    self.id++;
    if (self.id == self.pics.count - 1) {
        self.btnNextProperty.enabled = NO;
    }
    self.index.text = [NSString stringWithFormat:@"%d/%lu", self.id+1, self.pics.count];
    self.desc.text = self.pics[self.id][@"title"];
    [self.ivWatcher setImage:[UIImage imageNamed:self.pics[_id][@"icon"]]];
}

- (IBAction)btnPre {
    if (self.id == 0) {
        return;
    }
    self.btnNextProperty.enabled = YES;
    self.btnPreProperty.enabled = YES;
    self.id--;
    if (self.id == 0) {
        self.btnPreProperty.enabled = NO;
    }
    self.index.text = [NSString stringWithFormat:@"%d/%lu", self.id+1, self.pics.count];
    self.desc.text = self.pics[self.id][@"title"];
    [self.ivWatcher setImage:[UIImage imageNamed:self.pics[self.id][@"icon"]]];
}
@end
