//
//  ADYViewController.m
//  10.QQ聊天
//
//  Created by YOU on 15/1/2.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import "ADYViewController.h"
#import "ADYMessage.h"
#import "ADYMessageFrame.h"
#import "ADYMessageCell.h"
@interface ADYViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *messages;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ADYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableview.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0  blue:224/255.0  alpha:1];
    self.tableview.allowsSelection=NO;
    
//    [NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
/**
 *  当键盘的位置发生改变
 *
 *  @param note <#note description#>
 */
-(void)KeyboardWillChangeFrame:(NSNotification *)note{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)messages{
    if (_messages==nil) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"messages" ofType:@"plist"];
        NSMutableArray  *msgArray=[NSMutableArray array];
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in dictArray) {
            ADYMessage *message=[ADYMessage messageWithDict:dict];
            ADYMessageFrame *mf=[[ADYMessageFrame alloc]init];
          ADYMessageFrame *lastf=[msgArray lastObject];
            ADYMessage *last=lastf.message;
            
            message.showTime=![last.time isEqualToString:message.time];
            mf.message= message ;
                                  [msgArray addObject:mf];
        }
        _messages=msgArray;
    
    }
    
    return _messages;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.messages.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    ADYMessageCell *cell=[ADYMessageCell cellWithTableView:tableView];
    cell.messageFrame=self.messages[indexPath.row];
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ADYMessageFrame *frame=  self.messages[indexPath.row];
    return frame.cellHeight;
}

@end
