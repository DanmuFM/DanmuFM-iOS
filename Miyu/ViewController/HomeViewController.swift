//
//  HomeViewController.swift
//  Miyu
//
//  Created by Cee on 25/11/2015.
//  Copyright © 2015 Cee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var danmakuButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let offsetX: CGFloat = 0
        let offsetY: CGFloat = 0
        let width = danmakuButton.frame.size.width
        let height = danmakuButton.frame.size.height
        
        let path = UIBezierPath()
        path.lineWidth = 5.0
        path.lineCapStyle = CGLineCap.Round
        path.lineJoinStyle = CGLineJoin.Round
        
        path.moveToPoint(CGPointMake(offsetX + width / 2.0, offsetY))
        path.addCurveToPoint(CGPointMake(offsetX, offsetY + height / 2.0),
            controlPoint1: CGPointMake(offsetX + 10, offsetY),
            controlPoint2: CGPointMake(offsetX, offsetY))
        
        path.moveToPoint(CGPointMake(offsetX, offsetY + height / 2.0))
        path.addCurveToPoint(CGPointMake(offsetX + width / 2.0, offsetY + height),
            controlPoint1: CGPointMake(offsetX, offsetY + height),
            controlPoint2: CGPointMake(offsetX + 10, offsetY + height))
        
        path.moveToPoint(CGPointMake(offsetX + width / 2.0, offsetY + height))
        path.addCurveToPoint(CGPointMake(offsetX + width, offsetY + height / 2.0),
            controlPoint1: CGPointMake(offsetX + width - 10, offsetY + height),
            controlPoint2: CGPointMake(offsetX + width, offsetY + height))
        
        path.moveToPoint(CGPointMake(offsetX + width, offsetY + height / 2.0))
        path.addCurveToPoint(CGPointMake(offsetX + width / 2.0, offsetY),
            controlPoint1: CGPointMake(offsetX + width, offsetY),
            controlPoint2: CGPointMake(offsetX + width - 10, offsetY))
        path.addLineToPoint(CGPointMake(offsetX + width / 2.0, offsetY))
        path.addLineToPoint(CGPointMake(offsetX, offsetY + height / 2.0))
        path.addLineToPoint(CGPointMake(offsetX + width / 2.0, offsetY + height))
        path.addLineToPoint(CGPointMake(offsetX + width, offsetY + height / 2.0))
        path.closePath()
        
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.clearColor().CGColor
        layer.fillColor = UIColor.grayColor().CGColor
        layer.lineWidth = 1
        layer.path = path.CGPath
        layer.frame = view.frame
        danmakuButton.layer.mask = layer
    }
    
    // MARK: Button Pressed Actions
    @IBAction func channelButtonPressed(sender: AnyObject) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
    
    @IBAction func shareButtonPressed(sender: AnyObject) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle:.ActionSheet)
        alertController.addAction(UIAlertAction(title: "举报", style: .Destructive, handler: nil))
        alertController.addAction(UIAlertAction(title: "浏览器打开", style: .Default, handler: nil))
        alertController.addAction(UIAlertAction(title: "复制链接", style: .Default, handler: nil))
        alertController.addAction(UIAlertAction(title: "分享到微博", style: .Default, handler: nil))
        alertController.addAction(UIAlertAction(title: "添加到收藏夹", style: .Default, handler: nil))
        alertController.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
