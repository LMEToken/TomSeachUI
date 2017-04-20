//
//  SearchViewController.m
//  TomSeachUI
//
//  Created by tom on 2017/4/19.
//  Copyright © 2017年 tom. All rights reserved.
//

#import "SearchViewController.h"
#import "TomSearchBar.h"
#import "SearchSettingView.h"
@interface SearchViewController ()<TomSearchBarDelegate>
@property (weak, nonatomic) IBOutlet TomSearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIView *titleBackView;

@property (nonatomic,strong)SearchSettingView *searchSettingView;

- (IBAction)closeAction:(id)sender;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    self.searchBar.placeholder = NSLocalizedString(@"Search text here!", nil);
    
    self.searchBar.delegate = self;
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    [self.searchBar.textField becomeFirstResponder];
        
    self.searchSettingView  = [[SearchSettingView alloc]init];
    
    [self.searchSettingView setFrame:CGRectMake(0,60, self.view.frame.size.width, 0)];

    [self.view addSubview:self.searchSettingView];
 
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TomSearchBarDelegate

- (void)searchBarCancelButtonClicked:(TomSearchBar *)searchBar {
    
    
    
    [UIView animateWithDuration:.3 animations:^{
        
        if (self.searchSettingView.frame.size.height==0)
        {
            [self.searchSettingView setFrame:CGRectMake(0, 60, self.view.frame.size.width,self.view.frame.size.height-60)];
        }else
        {
            [self.searchSettingView setFrame:CGRectMake(0,60, self.view.frame.size.width, 0)];
        }
       
//        self.selection_details.transform = (self.selection_details.frame.origin.y<0)?CGAffineTransformMakeTranslation(0, BYScreenHeight):CGAffineTransformMakeTranslation(0, -BYScreenHeight);
    }];
    self.searchBar.text = @"";
}
- (void)searchBarSearchButtonClicked:(TomSearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}
- (void)searchBar:(TomSearchBar *)searchBar textDidChange:(NSString *)searchText {

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
