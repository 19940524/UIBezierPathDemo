//
//  DrawingBoard.m
//  Painting
//
//  Created by 薛国宾 on 16/5/3.
//  Copyright © 2016年 千里之行始于足下. All rights reserved.
//

#import "DrawingBoard.h"
//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)

#define PNGrey          [UIColor colorWithRed:246.0 / 255.0 green:246.0 / 255.0 blue:246.0 / 255.0 alpha:1.0f]
#define PNLightBlue     [UIColor colorWithRed:94.0 / 255.0 green:147.0 / 255.0 blue:196.0 / 255.0 alpha:1.0f]
#define PNGreen         [UIColor colorWithRed:77.0 / 255.0 green:186.0 / 255.0 blue:122.0 / 255.0 alpha:1.0f]
#define PNTitleColor    [UIColor colorWithRed:0.0 / 255.0 green:189.0 / 255.0 blue:113.0 / 255.0 alpha:1.0f]
#define PNButtonGrey    [UIColor colorWithRed:141.0 / 255.0 green:141.0 / 255.0 blue:141.0 / 255.0 alpha:1.0f]
#define PNLightGreen    [UIColor colorWithRed:77.0 / 255.0 green:216.0 / 255.0 blue:122.0 / 255.0 alpha:1.0f]
#define PNFreshGreen    [UIColor colorWithRed:77.0 / 255.0 green:196.0 / 255.0 blue:122.0 / 255.0 alpha:1.0f]
#define PNDeepGreen     [UIColor colorWithRed:77.0 / 255.0 green:176.0 / 255.0 blue:122.0 / 255.0 alpha:1.0f]
#define PNRed           [UIColor colorWithRed:245.0 / 255.0 green:94.0 / 255.0 blue:78.0 / 255.0 alpha:1.0f]
#define PNMauve         [UIColor colorWithRed:88.0 / 255.0 green:75.0 / 255.0 blue:103.0 / 255.0 alpha:1.0f]
#define PNBrown         [UIColor colorWithRed:119.0 / 255.0 green:107.0 / 255.0 blue:95.0 / 255.0 alpha:1.0f]
#define PNBlue          [UIColor colorWithRed:82.0 / 255.0 green:116.0 / 255.0 blue:188.0 / 255.0 alpha:1.0f]
#define PNDarkBlue      [UIColor colorWithRed:121.0 / 255.0 green:134.0 / 255.0 blue:142.0 / 255.0 alpha:1.0f]
#define PNYellow        [UIColor colorWithRed:242.0 / 255.0 green:197.0 / 255.0 blue:117.0 / 255.0 alpha:1.0f]
#define PNWhite         [UIColor colorWithRed:255.0 / 255.0 green:255.0 / 255.0 blue:255.0 / 255.0 alpha:1.0f]
#define PNDeepGrey      [UIColor colorWithRed:99.0 / 255.0 green:99.0 / 255.0 blue:99.0 / 255.0 alpha:1.0f]
#define PNPinkGrey      [UIColor colorWithRed:200.0 / 255.0 green:193.0 / 255.0 blue:193.0 / 255.0 alpha:1.0f]
#define PNHealYellow    [UIColor colorWithRed:245.0 / 255.0 green:242.0 / 255.0 blue:238.0 / 255.0 alpha:1.0f]
#define PNLightGrey     [UIColor colorWithRed:225.0 / 255.0 green:225.0 / 255.0 blue:225.0 / 255.0 alpha:1.0f]
#define PNCleanGrey     [UIColor colorWithRed:251.0 / 255.0 green:251.0 / 255.0 blue:251.0 / 255.0 alpha:1.0f]
#define PNLightYellow   [UIColor colorWithRed:241.0 / 255.0 green:240.0 / 255.0 blue:240.0 / 255.0 alpha:1.0f]
#define PNDarkYellow    [UIColor colorWithRed:152.0 / 255.0 green:150.0 / 255.0 blue:159.0 / 255.0 alpha:1.0f]
#define PNPinkDark      [UIColor colorWithRed:170.0 / 255.0 green:165.0 / 255.0 blue:165.0 / 255.0 alpha:1.0f]
#define PNCloudWhite    [UIColor colorWithRed:244.0 / 255.0 green:244.0 / 255.0 blue:244.0 / 255.0 alpha:1.0f]
#define PNBlack         [UIColor colorWithRed:45.0 / 255.0 green:45.0 / 255.0 blue:45.0 / 255.0 alpha:1.0f]
#define PNStarYellow    [UIColor colorWithRed:252.0 / 255.0 green:223.0 / 255.0 blue:101.0 / 255.0 alpha:1.0f]
#define PNTwitterColor  [UIColor colorWithRed:0.0 / 255.0 green:171.0 / 255.0 blue:243.0 / 255.0 alpha:1.0]
#define PNWeiboColor    [UIColor colorWithRed:250.0 / 255.0 green:0.0 / 255.0 blue:33.0 / 255.0 alpha:1.0]
#define PNiOSGreenColor [UIColor colorWithRed:98.0 / 255.0 green:247.0 / 255.0 blue:77.0 / 255.0 alpha:1.0]

@implementation DrawingBoard


- (void)drawRect:(CGRect)rect {

    UIColor *brushColor = [UIColor whiteColor];
    
    // 根据一个Rect 画一个矩形曲线
    UIBezierPath *rectangular = [UIBezierPath bezierPathWithRect:CGRectMake(5, 5, 30, 30)];
    [PNRed set];
    [rectangular fill];
    [brushColor set];
    [rectangular stroke];
    
    // 根据一个Rect 画一个椭圆曲线  Rect为正方形时 画的是一个圆
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(40, 5, 50, 30)];
    [PNBlue set];
    [oval fill];
    [brushColor set];
    [oval stroke];
    
    // 根据一个Rect 画一个圆角矩形曲线 (Radius:圆角半径)    当Rect为正方形时且Radius等于边长一半时 画的是一个圆
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(95, 5, 40, 30) cornerRadius:5];
    [PNStarYellow set];
    [roundedRect fill];
    [brushColor set];
    [roundedRect stroke];
    
    // 根据一个Rect 针对四角中的某个或多个角设置圆角
    UIBezierPath *roundedRect2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(140, 5, 40, 30) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 50)];
    [PNFreshGreen set];
    [roundedRect2 fill];
    [brushColor set];
    [roundedRect2 stroke];

    // 以某个中心点画弧线
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 15) radius:20 startAngle:0 endAngle:degreesToRadian(90) clockwise:YES];
    [brushColor set];
    [arcPath stroke];
    
    // 添加一个弧线
    UIBezierPath *arcPath2 = [UIBezierPath bezierPath];
    [arcPath2 moveToPoint:CGPointMake(230, 30)];
    [arcPath2 addArcWithCenter:CGPointMake(265, 30) radius:25 startAngle:degreesToRadian(180) endAngle:degreesToRadian(360) clockwise:YES];
    // 添加一个UIBezierPath
    [arcPath2 appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(265, 30) radius:20 startAngle:0 endAngle:M_PI*2 clockwise:YES]];
    [PNStarYellow set];
    [arcPath2 stroke];
    
    // 根据CGPath创建并返回一个新的UIBezierPath对象
    UIBezierPath *be = [self bezierPathWithCGPath];
    [PNRed set];
    [be stroke];
    
    // 二次贝塞尔曲线
    UIBezierPath *quadBe = [UIBezierPath bezierPath];
    [quadBe moveToPoint:CGPointMake(30, 150)];
    [quadBe addQuadCurveToPoint:CGPointMake(130, 150) controlPoint:CGPointMake(30, 70)];
    
    UIBezierPath *quadBe2 = [UIBezierPath bezierPath];
    [quadBe2 moveToPoint:CGPointMake(160, 150)];
    [quadBe2 addQuadCurveToPoint:CGPointMake(260, 150) controlPoint:CGPointMake(210, 50)];
    [quadBe2 appendPath:quadBe];
    quadBe2.lineWidth = 1.5f;
    quadBe2.lineCapStyle = kCGLineCapSquare;
    quadBe2.lineJoinStyle = kCGLineJoinRound;
    [brushColor set];
    [quadBe2 stroke];
    
    // 三次贝塞尔曲线
    UIBezierPath *threePath = [UIBezierPath bezierPath];
    [threePath moveToPoint:CGPointMake(30, 250)];
    [threePath addCurveToPoint:CGPointMake(260, 230) controlPoint1:CGPointMake(120, 180) controlPoint2:CGPointMake(150, 260)];
    threePath.lineWidth = 1.5f;
    threePath.lineCapStyle = kCGLineCapSquare;
    threePath.lineJoinStyle = kCGLineJoinRound;
    [brushColor set];
    [threePath stroke];
}

- (UIBezierPath *)bezierPathWithCGPath {
    UIBezierPath *framePath;
    CGFloat arrowWidth = 14;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rectangle = CGRectInset(CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetWidth(self.bounds)), 3,3);
    
    CGPoint p[3] = {
        
    {CGRectGetMidX(self.bounds)-arrowWidth/2, CGRectGetWidth(self.bounds)-6},
        
    {CGRectGetMidX(self.bounds)+arrowWidth/2, CGRectGetWidth(self.bounds)-6},
        
    {CGRectGetMidX(self.bounds), CGRectGetHeight(self.bounds)-4}
        
    };
    
    CGPathAddRoundedRect(path, NULL, rectangle, 5, 5);
    
    CGPathAddLines(path, NULL, p, 3);
    
    CGPathCloseSubpath(path);
    // 根据CGPath创建并返回一个新的UIBezierPath对象
    framePath = [UIBezierPath bezierPathWithCGPath:path];
    
    CGPathRelease(path);
    
    return framePath;
}


@end
