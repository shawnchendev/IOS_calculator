//
//  ViewController.m
//  Calculator
//
//  Created by Shawn Chen on 2017-01-24.
//  Copyright © 2017 Shawn Chen. All rights reserved.
//

#import "ViewController.h"
#import "math.h"
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
    _n = 0;
    
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
    
    if([_oprand isEqualToString:@"+/-"]){
        NSString *negative =@"-";
        if (_n == 0){
            _n = 1;
            _text = self.displayText.text;
            self.displayText.text = [negative stringByAppendingString:_text];
            _oprand =@"";
        }
        else{
            _n = 0;
            _text = self.displayText.text;
            self.displayText.text = [_text substringFromIndex:1];
            _oprand =@"";
            
            
        }
    }
    if ([_oprand isEqualToString:@"+"]){
        [self get_fnum];
        _obutton = 1;
        
    }
    if ([_oprand isEqualToString:@"-"]){
    [self get_fnum];
        _obutton = 2;
        
    }
    if ([_oprand isEqualToString:@"x"]){
       [self get_fnum];
        _obutton = 3;
        
    }
    if ([_oprand isEqualToString:@"/"]){
        [self get_fnum];
        _obutton = 4;
    }
    if ([_oprand isEqualToString:@"1/x"]){
        [self get_fnum];
        _total = 1 / _fnum;
        [self display_text:(_total)];
    }
    
    if ([_oprand isEqualToString:@"root"]){
        [self get_fnum];
        _total = sqrt(_fnum);
        [self display_text:(_total)];
    }
    if([_oprand isEqualToString:@"x^2"]){
        [self get_fnum];
        _total = pow(_fnum, 2);
        [self display_text:(_total)];
    }
    if([_oprand isEqualToString:@"x^3"]){
        [self get_fnum];
        _total = pow(_fnum,3);
        [self display_text:(_total)];
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
                break;
            
            default:
                break;
        }
        _text = @"";
        _oprand =@"";
    }
}


-(void)get_fnum{
    _text = self.displayText.text;
    _fnum = [_text doubleValue];
    _text = @"";
    self.displayText.text=@"";
    _oprand =@"";
}
-(void)display_text:(double)total{
    self.displayText.text= [NSString stringWithFormat:@"%f",total];
}



@end
