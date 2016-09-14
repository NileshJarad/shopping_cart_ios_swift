//
//  ToastView.swift
//  ShoppingCart
//
//  Created by Nilesh Jarad on 14/09/16.
//  Copyright © 2016 Nilesh Jarad. All rights reserved.
//

import UIKit

class ToastView: UIView {
    
    private static let hLabelGap: CGFloat = 40.0
    private static let vLabelGap: CGFloat = 20.0
    private static let hToastGap: CGFloat = 20.0
    private static let vToastGap: CGFloat = 10.0
    
    private var textLabel: UILabel!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    static func makeToast(parentView : UIView , text: String, duration: Double ){
        let labelFrame = CGRectMake(parentView.frame.origin.x + hLabelGap,
                                    parentView.frame.origin.y + vLabelGap,
                                    parentView.frame.width - 2 * hLabelGap,
                                    parentView.frame.height - 2 * vLabelGap)
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(15.0)
        label.text = text
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.numberOfLines = 0
        label.frame = labelFrame
        label.sizeToFit()
        
        let toast = ToastView()
        toast.textLabel = label
        toast.addSubview(label)
        toast.frame = CGRectMake(label.frame.origin.x - hToastGap,
                                 label.frame.origin.y - vToastGap,
                                 label.frame.width + 2 * hToastGap,
                                 label.frame.height + 2 * vToastGap)
        toast.backgroundColor = UIColor.darkGrayColor()
        toast.alpha = 0.0
        toast.layer.cornerRadius = 20.0
        toast.center = parentView.center
        label.center = CGPointMake(toast.frame.size.width / 2, toast.frame.size.height / 2)
        
        parentView.addSubview(toast)
        
        UIView.animateWithDuration(0.4, animations: {
            toast.alpha = 0.9
            label.alpha = 0.9
        })
        
        toast.performSelector(#selector(ToastView.hideSelf), withObject: nil, afterDelay: duration)
    }
    func hideSelf() {
        UIView.animateWithDuration(0.4, animations: {
            self.alpha = 0.0
            self.textLabel.alpha = 0.0
            }, completion: { t in self.removeFromSuperview() })
    }

}
