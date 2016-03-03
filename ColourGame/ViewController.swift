//
//  ViewController.swift
//  ColourGame
//
//  Created by Olgu on 19/02/16.
//  Copyright © 2016 Olgu Sirman. All rights reserved.
//

import UIKit
import SwiftHEXColors
import SpriteKit
import AVFoundation

let screenWidth = UIScreen.mainScreen().bounds.width
let screenHeight = UIScreen.mainScreen().bounds.height

private let boxSide : CGFloat = screenWidth / 10.0
private let padding : CGFloat = 5

class ViewController: UIViewController {

    enum Level {
        case Level1,Level2,Level3, Level4, Level5, Level6, Level7, Level8, Level9, Level10
    }
    
//    var audioPlayers : Array {
//        get {
//            if !audioPlayers {
//               return audioPlayers = []()
//            }
//        }
//    }
    
    var player = AVAudioPlayer()
    
    enum ErrorHandling : ErrorType {
        case PlayerError
    }
    
    @IBOutlet weak var levelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //level-1  4*4 8renk 8 farkli renk
        //level-2  4*4 8renk 8 farkli renk
        //level-3  4*4 8renk 6 farkli renk
        //level-4  4*4 8renk 6 farkli renk
        //level-5  6*6 18renk 6 farkli renk
        //level-6  6*6 18renk 6 farkli renk
        //level-7  6*6 18renk 4 farkli renk
        //level-8  8*8 32renk 4 farkli renk
        //level-9  8*8 32renk 2 farkli renk
        //level-10 8*8 32renk 1 farkli renk
        
        gameLevel(Level.Level1)
        playMusic()
        
        levelLabel.text = "Level 1"
        
    }
    
    @IBOutlet weak var nextLevelButton: UIButton! {
        didSet {
            //nextLevelButton.hidden = true
            nextLevelButton.alpha = 0.0
        }
    }
    
    func playMusic() {
        
        //let soundPath = NSBundle.mainBundle().pathForResource("Colodi.caf", ofType: nil)!
        let soundPath = NSBundle.mainBundle().pathForResource("ColodieLEI", ofType: "caf")!
        
        let soundUrl = NSURL(fileURLWithPath: soundPath)
        
            do {
                player = try AVAudioPlayer(contentsOfURL: soundUrl)
                
                //AVAudioPlayer(contentsOfURL: soundUrl, fileTypeHint: AVFileTypeCoreAudioFormat)
                
                player.prepareToPlay()
                //player.volume = 0.3
                player.delegate = self
                player.numberOfLoops = -1
                player.play()
                
            } catch let playerError {
                print("player Error occured \(playerError)")
                ErrorHandling.PlayerError
            }
    }

    private func stopMusic() {
    
        player.stop()
        
    }
    
    private func buttonAnimateOut() {
    
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: [.CurveEaseOut], animations: { () -> Void in
            
            self.nextLevelButton.alpha = 0.0
      
            }, completion: nil)
        
    }
    
    private func buttonAnimateIn() {
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: [.CurveEaseOut], animations: { () -> Void in
     
            self.nextLevelButton.alpha = 1.0
            
            }, completion: nil)
    
    }
    
    var gameLevelIndex = 1
    
    
    @IBAction func nextLevel(sender: UIButton) {
        
        func gameLevelOptions( lvl : Level, levelName : String ) {
            gameLevel(lvl)
            gameLevelIndex++
            levelLabel.text = levelName
            buttonAnimateOut()
        }
        
        switch gameLevelIndex {
        case 1 :
            gameLevelOptions(.Level2, levelName: "Level 2")
        case 2:
            gameLevelOptions(.Level3, levelName: "Level 3")
        case 3:
            gameLevelOptions(.Level4, levelName: "Level 4")
        case 4:
            gameLevelOptions(.Level5, levelName: "Level 5")
        case 5:
            gameLevelOptions(.Level6, levelName: "Level 6")
        case 6:
            gameLevelOptions(.Level7, levelName: "Level 7")
        case 7:
            gameLevelOptions(.Level8, levelName: "Level 8")
        case 8:
            gameLevelOptions(.Level9, levelName: "Level 9")
        case 9:
            gameLevelOptions(.Level10, levelName: "Level 10")
        case 10:
            debugPrint("Congratulations")
            if gameLevelIndex >= 10 { gameLevelIndex = 10 }
            nextLevelButton.hidden = true
            
        default: break
        }
        
    }
    
    var colorsArrayGlobal = [UIColor]()
    
    private func gameLevel(myLevel : Level) {
    
        var colorsArray : [UIColor] {
            get {
                
                //shuffle helper
                func shuffleColors(var colorsArray : [UIColor]) -> [UIColor] {
                    
                    var shuffledColorsArray = [UIColor]()
                    
                    for _ in 0..<colorsArray.count {
                        let randomIndexNumber = Int( arc4random_uniform( UInt32( colorsArray.count ) ) )
                        let randomIndex = colorsArray[randomIndexNumber]
                        shuffledColorsArray.append(randomIndex)
                        colorsArray.removeAtIndex(randomIndexNumber)
                    }
                    
                    return shuffledColorsArray
                    
                }
                
                var randomAlpha : Float {
                    get {
                        
                        let alphas : [Float] = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1]
                        return alphas.chooseOne
                    }
                }
                
                let rc = RandomColor()
                
                func pickLevel(myLevel : Level) -> [UIColor] {
                  
                    //let renk = UIColor(hexString: randomColor.red, alpha: randomAlpha)!
                    
                    switch myLevel {
                        
                    case .Level1:
                        
                        var colorsArray = [rc.red,rc.green,rc.blue,rc.cyan,rc.yellow,rc.pink,rc.gray,rc.black]
                        colorsArray.appendContentsOf(colorsArray)
                        let shuffledColorsArray = shuffleColors(colorsArray)
                        return shuffledColorsArray
                        
                    case .Level2:
                        
                        var colorsArray = [rc.red,rc.green,rc.blue,rc.cyan,rc.yellow,rc.pink,rc.gray,rc.black]
                        colorsArray.appendContentsOf(colorsArray)
                        let shuffledColorsArray = shuffleColors(colorsArray)
                        return shuffledColorsArray
                        
                    case .Level3:
                        
                        var colorsArray = [rc.red,rc.red,rc.green,rc.blue,rc.blue,rc.cyan,rc.yellow,rc.pink]
                        colorsArray.appendContentsOf(colorsArray)
                        let shuffledColorsArray = shuffleColors(colorsArray)
                        return shuffledColorsArray
                        
                    case .Level4:
                        
                        var colorsArray = [rc.red,rc.red,rc.green,rc.blue,rc.blue,rc.cyan,rc.yellow,rc.pink]
                        colorsArray.appendContentsOf(colorsArray)
                        let shuffledColorsArray = shuffleColors(colorsArray)
                        return shuffledColorsArray
                        
                    case .Level5:
                        
                        var colorsArray = [rc.red,rc.red,rc.red,rc.green,rc.green,rc.green,rc.blue,rc.blue,rc.blue,rc.cyan,rc.cyan,rc.cyan,rc.yellow,rc.yellow,rc.yellow,rc.pink,rc.pink,rc.pink]
                        colorsArray.appendContentsOf(colorsArray)
                        let shuffledColorsArray = shuffleColors(colorsArray)
                        return shuffledColorsArray
                        
                    case .Level6:
                        
                        var colorsArray = [UIColor]()
                        
                        for _ in 1...3 {
                            
                            colorsArray.append(rc.red)
                            colorsArray.append(rc.green)
                            colorsArray.append(rc.blue)
                            colorsArray.append(rc.yellow)
                            colorsArray.append(rc.cyan)
                            colorsArray.append(rc.pink)
                        }
                        
                        colorsArray.appendContentsOf(colorsArray)
                        let shuffledColorsArray = shuffleColors(colorsArray)
                        
                        return shuffledColorsArray
                        
                    case .Level7:
                        
                        var colorsArray = [UIColor]()
                        
                        colorsArray.append(rc.cyan)
                        colorsArray.append(rc.pink)
                        
                        for _ in 1...4 {
                            
                            colorsArray.append(rc.red)
                            colorsArray.append(rc.green)
                            colorsArray.append(rc.blue)
                            colorsArray.append(rc.yellow)
                            
                        }

                        colorsArray.appendContentsOf(colorsArray)
                        let shuffledColorsArray = shuffleColors(colorsArray)
                        return shuffledColorsArray
                        
                    case .Level8:
                        
                        var colorsArray = [UIColor]()
                        
                        for _ in 1...8 {
                            colorsArray.append(rc.red)
                            colorsArray.append(rc.green)
                            colorsArray.append(rc.blue)
                            colorsArray.append(rc.cyan)
                        }

                        colorsArray.appendContentsOf(colorsArray)
                        let shuffledColorsArray = shuffleColors(colorsArray)
                        
                        return shuffledColorsArray
                        
                    case .Level9:
                        
                        var colorsArray = [UIColor]()
                        for _ in 1...16 {
                            
                            colorsArray.append(rc.yellow)
                            colorsArray.append(rc.pink)
                        }
                        colorsArray.appendContentsOf(colorsArray)
                        let shuffledColorsArray = shuffleColors(colorsArray)
                        return shuffledColorsArray
                        
                    case .Level10:
                        
                        var colorArray = [UIColor]()
                        for _ in 1...32 {
                            
                            colorArray.append(rc.green)
                            
                        }
                        colorArray.appendContentsOf(colorArray)
                        let shuffledColorsArray = shuffleColors(colorArray)
                        return shuffledColorsArray
                        
                    }
                }
                return pickLevel(myLevel)
            }
        }

        colorsArrayGlobal.appendContentsOf(colorsArray)
        
        boxesOnScreen(myLevel, colorsArray: colorsArray)
        
    }
    
    private func boxesOnScreen(myLevel : Level, colorsArray : [UIColor]) {
        
        var rows = 4
        var columns = 4
        
            switch myLevel {
           
            case .Level1:
                rows = 4
                columns = 4
            case .Level2:
                rows = 4
                columns = 4
            case .Level3:
                rows = 4
                columns = 4
            case .Level4:
                rows = 4
                columns = 4
            case .Level5:
                rows = 6
                columns = 6
            case .Level6:
                rows = 6
                columns = 6
            case .Level7:
                rows = 6
                columns = 6
            case .Level8:
                rows = 8
                columns = 8
            case .Level9:
                rows = 8
                columns = 8
            case .Level10:
                rows = 8
                columns = 8
            }
        
        //let rows = 4
        //let columns = 4
        
        let firstBoxX = (screenWidth  - ( (CGFloat(columns) * boxSide) + ( (CGFloat(columns) - 1) * padding)) ) / 2
        let firstBoxY = (screenHeight - ( (CGFloat(rows) * boxSide) + ( (CGFloat(rows) - 1) * padding)) ) / 2
        
        let shuffledColors = colorsArray
        
        var colorIndex = 0
        while colorIndex < shuffledColors.count {
            
            for col in 0..<columns{
                for row in 0..<rows{
                    
                    let boxSpace = CGFloat(boxSide + padding)
                    
                    let rowSpace : CGFloat = CGFloat( CGFloat(row) * CGFloat(boxSpace) )
                    let colSpace : CGFloat = CGFloat( CGFloat(col) * CGFloat(boxSpace) )
                    
                    let xFrame = CGRect(x: firstBoxX + rowSpace, y: firstBoxY + colSpace, width: boxSide, height: boxSide)
                    
                    let tag = ((col+1) * 10) + (row + 1)
                    
                    addBox(xFrame, colour: shuffledColors[colorIndex] , tag: tag)
                    
                    colorIndex++
                    //colorsArray().removeAtIndex(colorIndex)
                    
                    
                }
            }
        }
        
    }
    
    var selectedBoxes = [Int]()
    var selectedBoxColors = [UIColor]()
    var selectedBoxView = [UIView]()
    
        /*
    UIImageView *NewEffectUIImageViewWithFrame(CGRect frame) {
    
    UIImageView *tempView = [[UIImageView alloc] initWithFrame:frame];
    
    SKView *skView = [[SKView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
    [tempView addSubview:skView];
    
    SKScene *skScene = [SKScene sceneWithSize:skView.frame.size];
    skScene.scaleMode = SKSceneScaleModeAspectFill;
    skScene.backgroundColor = [UIColor clearColor];
    
    SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"SparkParticle" ofType:@"sks"]];
    emitter.position = CGPointMake(frame.size.width*0.5,0.0);
    
    [skScene addChild:emitter];
    [skView presentScene:skScene];
    
    return tempView;
    }
    
    - (SKEmitterNode *) newExplosion: (float)posX : (float) posy
    {
    SKEmitterNode *emitter =  [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:@"MyParticle" ofType:@"sks"]];
    emitter.position = CGPointMake(posX,posy);
    emitter.name = @"explosion";
    emitter.targetNode = self.scene;
    emitter.numParticlesToEmit = 1000;
    emitter.zPosition=2.0;
    return emitter;
    }*/
    
    func boxTapped(sender: UIGestureRecognizer) {
        
        switch sender.state {
        case .Ended:
            
            guard let box = sender.view else { return print("sender.view guarded") }
            let boxIndex = box.tag
            guard let color = box.backgroundColor else {return print("boxColor guarded") }
            
            func clear() {
                selectedBoxView[0].layer.borderWidth = 0.0
                selectedBoxes.removeAll()
                selectedBoxColors.removeAll()
                selectedBoxView.removeAll()
            }
            
            /*
            func boxSelected(box : UIView) {
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
            box.frame.origin.x -= 2.0
            box.frame.origin.y -= 2.0
            box.frame.size.width += 4.0
            box.frame.size.height += 4.0
            
            })
            }
            
            func boxUnselected(box : UIView) {
            
            UIView.animateWithDuration(0.33, animations: { () -> Void in
            box.frame.origin.x += 2.0
            box.frame.origin.y += 2.0
            box.frame.size.width -= 4.0
            box.frame.size.height -= 4.0
            })
            }
            
            */
            
            if selectedBoxes.first == nil {
                
                selectedBoxes.append(boxIndex)
                selectedBoxColors.append(color)
                selectedBoxView.append(box)

                // boxSelected(selectedBoxView[0])
                selectedBoxView[0].layer.borderWidth = 3.0
                selectedBoxView[0].layer.borderColor = color.CGColor
                
            } else {
                
                selectedBoxes.append(boxIndex)
                selectedBoxColors.append(color)
                selectedBoxView.append(box)
                
                if selectedBoxes.count == 2 {
                    
                    if selectedBoxColors[0] != selectedBoxColors[1] {
                        
                         //boxUnselected(selectedBoxView[0])
                        clear()
                        debugPrint("Colors are not equal, try again")
                        SystemSoundID.playFileNamed("fail")

                        
                    } else {
                        
                        if selectedBoxes[0] != selectedBoxes[1] {
                            debugPrint("Wow, You matched the colors!")
                            
                            SystemSoundID.playFileNamed("success")

                            
                            /*
                            TipInCellAnimator.animate(selectedBoxView[0], completion: { (finished) -> Void in
                                
                                if finished {
                                    self.selectedBoxView[0].removeFromSuperview()
                                    clear()
                                }
                                
                            })
                            
                            TipInCellAnimator.animate(selectedBoxView[1], completion: { (finished) -> Void in
                                
                                if finished {
                                    self.selectedBoxView[1].removeFromSuperview()
                                    clear()
                                }
                                
                            })
                        */
                            
                            selectedBoxView[1].removeFromSuperview()
                            selectedBoxView[0].removeFromSuperview()
                            
                            //TODO: buyuyup rotate olup alpha 0 gidicek
                            
                            selectedBoxes.removeAll()
                            selectedBoxColors.removeAll()
                            selectedBoxView.removeAll()
                            
                            colorsArrayGlobal.removeLast()
                            colorsArrayGlobal.removeLast()
                            
                            //last box disappear
                            if colorsArrayGlobal.count == 0 {
                                
                            //    nextLevelButton.hidden = false
                                buttonAnimateIn()
                           
                            }
                            
                        } else {
                            clear()
                        }
                    }
                    
                } else { debugPrint("SelectedBoxCount not 2") }
                
            }
            
            debugPrint(selectedBoxes)
            debugPrint(selectedBoxColors)
            debugPrint("box Tapped \(boxIndex)")
            
        default:
            break
        }
        
    }
    
    private func addBox(frame : CGRect, colour : UIColor, tag: Int) {
        
        //box created
        let box = UIView(frame: frame)
        box.backgroundColor = colour
        box.layer.cornerRadius = 3.0
        box.tag = tag
        view.addSubview(box)
        
        //TapGesture
        let boxTapped = UITapGestureRecognizer(target: self, action: "boxTapped:")
        //box.addGestureRecognizer(boxTapped)
        box.addGestureRecognizer(boxTapped)
        
    }
    
    //MARK: Fazlalik
    func shuffleColorArray() -> [UIColor] {
        
        //let black = UIColor.blackColor()
        let brown = UIColor.brownColor()
        let yellow = UIColor.yellowColor()
        let blue = UIColor.blueColor()
        //let gray = UIColor.grayColor()
        let green = UIColor.greenColor()
        let orange = UIColor.orangeColor()
        //let cyan = UIColor.cyanColor()
        let purple = UIColor.purpleColor()
        let red = UIColor.redColor()
        let magenta = UIColor.magentaColor()
        
        //var colorsArray = [black,brown,yellow,blue,gray,green,orange,cyan,purple,red,magenta]
        
        //for 16 box
        var colorsArray = [brown,yellow,blue,green,orange,purple,red,magenta]
        colorsArray.appendContentsOf(colorsArray)
        
        func shuffleArray<T>(var array: Array<T>) -> Array<T> {
            for var index = array.count - 1; index > 0; index--
            {
                // Random int from 0 to index-1
                let j = Int(arc4random_uniform(UInt32(index-1)))
                
                // Swap two array elements
                // Notice '&' required as swap uses 'inout' parameters
                swap(&array[index], &array[j])
            }
            return array
        }
        let shuffeledArray = shuffleArray(colorsArray)
        
        //debugPrint(shuffledArray)
        
        return shuffeledArray
    }
    func randomColorAndRemoveIndex(var colors : [UIColor] ) -> UIColor {
        
        //let randomIndex = arc4random_uniform(UInt32(colors.count))
        //let randomColor = colors[randomIndex.hashValue]
        //colors.removeAtIndex(randomIndex.hashValue)
        
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        let randomColor = colors[randomIndex.hashValue]
        //colors.removeAtIndex(<#T##index: Int##Int#>)
        
        return randomColor
    }
    
    @IBAction func dismissGame(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
}

//Mark: - Extensions

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

import AudioToolbox
extension SystemSoundID {
     static func playFileNamed(fileName: String, withExtenstion fileExtension: String? = "caf") {
        
        var sound: SystemSoundID = 0
        if let soundURL = NSBundle.mainBundle().URLForResource(fileName, withExtension: fileExtension) {
            AudioServicesCreateSystemSoundID(soundURL, &sound)
            AudioServicesPlaySystemSound(sound)
        }
    }
    //SystemSoundID.playFileNamed("myfile")
    //SystemSoundID.playFileNamed("myfile", withExtenstion: "myext")
}

extension ViewController : AVAudioPlayerDelegate {
    
    //telefon geldi
    func audioPlayerEndInterruption(player: AVAudioPlayer, withOptions flags: Int) {
        
        //player.play()
        
    }
}

extension Array {
    
    var shuffle: [Element] {
        
        var elements = self
        
        for index in indices {
            let anotherIndex = Int(arc4random_uniform(UInt32(elements.count - index))) + index
            anotherIndex != index ? swap(&elements[index], &elements[anotherIndex]) : ()
        }
        return elements
    }
    
    mutating func shuffled() {
        self = shuffle
    }
    
    var chooseOne: Element {
        return self[Int(arc4random_uniform(UInt32(count)))]
    }
    
    func choose(n: Int) -> [Element] {
        return Array(shuffle.prefix(n))
    }
    
    ////
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
}
