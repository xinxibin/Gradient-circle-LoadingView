//
//  GMView.swift
//  图层拼接渐变线
//
//  Created by Xinxibin on 16/8/8.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class GMView: UIView {
    
    var shapeLayer:CAShapeLayer!
    var layer1:CAShapeLayer!
    
    var colors1:[CGColor] = [UIColor.init(red: 137.0/255.0, green: 137.0/255.0, blue: 137.0/255.0, alpha: 1).CGColor,UIColor.blackColor().CGColor]
    
    var colors2:[CGColor] = [UIColor.init(red: 110/255.0, green: 110/255.0, blue: 110/255.0, alpha: 1).CGColor,UIColor.whiteColor().CGColor]
    
    var strokeEndFloat:CGFloat = 0 {
        didSet {
            layer1.strokeEnd = strokeEndFloat
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setUI() {
        
        shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        self.layer.addSublayer(shapeLayer)
        
        let leftLayer = CAGradientLayer()
        leftLayer.frame  = CGRectMake(0, 0, 240, 120)
        leftLayer.colors = colors1
        leftLayer.startPoint = CGPointMake(0, 0.5)
        leftLayer.endPoint   = CGPointMake(1, 0.5)
        shapeLayer.addSublayer(leftLayer)
        
        let rightLayer = CAGradientLayer()
        rightLayer.frame  = CGRectMake(0, 120, 240, 120)
        rightLayer.colors = colors2
        rightLayer.startPoint = CGPointMake(0, 0.5)
        rightLayer.endPoint   = CGPointMake(1, 0.5)
        shapeLayer.addSublayer(rightLayer)
        
        layer1 = CAShapeLayer()
        layer1.frame = self.bounds
        layer1.path = UIBezierPath(arcCenter: CGPointMake(120, 120), radius: 100, startAngle: CGFloat(M_PI/30), endAngle: 2 * CGFloat(M_PI) - CGFloat(M_PI/30), clockwise: true).CGPath
        layer1.lineWidth    = 5
        layer1.lineCap      = kCALineCapRound
        layer1.lineJoin     = kCALineJoinRound
        layer1.strokeColor  = UIColor.blackColor().CGColor
        layer1.fillColor    = UIColor.clearColor().CGColor
        
        shapeLayer.mask = layer1
        
        startLoading()
    }
    
    func startLoading() {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue   =  2 * M_PI
        animation.duration = 1.25
        animation.repeatCount = HUGE
        self.layer.addAnimation(animation, forKey: "")
        
    }
    
}
