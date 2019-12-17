//
//  ViewController.swift
//  skeletonLaunch
//
//  Created by Tello on 04/12/2019.
//  Copyright © 2019 Tello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showSkeleton()
    }
    
    func showSkeleton() {
        
        let skeletonView = UIView()
        
        skeletonView.backgroundColor = UIColor.white
        view.addSubview(skeletonView)
        
        let viewHeight = view.frame.height
        
        let cellHeight: CGFloat = 250
        
        let numberOfCells = Int(viewHeight / 2 ) + 1
        
        let skeletonViewHeight = cellHeight * CGFloat(numberOfCells)
        
        skeletonView.frame = CGRect(x: 0, y: 10, width: view.bounds.width, height: skeletonViewHeight)
        
        let backgroundGradientLayer = CAGradientLayer()
        backgroundGradientLayer.frame = skeletonView.bounds
        
        backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        backgroundGradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        backgroundGradientLayer.locations = [0.25, 0.5, 0.75]
        
        backgroundGradientLayer.colors = [UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1.0).cgColor, UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0).cgColor, UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1.0).cgColor]
        
        skeletonView.layer.addSublayer(backgroundGradientLayer)
        
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        
        gradientAnimation.fromValue = [0.0, 0.0, 0.25]
        gradientAnimation.toValue = [0.65, 1.0, 1.0]
        
        gradientAnimation.duration = 1
        gradientAnimation.repeatCount = .greatestFiniteMagnitude
        gradientAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientAnimation.isRemovedOnCompletion = false
        backgroundGradientLayer.add(gradientAnimation, forKey: nil)
        
        let skeletonFrame = UIBezierPath()
        
        let gutterHeight = CGFloat(10)
        
        for i in 0...numberOfCells {
            
            let offset = CGFloat(i) * cellHeight
        
             let profileFrame = UIBezierPath(ovalIn: CGRect(x: 20, y: 10 + offset, width: 60, height: 60))
        
             skeletonFrame.append(profileFrame)
        
             let titleFrame = UIBezierPath(rect: CGRect(x: 90, y: 20 + offset, width: view.bounds.width * 0.6 - 90, height: 8 ))
        
             skeletonFrame.append(titleFrame)
        
             let subTitleFrame = UIBezierPath(rect: CGRect(x: 90, y: 40 + offset, width: view.bounds.width * 0.4 - 90, height: 8))
        
             skeletonFrame.append(subTitleFrame)
        
             let contentFrame1 = UIBezierPath(rect: CGRect(x: 20, y: 100 + offset, width: view.bounds.width * 0.65, height: 8))
        
             skeletonFrame.append(contentFrame1)
        
             let contentFrame2 = UIBezierPath(rect: CGRect(x: 20, y: 120 + offset, width: view.bounds.width * 0.75, height: 8))
             skeletonFrame.append(contentFrame2)
        
             let contentFrame3 = UIBezierPath(rect: CGRect(x: 20, y: 140 + offset, width: view.bounds.width * 0.4, height: 8))
        
             skeletonFrame.append(contentFrame3)
            
            let gutter = UIView(frame: CGRect(x: 0, y: (cellHeight - gutterHeight) + offset, width: view.bounds.width, height: gutterHeight))
            
            gutter.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0)
            
            skeletonView.addSubview(gutter)
        }
        
             let skeletonShape = CAShapeLayer()
        
        skeletonShape.path = skeletonFrame.cgPath
        
        skeletonShape.fillColor = UIColor.black.cgColor
        
        skeletonShape.frame = skeletonView.bounds
        
        backgroundGradientLayer.mask = skeletonShape

    }
    

}

