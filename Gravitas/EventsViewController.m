//
//  EventsViewController.m
//  Gravitas
//
//  Created by Keshav Bansal on 17/07/15.
//  Copyright (c) 2015 Keshav Bansal. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    x=1;
    save=@"data";
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor=[UIColor blackColor];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Loading..."];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [tv addSubview:refreshControl];
    array=[[NSMutableArray alloc]init];
    arrayA=[[NSMutableArray alloc]init];
    if([[NSUserDefaults standardUserDefaults] objectForKey:save])
    {
        x=0;
        array=[[NSUserDefaults standardUserDefaults] objectForKey:save];
        [self sort];
    }
    request = [[NSMutableURLRequest alloc]init];
    NSString *st=[NSString stringWithFormat:@"https://gravitas-eshwa.rhcloud.com/eventapi.php"];
    [request setURL:[NSURL URLWithString:st]];
    [self requesting:request];
}

-(IBAction)searchEvent
{
    [UIView transitionWithView:searchView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{searchView.hidden=NO;}
                    completion:NULL];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    int k=0;
    array=[[NSUserDefaults standardUserDefaults] objectForKey:save];
    NSDictionary *dict=[[NSDictionary alloc]init];
    arrayB=arrayA;
    arrayA = [[NSMutableArray alloc]init];
    for (int i=0; i<array.count; i++) {
        dict = [array objectAtIndex:i];
        NSString *nm=[dict valueForKey:@"name"];
        if ([nm rangeOfString:searchBar.text options:NSCaseInsensitiveSearch].location == NSNotFound);
        else{
            [arrayA addObject:dict];
            k=1;
        }
    }
    if (k==1){
        [tv reloadData];
    }
    [searchBar resignFirstResponder];
    [self.view removeGestureRecognizer:tap];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [search resignFirstResponder];
    [self.view removeGestureRecognizer:tap];
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped)];
    [self.view addGestureRecognizer:tap];
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self.view removeGestureRecognizer:tap];
}
-(void)tapped
{
    [self.view removeGestureRecognizer:tap];
    [search resignFirstResponder];
}

- (void)refresh:(UIRefreshControl *)refreshControl
{
    x=1;
    [self requesting:request];
    [refreshControl endRefreshing];
    [tv reloadData];
}
-(void)requesting:(NSMutableURLRequest*)req
{
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    if (conn) {
        NSLog(@"Connection Successful");
    }
    else{
        NSLog(@"Connection could not be made");
    }
    webData = [[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *strRes = [[NSString alloc]initWithBytes:[webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    [self handleResponse:strRes];
}
-(void)handleResponse:(NSString*)data
{
    SBJsonParser *json = [[SBJsonParser alloc]init];
    NSError *jsonError;
    array=[[NSMutableArray alloc]init];
    array =[json objectWithString:data error:&jsonError];
    [self sort];
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:save];
    [tv reloadData];
    tv.hidden=NO;
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (x==1){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Unable to connect!" message:@"You are not connected to the internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    x=0;
    array=[[NSMutableArray alloc]init];
    array=[[NSUserDefaults standardUserDefaults] objectForKey:save];
    [self sort];
    [tv reloadData];
}
-(void)sort
{
    arrayA=[[NSMutableArray alloc]init];
    int i;
    NSString *str,*st;
    str=@"tid";
    if (self.type==1) {
        st=@"1";
    }
    if (self.type==2) {
        st=@"2";
    }
    if (self.type==3) {
        st=@"3";
    }
    if (self.type==4) {
        st=@"4";
    }
    if (self.type==5) {
        st=@"5";
    }
    if (self.type==6) {
        st=@"6";
    }
    if (self.type==7) {
        st=@"7";
    }
    if (self.type==8) {
        st=@"8";
    }
    if (self.type==9) {
        st=@"9";
    }
    if (self.type==10) {
        st=@"10";
    }
    if (self.type==11) {
        st=@"11";
    }
    if (self.type==12) {
        st=@"12";
    }
    if (self.type==13) {
        st=@"13";
    }
    for (i=0; i<array.count; i++) {
        if ([[[array objectAtIndex:i] valueForKey:str] isEqualToString:st]) {
            [arrayA addObject:[array objectAtIndex:i]];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayA.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellid=@"cell";
    NSDictionary *dict;
    CustomCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell==nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:cellid];
        cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    }
    dict = [arrayA objectAtIndex:indexPath.row];
    
    self.tid=[dict valueForKey:@"tid"];
    cell.name.text=[dict valueForKey:@"name"];
    cell.venue.text=[dict valueForKey:@"location"];
    cell.time.text=[dict valueForKey:@"timings"];
    {
        if ([self.tid isEqualToString:@"1"]) {
            cell.iv.image= [UIImage imageNamed:@"premium.jpg"];
        }
        else if ([self.tid isEqualToString:@"2"]) {
            cell.iv.image= [UIImage imageNamed:@"Robotix.jpg"];
        }
        else if ([self.tid isEqualToString:@"3"]) {
            cell.iv.image= [UIImage imageNamed:@"bits.jpg"];
        }
        else if ([self.tid isEqualToString:@"4"]) {
            cell.iv.image=[UIImage imageNamed:@"applied.jpg"];
        }
        else if ([self.tid isEqualToString:@"5"]) {
            cell.iv.image=[UIImage imageNamed:@"management.jpg"];
        }
        else if ([self.tid isEqualToString:@"6"]) {
           cell.iv.image=[UIImage imageNamed:@"informal.jpg"];
        }
        else if ([self.tid isEqualToString:@"7"]) {
            cell.iv.image=[UIImage imageNamed:@"builtrix.jpg"];
        }
        else if ([self.tid isEqualToString:@"8"]) {
            cell.iv.image=[UIImage imageNamed:@"circuitrix.jpg"];
        }
        else if ([self.tid isEqualToString:@"9"]) {
            cell.iv.image=[UIImage imageNamed:@"quiz.jpg"];
        }
        else if ([self.tid isEqualToString:@"10"]) {
            cell.iv.image=[UIImage imageNamed:@"online.jpg"];
        }
        else if ([self.tid isEqualToString:@"11"]) {
            cell.iv.image=[UIImage imageNamed:@"bioxyn.jpg"];
        }
        else if ([self.tid isEqualToString:@"12"]) {
            cell.iv.image=[UIImage imageNamed:@"workshop.jpg"];
        }
        else if ([self.tid isEqualToString:@"13"]) {
           cell.iv.image=[UIImage imageNamed:@"school.jpg"];
        }
        
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventInfo *next=[self.storyboard instantiateViewControllerWithIdentifier:@"Event"];
    NSDictionary *dict=[arrayA objectAtIndex:indexPath.row];
    next.dict=dict;
    [self presentViewController:next animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
