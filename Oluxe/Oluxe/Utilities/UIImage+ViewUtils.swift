//
//  UIImage+ViewUtils.swift
//  Oluxe
//
//  Created by Jiang Chuncheng on 3/3/15.
//  Copyright (c) 2015 MorganStark. All rights reserved.
//

import UIKit

extension UIImage {
    class func imageWithColor(color: UIColor, forSize size: CGSize) -> UIImage {
        var rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContext(rect.size);
        var context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
}
