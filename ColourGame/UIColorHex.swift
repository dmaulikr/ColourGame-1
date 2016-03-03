//
//  UIColorHex.swift
//  ColourGame
//
//  Created by Olgu on 19/02/16.
//  Copyright © 2016 Olgu Sirman. All rights reserved.
//

import UIKit

/** Extends UIColor to initialize UIColor using hex values, f.e. UIColor(rgb: 0x8046A2) */

extension UIColor {

    convenience init(rgb: Int, alpha: CGFloat) {
        let r = CGFloat((rgb & 0xFF0000) >> 16)/255
        let g = CGFloat((rgb & 0xFF00) >> 8)/255
        let b = CGFloat(rgb & 0xFF)/255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    convenience init(rgb: Int) {
        self.init(rgb:rgb, alpha:1.0)
    }
}

extension UIColor {
  
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

//Usage
//let color = UIColor(rgb: 0x8046A2)
//let colorWithAlpha = UIColor(rgb: 0x8046A2, alpha: 0.5)

//////
/*
extension UIColor
{
    
    convenience init(hexColorCode: String)
    {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        if hexColorCode.hasPrefix("#")
        {
            let index   = advance(hexColorCode.startIndex, 1)
            let hex     = hexColorCode.substringFromIndex(index)
            let scanner = NSScanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            
            if scanner.scanHexLongLong(&hexValue)
            {
                if countElements(hex) == 6
                {
                    red   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)  / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF) / 255.0
                }
                else if countElements(hex) == 8
                {
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                }
                else
                {
                    print("invalid hex code string, length should be 7 or 9")
                }
            }
            else
            {
                print("scan hex error")
            }
        }
        else
        {
            print("invalid hex code string, missing '#' as prefix")
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
}

extension UIColor
    
{
    /**
     Create non-autoreleased color with in the given hex string and alpha
     
     :param:   hexString
     :param:   alpha
     :returns: color with the given hex string and alpha
     
     
     Example:
     
     // With hash
     let color: UIColor = UIColor(hexString: "#ff8942")
     
     // Without hash, with alpha
     let secondColor: UIColor = UIColor(hexString: "ff8942", alpha: 0.5)
     
     // Short handling
     let shortColorWithHex: UIColor = UIColor(hexString: "fff")
     
     
     */
    convenience init(hexString: String, alpha: Float)
    {
        var hex = hexString
        
        // Check for hash and remove the hash
        if hex.hasPrefix("#")
        {
            hex = hex.substringFromIndex(advance(hex.startIndex, 1))
        }
        
        // Check for string length
        assert(countElements(hex) == 6 || countElements(hex) == 3)
        
        // Deal with 3 character Hex strings
        if countElements(hex) == 3
        {
            var redHex   = hex.substringToIndex(advance(hex.startIndex, 1))
            var greenHex = hex.substringWithRange(Range<String.Index>(start: advance(hex.startIndex, 1), end: advance(hex.startIndex, 2)))
            var blueHex  = hex.substringFromIndex(advance(hex.startIndex, 2))
            
            hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
        }
        
        let redHex = hex.substringToIndex(advance(hex.startIndex, 2))
        let greenHex = hex.substringWithRange(Range<String.Index>(start: advance(hex.startIndex, 2), end: advance(hex.startIndex, 4)))
        let blueHex = hex.substringWithRange(Range<String.Index>(start: advance(hex.startIndex, 4), end: advance(hex.startIndex, 6)))
        
        var redInt:   CUnsignedInt = 0
        var greenInt: CUnsignedInt = 0
        var blueInt:  CUnsignedInt = 0
        
        NSScanner(string: redHex).scanHexInt(&redInt)
        NSScanner(string: greenHex).scanHexInt(&greenInt)
        NSScanner(string: blueHex).scanHexInt(&blueInt)
        
        self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
    }
    
    
    
    /**
     Create non-autoreleased color with in the given hex value and alpha
     
     :param:   hex
     :param:   alpha
     :returns: color with the given hex value and alpha
     
     Example:
     let secondColor: UIColor = UIColor(hex: 0xff8942, alpha: 0.5)
     
     */
    
    convenience init(hex: Int, alpha: Float)
    {
        var hexString = NSString(format: "%2X", hex)
        self.init(hexString: hexString, alpha: alpha)
    }
    
}
*/
