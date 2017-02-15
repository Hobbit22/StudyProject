//
//  PackageTableView.m
//  实例
//
//  Created by 胡碧涛 on 2016/12/23.
//  Copyright © 2016年 hubitao.com.study. All rights reserved.
//

#import "PackageTableView.h"

@interface PackageTableView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation PackageTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.frame = frame;
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(NSInteger)numberOfSections{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseId = @"package";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

@end
