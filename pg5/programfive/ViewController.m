#import "ViewController.h" //  ViewController.m pg5 Ben Harris
@interface ViewController () @end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *c = [[UIView alloc] initWithFrame:CGRectMake(arc4random_uniform(self.view.bounds.size.width - 100), arc4random_uniform(self.view.bounds.size.height - 100), 100, 100)];
    [self.view addSubview:c];
    
    CAShapeLayer *l = [CAShapeLayer layer];
    [l setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)] CGPath]];
    [l setBackgroundColor:(__bridge CGColorRef _Nullable)([UIColor blackColor])];
    [[c layer] addSublayer:l];
    
    int cnt = 0, i = 0; CGPoint d = CGPointMake(100 * arc4random_uniform(2) == 1 ? 1 : -1, 100 * arc4random_uniform(2) == 1 ? 1 : -1);
    while (cnt < 11) {
        if (cnt > 11) break; i++;
        [UIView animateWithDuration:0.01f delay:(i*0.01f) options:UIViewAnimationOptionCurveLinear animations:^(void){c.center = CGPointMake(c.center.x + d.x, c.center.y + d.y);} completion:nil];
        if (c.center.x < 50 || c.center.x > (self.view.bounds.size.width - 50))  {d.x = -d.x; cnt++;}
        if (c.center.y < 50 || c.center.y > (self.view.bounds.size.height - 50)) {d.y = -d.y; cnt++;}
    }
}@end
