//
//  HomeViewController.swift
//  AirHockeyProject
//
//  Created by divms on 4/14/15.
//  Copyright (c) 2015 divms. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
class HomeViewController : UIViewController {
    private var skView : SKView?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupGame() {
        let widthFraction : CGFloat = 0.9
        let heightFraction : CGFloat = 0.4
        let rect = CGRect(origin: CGPoint(x: 0,y: 0), size: CGSize(width: self.view.frame.height * heightFraction, height: self.view.frame.width * widthFraction))
        let gameView = SKView(frame: rect)
        
        gameView.backgroundColor = UIColor.clearColor()
        gameView.alpha = 0.5
        gameView.userInteractionEnabled = false
        let soundManager : SoundManager = SoundManager()
        soundManager.isMuted = true
        let settings = AirHockeyConstants.getDefaultSettings()
        settings.setTimeLimit(0)
        settings.setGoalLimit(0)
        
        let scene = GameScene(size: gameView.frame.size,p1: nil,p2: nil,profile: settings, sound: soundManager, nav: nil)
        scene.alpha = 1
        
        
        
        gameView.ignoresSiblingOrder = true
        
        scene.scaleMode = .AspectFill
        gameView.presentScene(scene)
        gameView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI) * 3 / 2)
        
        self.view.addSubview(gameView)
        gameView.frame.origin = CGPoint(x: ((1-widthFraction)/2) * self.view.frame.width, y: 20)
        self.navigationController!.interactivePopGestureRecognizer.enabled = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        if (skView != nil) {
            skView!.scene!.paused = true
            skView!.presentScene(nil)
            skView!.removeFromSuperview()
            
        }
    }
    
    override func  viewWillAppear(animated: Bool) {
        //setupGame()
    }
    
    @IBAction func buttonTouched(sender: AnyObject) {
        SoundManager().playButtonPressedSound()
    }
   
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
       
}