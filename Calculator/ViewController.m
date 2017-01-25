//
//  ViewController.m
//  Calculator
//
//  Created by Shawn Chen on 2017-01-24.
//  Copyright © 2017 Shawn Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _text=@"";
    _fnum = 0;
    _snum = 0;
    _total = 0;
    _oprand=@"";
    _obutton = 0;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)NumTouchEvent:(UIButton *)sender {
    _text =[_text stringByAppendingString:sender.titleLabel.text];
    self.displayText.text=_text;
    
}

- (IBAction)OprandTouchEvent:(UIButton *)sender {
    NSLog(@"%@",sender.titleLabel.text);
    _oprand = [_oprand stringByAppendingString:sender.titleLabel.text];

    if ([_oprand isEqualToString:@"+"]){
  [self simple];
        _obutton = 1;
        
    }
    if ([_oprand isEqualToString:@"-"]){
    [self simple];
        _obutton = 2;
        
    }
    if ([_oprand isEqualToString:@"x"]){
       [self simple];
        _obutton = 3;
        
    }
    if ([_oprand isEqualToString:@"/"]){
        [self simple];
        _obutton = 4;
        
    }
    if ([_oprand isEqualToString:@"="]){
        
        _text = self.displayText.text;
        _snum = [_text doubleValue];
        
        switch (_obutton) {
            case 1:
                _total = _fnum + _snum;
                self.displayText.text= [NSString stringWithFormat:@"%f",_total];
                break;
            case 2:
                _total = _fnum - _snum;
                self.displayText.text= [NSString stringWithFormat:@"%f",_total];
                break;
            case 3:
                _total = _fnum * _snum;
                self.displayText.text= [NSString stringWithFormat:@"%f",_total];
                break;
            case 4:
                _total = _fnum / _snum;
                self.displayText.text= [NSString stringWithFormat:@"%f",_total];
                break;
            default:
                break;
        }
        _text = @"";
         _oprand =@"";
    }
}
-(void)simple{
    _text = self.displayText.text;
    _fnum = [_text doubleValue];
    _text = @"";
    self.displayText.text=@"";
    _oprand =@"";
}



@end
