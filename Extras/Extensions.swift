//
//  Extensions.swift
//  
//
//  Created by Armani on 20/01/2018.
//

import UIKit


extension UILabel {
    func animateToNumber(_ number: Int, duration: Double) {
        guard number > 0 else { return }
        DispatchQueue.global().async {
            for index in 0...number {
                let sleepTime = UInt32(duration/Double(number) * 1000000.0)
                usleep(sleepTime)
                DispatchQueue.main.async {
                    self.text = "\(index)%"
                }
            }
        }
    }
    func animateToNumberPounds(_ number: Int, duration: Double) {
        guard number > 0 else { return }
        DispatchQueue.global().async {
            for index in 0...number {
                let sleepTime = UInt32(duration/Double(number) * 1000000.0)
                usleep(sleepTime)
                DispatchQueue.main.async {
                    self.text = "£\(index)"
                }
            }
        }
    }
    func animateToNumberPoundsPlus(_ number: Int, duration: Double) {
        guard number > 0 else { return }
        DispatchQueue.global().async {
            for index in 0...number {
                let sleepTime = UInt32(duration/Double(number) * 1000000.0)
                usleep(sleepTime)
                DispatchQueue.main.async {
                    self.text = "+£\(index)"
                }
            }
        }
    }
    func animateToNumberPoundsMinus(_ number: Int, duration: Double) {
        guard number > 0 else { return }
        DispatchQueue.global().async {
            for index in 0...number {
                let sleepTime = UInt32(duration/Double(number) * 1000000.0)
                usleep(sleepTime)
                DispatchQueue.main.async {
                    self.text = "-£\(index)"
                }
            }
        }
    }
}

//Set delays for running code
public func delay(_ delay : Double, closure : @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

extension UIColor {
    func lighter(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage:CGFloat=30.0) -> UIColor? {
        var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
        if(self.getRed(&r, green: &g, blue: &b, alpha: &a)){
            return UIColor(red: min(r + percentage/100, 1.0),
                           green: min(g + percentage/100, 1.0),
                           blue: min(b + percentage/100, 1.0),
                           alpha: a)
        }else{
            return nil
        }
    }
}

