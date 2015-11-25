//
//  HomeViewController.swift
//  Miyu
//
//  Created by Cee on 25/11/2015.
//  Copyright © 2015 Cee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let offsetX = textField.frame.origin.x
//        let offsetY = textField.frame.origin.y
//        let width = textField.frame.size.width
//        let height = textField.frame.size.height
//        
//        let path = UIBezierPath()
//        path.lineWidth = 5.0
//        path.lineCapStyle = CGLineCap.Round
//        path.lineJoinStyle = CGLineJoin.Round
//        
//        path.moveToPoint(CGPointMake(offsetX + width / 2.0, offsetY))
//        path.addCurveToPoint(CGPointMake(offsetX, offsetY + height / 2.0),
//            controlPoint1: CGPointMake(offsetX + 10, offsetY),
//            controlPoint2: CGPointMake(offsetX, offsetY))
//        
//        path.moveToPoint(CGPointMake(offsetX, offsetY + height / 2.0))
//        path.addCurveToPoint(CGPointMake(offsetX + width / 2.0, offsetY + height),
//            controlPoint1: CGPointMake(offsetX, offsetY + height),
//            controlPoint2: CGPointMake(offsetX + 10, offsetY + height))
//        
//        path.moveToPoint(CGPointMake(offsetX + width / 2.0, offsetY + height))
//        path.addCurveToPoint(CGPointMake(offsetX + width, offsetY + height / 2.0),
//            controlPoint1: CGPointMake(offsetX + width - 10, offsetY + height),
//            controlPoint2: CGPointMake(offsetX + width, offsetY + height))
//        
//        path.moveToPoint(CGPointMake(offsetX + width, offsetY + height / 2.0))
//        path.addCurveToPoint(CGPointMake(offsetX + width / 2.0, offsetY),
//            controlPoint1: CGPointMake(offsetX + width, offsetY),
//            controlPoint2: CGPointMake(offsetX + width - 10, offsetY))
//        path.addLineToPoint(CGPointMake(offsetX + width / 2.0, offsetY))
//        path.addLineToPoint(CGPointMake(offsetX, offsetY + height / 2.0))
//        path.addLineToPoint(CGPointMake(offsetX + width / 2.0, offsetY + height))
//        path.addLineToPoint(CGPointMake(offsetX + width, offsetY + height / 2.0))
//        path.closePath()
//        
//        let layer = CAShapeLayer()
//        layer.strokeColor = UIColor.clearColor().CGColor
//        layer.fillColor = UIColor.grayColor().CGColor
//        layer.lineWidth = 1
//        layer.path = path.CGPath
//        layer.frame = view.frame
//        view.layer.addSublayer(layer)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
