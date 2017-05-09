//
//  ViewController.m
//  13.2.4 操作实例
//
//  Created by 李维佳 on 2017/4/4.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"
#import "Service.h"
#import "Person.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@end

@implementation ViewController

- (IBAction)writeToPlist:(id)sender {
    
    //NSString转NSNumber
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *age = [formatter numberFromString:self.ageTextField.text];
    //创建Dictionary
    NSDictionary *personItemDict = @{
                                     @"name": self.nameTextField.text,
                                     @"age": age,
                                     };
    //写入Plist文件
    [[[Service alloc] init] addPersonWithDict:personItemDict];
}

- (IBAction)readFromPlist:(id)sender {
    NSArray *personArray = [[[Service alloc] init] readAllPerson];
    for (NSDictionary *dict in personArray) {
        Person *person = [Person personWithDict:dict];
        NSLog(@"%@,%@",person.name, person.age);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
