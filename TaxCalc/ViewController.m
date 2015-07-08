//
//  ViewController.m
//  TaxCalc
//
//  Created by Alejandro Gonzalez on 7/7/15.
//  Copyright (c) 2015 Alejandro Gonzalez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *priceTextField;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@property NSString *initialPrice;

@property double price;

@property double caTax;
@property double chiTax;
@property double nyTax;


@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];

    self.caTax = .075;
    self.chiTax = .0925;
    self.nyTax = .045;

    self.priceTextField.delegate = self;

    }


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self.priceTextField resignFirstResponder];


}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}





- (IBAction)onCalculateButtonTapped:(id)sender {


    self.initialPrice = [self.priceTextField text];
    self.price = [self.initialPrice intValue];

    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            self.resultLabel.text = [NSString stringWithFormat:@"%f", self.price * self.caTax];
            break;

        case 1:
            self.resultLabel.text = [NSString stringWithFormat:@"%f", self.price * self.chiTax];
            break;

        case 2:
            self.resultLabel.text = [NSString stringWithFormat:@"%f", self.price * self.nyTax];
            break;

        default:
            break;
    }

}

- (IBAction)calcOverallPrice:(id)sender {


    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            self.resultLabel.text = [NSString stringWithFormat:@"%f", self.price * (1 + self.caTax) + self.price * .2];
            break;

        case 1:
            self.resultLabel.text = [NSString stringWithFormat:@"%f", self.price * (1 +self.chiTax) + self.price * .2];
            break;

        case 2:
            self.resultLabel.text = [NSString stringWithFormat:@"%f", self.price * (1 + self.nyTax) + self.price * .2];
            break;

        default:
            break;
    }


}

- (IBAction)tipCalc:(id)sender {

    self.initialPrice = [self.priceTextField text];
    self.price = [self.initialPrice intValue];

    self.resultLabel.text = [NSString stringWithFormat:@"%f", self.price * .2];

}



@end
