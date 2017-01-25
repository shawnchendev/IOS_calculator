//
//  ViewController.h
//  Calculator
//
//  Created by Shawn Chen on 2017-01-24.
//  Copyright © 2017 Shawn Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSString *_text;
    double _fnum;
    double _snum;
    double _total;
    NSInteger _obutton;
    NSString *_oprand;
    

}
@property (weak, nonatomic) IBOutlet UITextField *displayText;
-(void)simple;
@end

