// Copyright (c) 2014 evolved.io (http://evolved.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import DrawerController

enum DrawerAnimationType: Int {
    case None
    case Slide
    case SlideAndScale
    case SwingingDoor
    case Parallax
    case AnimatedBarButton
}

class ExampleDrawerVisualStateManager: NSObject {
    var leftDrawerAnimationType: DrawerAnimationType = .Slide
    var rightDrawerAnimationType: DrawerAnimationType = .Slide
    
    class var sharedManager: ExampleDrawerVisualStateManager {
        struct Static {
            static let instance: ExampleDrawerVisualStateManager = ExampleDrawerVisualStateManager()
        }
        
        return Static.instance
    }
    
    func drawerVisualStateBlockForDrawerSide(drawerSide: DrawerSide) -> DrawerControllerDrawerVisualStateBlock? {
        var animationType: DrawerAnimationType
        
        if drawerSide == DrawerSide.Left {
            animationType = self.leftDrawerAnimationType
        } else {
            animationType = self.rightDrawerAnimationType
        }
        
        var visualStateBlock: DrawerControllerDrawerVisualStateBlock?
        
        switch animationType {
        case .Slide:
            visualStateBlock = DrawerVisualState.slideVisualStateBlock
        case .SlideAndScale:
            visualStateBlock = DrawerVisualState.slideAndScaleVisualStateBlock
        case .Parallax:
            visualStateBlock = DrawerVisualState.parallaxVisualStateBlock(2.0)
        case .SwingingDoor:
            visualStateBlock = DrawerVisualState.swingingDoorVisualStateBlock
        case .AnimatedBarButton:
            visualStateBlock = DrawerVisualState.animatedHamburgerButtonVisualStateBlock
        default:
            visualStateBlock = { drawerController, drawerSide, percentVisible in
                var sideDrawerViewController: UIViewController?
                var transform = CATransform3DIdentity
                var maxDrawerWidth: CGFloat = 0.0
                
                if drawerSide == .Left {
                    sideDrawerViewController = drawerController.leftDrawerViewController
                    maxDrawerWidth = drawerController.maximumLeftDrawerWidth
                } else if drawerSide == .Right {
                    sideDrawerViewController = drawerController.rightDrawerViewController
                    maxDrawerWidth = drawerController.maximumRightDrawerWidth
                }
                
                if percentVisible > 1.0 {
                    transform = CATransform3DMakeScale(percentVisible, 1.0, 1.0)
                    
                    if drawerSide == .Left {
                        transform = CATransform3DTranslate(transform, maxDrawerWidth * (percentVisible - 1.0) / 2, 0.0, 0.0)
                    } else if drawerSide == .Right {
                        transform = CATransform3DTranslate(transform, -maxDrawerWidth * (percentVisible - 1.0) / 2, 0.0, 0.0)
                    }
                }
                
                sideDrawerViewController?.view.layer.transform = transform
            }
        }
        
        return visualStateBlock
    }
}
