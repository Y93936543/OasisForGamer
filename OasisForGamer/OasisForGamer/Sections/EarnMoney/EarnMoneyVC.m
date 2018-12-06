//
//  MainVC.m
//  OasisForGamer
//
//  Created by aishangyouxi on 2018/10/19.
//  Copyright © 2018年 junion. All rights reserved.
//

#import "EarnMoneyVC.h"

#import "JNTest_post.h"
#import "JNGCDUtil.h"
#import "MJRefresh.h"
#import "BannerCell.h"
#import "NoticeBannerCell.h"
#import "JNBarChartCell.h"
#import "JNModularHead.h"
#import "JNModularACell.h"

@interface EarnMoneyVC()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation EarnMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 40)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, DEVICE_Width_Scale * 200, 20)];
        label.text = @"业务数据";
        [view addSubview:label];
        return view;
    }
    else if (section == 3){
        JNModularHead *modularHead = [[JNModularHead alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 25)];
        modularHead.title.text = @"赏金秘籍";
        modularHead.subtitle.text = @"十八班兵器，助理赏金者";
        modularHead.moreBtn.text = @"更多>";
        modularHead.moreBtnBlock = ^{
            //更多按钮点击回调
            
        };
        return modularHead;
    }
    else if (section == 4){
        JNModularHead *modularHead = [[JNModularHead alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 25)];
        modularHead.title.text = @"合规课堂";
        modularHead.subtitle.text = @"依法依规，永续经营";
        modularHead.moreBtn.text = @"更多>";
        modularHead.moreBtnBlock = ^{
            //更多按钮点击回调
            
        };
        return modularHead;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return 40;
    }
    else if (section == 3 || section == 4){
        return 46;
    }
    else{
        return 0.001;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 创建常量标识符
    static NSString *identifier1 = @"BannerCell";
    static NSString *identifier2 = @"NoticeBannerCell";
    static NSString *identifier3 = @"JNBarChartCell";
    static NSString *identifier4 = @"JNModularACell";
    
    //banner图片轮播
    if (indexPath.section == 0 && indexPath.row == 0) {
        // 从重用队列里查找可重用的cell
        BannerCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier1];
        //模拟图片轮播数据
        NSArray *imagesURLStrings = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544014397927&di=e809fc53be7265ad5365a0c2d586335d&imgtype=0&src=http%3A%2F%2Fpic1a.nipic.com%2F2009-01-07%2F20091713417344_2.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544609146&di=ad96084fee2918dcec8add42a009d2d4&imgtype=jpg&er=1&src=http%3A%2F%2Fpic19.nipic.com%2F20120308%2F4970979_102637717125_2.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544609148&di=1cdc8b1d92af080af71cc7e76f4d1126&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F015da9554971170000019ae9f43459.jpg%402o.jpg"];
        // 这里涉及数据更新不能重用
        cell = [[BannerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1 data:imagesURLStrings];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    //banner公告轮播
    else if(indexPath.section == 1 && indexPath.row == 0){
        // 从重用队列里查找可重用的cell
        NoticeBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier2];
        //模拟轮播数据
        NSArray *title = @[@"公告滚动显示，时间间隔2秒，动效时长0.5秒。",@"最多显示字数，根据手机屏幕宽度进行调节，显示不完的字用省略号。",@"公告的条数，顺序，链接，均为可配置内容。"];
        // 这里涉及数据更新不能重用
        cell = [[NoticeBannerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier2 data:title];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    //数据视图
    else if(indexPath.section == 2 && indexPath.row == 0){
        // 从重用队列里查找可重用的cell
        JNBarChartCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier3];
        //模拟轮播数据
        NSDictionary *data = @{@"payUserCount":@"8",@"yesterDayAmount":@"399",@"commission":@"66%",@"barData":@[@200,@408,@100,@600,@0,@99,@333]};
        // 判断是否找到可重用
        if (!cell) {
            cell = [[JNBarChartCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier3];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        [cell reloadData:data];
        cell.detailItemBlock = ^(NSUInteger index) {
            //101 102 103
            
        };
        
        return cell;
    }
    //模块B
    else if (indexPath.section == 3 && indexPath.row == 0){
        // 从重用队列里查找可重用的cell
        JNModularACell *cell = [tableView dequeueReusableCellWithIdentifier:identifier4];
        //模拟数据
        NSArray *dic = @[@{@"id": @23,@"sortId": @1,@"title": @"文章标题文章标题文章标题文章标题",@"subTitle": @"副标题1",@"imageUrl": @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544014397927&di=e809fc53be7265ad5365a0c2d586335d&imgtype=0&src=http%3A%2F%2Fpic1a.nipic.com%2F2009-01-07%2F20091713417344_2.jpg",@"linkType": @"id",@"linkData": @"1"},
                         @{@"id": @24,@"sortId": @1,@"title": @"文章标题文章标题文章标题文章标题",@"subTitle": @"副标题1",@"imageUrl": @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544609146&di=ad96084fee2918dcec8add42a009d2d4&imgtype=jpg&er=1&src=http%3A%2F%2Fpic19.nipic.com%2F20120308%2F4970979_102637717125_2.jpg",@"linkType": @"id",@"linkData": @"1"},
                         @{@"id": @25,@"sortId": @1,@"title": @"文章标题文章标题文章标题文章标题",@"subTitle": @"副标题1",@"imageUrl": @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544609148&di=1cdc8b1d92af080af71cc7e76f4d1126&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F015da9554971170000019ae9f43459.jpg%402o.jpg",@"linkType": @"id",@"linkData": @"1"}];
        // 这里涉及数据更新不能重用
        cell = [[JNModularACell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier4 data:dic];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.selectedBlock = ^(NSInteger _id, NSInteger index) {
            JNLOGDebug(@"id:%ld 点击了第%ld张图",_id,index);
        };
        return cell;
    }
    //模块A
    else if (indexPath.section == 4 && indexPath.row == 0){
        // 从重用队列里查找可重用的cell
        JNModularACell *cell = [tableView dequeueReusableCellWithIdentifier:identifier4];
        //模拟数据
        NSArray *dic = @[@{@"id": @23,@"sortId": @1,@"title": @"文章标题文章标题文章标题文章标题",@"subTitle": @"副标题1",@"imageUrl": @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544014397927&di=e809fc53be7265ad5365a0c2d586335d&imgtype=0&src=http%3A%2F%2Fpic1a.nipic.com%2F2009-01-07%2F20091713417344_2.jpg",@"linkType": @"id",@"linkData": @"1"},
                         @{@"id": @24,@"sortId": @1,@"title": @"文章标题文章标题文章标题文章标题",@"subTitle": @"副标题1",@"imageUrl": @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544609146&di=ad96084fee2918dcec8add42a009d2d4&imgtype=jpg&er=1&src=http%3A%2F%2Fpic19.nipic.com%2F20120308%2F4970979_102637717125_2.jpg",@"linkType": @"id",@"linkData": @"1"},
                         @{@"id": @25,@"sortId": @1,@"title": @"文章标题文章标题文章标题文章标题",@"subTitle": @"副标题1",@"imageUrl": @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544609148&di=1cdc8b1d92af080af71cc7e76f4d1126&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F015da9554971170000019ae9f43459.jpg%402o.jpg",@"linkType": @"id",@"linkData": @"1"}];
        // 这里涉及数据更新不能重用
        cell = [[JNModularACell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier4 data:dic];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.selectedBlock = ^(NSInteger _id, NSInteger index) {
            JNLOGDebug(@"id:%ld 点击了第%ld张图",_id,index);
        };
        return cell;
    }
    else{
        return nil;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //banner图片轮播
    if (indexPath.section == 0 && indexPath.row == 0) {
        return DEVICE_Height_Scale * 150;
    }
    //banner公告轮播
    else if (indexPath.section == 1 && indexPath.row == 0){
        return 51;
    }
    //数据视图
    else if (indexPath.section == 2 && indexPath.row == 0){
        return 300;
    }
    //模块A、B
    else if ((indexPath.section == 3 || indexPath.section == 4) && indexPath.row == 0){
        return 120;
    }
    else{
        return 0;
    }
}

/** 设置每组返回多少行 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 || section == 1 || section == 2) {
        return 1;
    }else{
        //TODO:判断模块类型返回相应的数据数量 模块B为1（根据返回结果返回数量） 模块A为2（返回1个）
        
        return 1;
    }
}

/** 设置返回多少组 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
/** 取消分组头悬停 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 46;
    if (_tableView.contentOffset.y <= sectionHeaderHeight && _tableView.contentOffset.y>=0) {
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    } else if (_tableView.contentOffset.y >= sectionHeaderHeight) {
        _tableView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (void)setupUI {
    [super setupUI];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"玖链游戏平台";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
    //设置回调（一旦你进入刷新状态，然后调用target的动作，即调用[self loadNewData]）
    _tableView.mj_header.automaticallyChangeAlpha = YES;
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉刷新！");
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

@end
