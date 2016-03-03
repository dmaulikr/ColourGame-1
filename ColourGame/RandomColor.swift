//
//  RandomColor.swift
//  ColourGame
//
//  Created by Olgu on 24/02/16.
//  Copyright © 2016 Olgu Sirman. All rights reserved.
//

import Foundation
import SwiftHEXColors

class RandomColor {
    
    var colorScale : (r: String, gb: String) {
    
        get  {
        
        let mainColorLine1 = ["f","e","d","c","b","a","9","8","7"]
        let mainColorLine2 = ["1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
        
        let intermediateColorLine1 = ["e","d","c","b","a","9","8","7","6","5","4","3","2","1","0"]
        //f olmasin, mainColorLine1 en fazla 4 index gerisi olsun yada daha azi
        let intermediateColorLine2 = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
        
        //MainLine1
        let randomChooseML1 = mainColorLine1.chooseOne
        let indexOfchoosenML1 = mainColorLine1.indexOf(randomChooseML1)
        
        //MainLine2
        let randomChooseML2 = mainColorLine2.chooseOne
        
        //IntLine1
        let randomChooseInt1 = intermediateColorLine1.chooseOne
        let indexOfChooseIntL1 = intermediateColorLine1.indexOf(randomChooseInt1)
        
        //MainLine1 - IntLine1 ratio
        let ratioIndex = Int(indexOfchoosenML1! + 4)
        
        //en fazla aralik
        let randomChooseInt1Most = intermediateColorLine1[ratioIndex]
        
        let randomChooseIntL1 = indexOfChooseIntL1! < ratioIndex ? randomChooseInt1Most : randomChooseInt1
        
        //IntLine2
        let randomChooseInt2 = intermediateColorLine2.chooseOne
    
        let r = "\(randomChooseML1)\(randomChooseML2)"
        let gb = "\(randomChooseIntL1)\(randomChooseInt2)"
        
        return (r,gb)
        }
    }
    
    var randomAlpha : Float {
        get {
            
            let alphas : [Float] = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1]
            return alphas.chooseOne
            
        }
    }
   
    var green : UIColor {
        get {
            let scale = colorScale
            let hexString = scale.gb + scale.r + scale.gb
            return UIColor(hexString: hexString, alpha: randomAlpha)!

        }
    }
    
    
    var red : UIColor {
        get {
            let scale = colorScale
            let hexString = scale.r + scale.gb + scale.gb
            return UIColor(hexString: hexString, alpha: randomAlpha)!
        }
    }

    var blue : UIColor {
        get {
            let scale = colorScale
            let hexString = scale.gb + scale.gb + scale.r
            return UIColor(hexString: hexString, alpha: randomAlpha)!
        }
    }


    var cyan : UIColor {
        get {
            let scale = colorScale
            let hexString = scale.gb + scale.r + scale.r
            return UIColor(hexString: hexString, alpha: randomAlpha)!
        }
    }


    var yellow : UIColor {
        get {
            let scale = colorScale
            let hexString = scale.r + scale.r + scale.gb
            return UIColor(hexString: hexString, alpha: randomAlpha)!
        }
    }


    var pink : UIColor {
        get {
            let scale = colorScale
            let hexString = scale.r + scale.gb + scale.r
            return UIColor(hexString: hexString, alpha: randomAlpha)!
        }
    }

    
    var gray : UIColor {
        get {
            let scale = colorScale
            let hexString = scale.r + scale.r + scale.r
            return UIColor(hexString: hexString, alpha: randomAlpha)!
        }
    }


    var black : UIColor {
        get {
            let scale = colorScale
            let hexString = scale.gb + scale.gb + scale.gb
            return UIColor(hexString: hexString, alpha: randomAlpha)!
        }
    }
    
    private var randomColor : (main :String, intermediate: String) {
        
        get {
            let mainColorLine1 = ["f","e","d","c","b","a","9","8","7"]
            let mainColorLine2 = ["1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
            
            let intermediateColorLine1 = ["e","d","c","b","a","9","8","7","6","5","4","3","2","1","0"]
            //f olmasin, mainColorLine1 en fazla 4 index gerisi olsun yada daha azi
            let intermediateColorLine2 = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
            
            
            //MainLine1
            let randomChooseML1 = mainColorLine1.chooseOne
            let indexOfchoosenML1 = mainColorLine1.indexOf(randomChooseML1)
            
            //MainLine2
            let randomChooseML2 = mainColorLine2.chooseOne
            
            
            //IntLine1
            let randomChooseInt1 = intermediateColorLine1.chooseOne
            let indexOfChooseIntL1 = intermediateColorLine1.indexOf(randomChooseInt1)
            
            //MainLine1 - IntLine1 ratio
            let ratioIndex = Int(indexOfchoosenML1! + 4)
            
            //en fazla aralik
            let randomChooseInt1Most = intermediateColorLine1[ratioIndex]
            
            let randomChooseIntL1 = indexOfChooseIntL1! < ratioIndex ? randomChooseInt1Most : randomChooseInt1
            
            //IntLine2
            let randomChooseInt2 = intermediateColorLine2.chooseOne
            
            let r = "\(randomChooseML1)\(randomChooseML2)"
            let gb = "\(randomChooseIntL1)\(randomChooseInt2)"
            
            //let hexString = r + gb + gb
            
            return (r,gb)
            //return hexString
            
        }
    }
    
//    class func colors() {
//        let red : UIColor = UIColor(hexString: red, alpha: 1.0)!
//        let green : UIColor = UIColor(hexString: green, alpha: 1.0)!
//        let blue : UIColor = UIColor(hexString: blue, alpha: 1.0)!
//        let cyan : UIColor = UIColor(hexString: cyan, alpha: 1.0)!
//        let yellow : UIColor = UIColor(hexString: yellow, alpha: 1.0)!
//        let pink : UIColor = UIColor(hexString: pink, alpha: 1.0)!
//        let gray : UIColor = UIColor(hexString: gray, alpha: 1.0)!
//        let black : UIColor = UIColor(hexString: black, alpha: 1.0)!
//        
//    }

    
}
