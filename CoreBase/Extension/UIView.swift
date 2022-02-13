//
//  UIView.swift
//  CoreBase
//
//  Created by ArifRachman on 08/02/22.
//

import UIKit

public extension UIView {
  enum Direction: Int {
    case topToBottom = 0
    case bottomToTop
    case leftToRight
    case rightToLeft
  }
  
  func addGradientLayer(direction: Direction = .leftToRight) -> CAGradientLayer {
    let gradientColorOne = UIColor.white.cgColor
    let gradientColorTwo = UIColor(white: 0.90, alpha: 1.0).cgColor
    
    let gradientLayer = CAGradientLayer()
    
    gradientLayer.frame = self.bounds
    gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
    
    switch direction {
    case .topToBottom:
      gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
      gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
      
    case .bottomToTop:
      gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
      gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
      
    case .leftToRight:
      gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
      
    case .rightToLeft:
      gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
    }
    
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.525)
    
    gradientLayer.locations = [0.4, 0.5, 0.6]
    return gradientLayer
  }
  
  func addAnimation(animationSpeed: Float = 1.4) -> CABasicAnimation {
    let animation = CABasicAnimation(keyPath: "locations")
    animation.fromValue = [-1.0, -0.5, 0.0]
    animation.toValue = [1.0, 1.5, 2.0]
    animation.repeatCount = .infinity
    animation.duration = 1.25
    
    return animation
  }
  
  func startAnimation(direction: Direction, animationSpeed: Float) {
    let gradientLayer = addGradientLayer(direction: direction)
    self.layer.addSublayer(gradientLayer)
    let animation = addAnimation(animationSpeed: animationSpeed)
    gradientLayer.add(animation, forKey: animation.keyPath)
  }
  
  func stopAnimation() {
    self.layer.sublayers?.remove(at: 0)
  }
}
