//
//  xyzViewController.m
//  Econfigurator
//
//  Created by Max Galat on 8/13/14.
//  Copyright (c) 2014 Parker. All rights reserved.
//

#import "xyzViewController.h"

@interface xyzViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIView *shadowView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UIButton *loadButton;
@property (strong, nonatomic) IBOutlet UILabel *DivisionLabel;
@property (strong, nonatomic) IBOutlet UITextField *manDivField;
@property (strong, nonatomic) IBOutlet UITextField *sellDiv;
@property (strong, nonatomic) IBOutlet UIPickerView *seriesPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *actionPicker;
@property (strong, nonatomic) IBOutlet UIButton *noXMLBut;
@property (strong, nonatomic) IBOutlet UIButton *jdeXMLBut;
@property (strong, nonatomic) IBOutlet UIButton *autoCadXMLBut;
@property (strong, nonatomic) IBOutlet UIView *curtain;

@property (strong, nonatomic) UITextField *activeField;

@end

@implementation xyzViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.imageView.image = [UIImage imageNamed:@"parkerlogo.jpeg"];
    
    CALayer *layer = self.headerView.layer;
    layer.shadowOffset = CGSizeMake(1,1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 4.0f;
    layer.shadowOpacity = 0.7f;
    
    self.pickerArray = @[@"- Select Action -", @"Configurator", @"Price Sheet Download", @"Price Sheet Upload"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)load:(id)sender {
    
    self.curtain.hidden = YES;
    
}
- (IBAction)xmlButton:(id)sender {
    
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    [buttons addObject:self.noXMLBut];
    [buttons addObject:self.jdeXMLBut];
    [buttons addObject:self.autoCadXMLBut];
    
    for(UIButton * i in buttons){
        
        if(!(i == sender)){
            i.backgroundColor = [UIColor lightGrayColor];
            [i setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
        }else{
            i.backgroundColor = [UIColor darkGrayColor];
            [i setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];

        }
    }
    
}
- (IBAction)openConfigurator:(id)sender {
}




- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}




- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
    
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.manDivField resignFirstResponder];
    [self.sellDiv resignFirstResponder];
}
- (IBAction)backgroundTouch:(id)sender {
    [self.manDivField resignFirstResponder];
    [self.sellDiv resignFirstResponder];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.manDivField resignFirstResponder];
    [self.sellDiv resignFirstResponder];
   
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)picker
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerArray objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}


@end
