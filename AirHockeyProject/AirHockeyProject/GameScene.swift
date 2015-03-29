//
//  GameScene.swift
//  AirHockeyProject
//
//  Created by divms on 3/25/15.
//  Copyright (c) 2015 divms. All rights reserved.
//

import SpriteKit

// collision detection categories
let puckCategory :  UInt32 =  0x1 << 0;
let paddleCategory :  UInt32 =  0x1 << 1;
let edgeCategory : UInt32 = 0x1 << 2
let barrierCategory : UInt32 = 0x1 << 3

public class GameScene: SKScene {
    
    //TODO: need to pass the user setting profile to this variable
    private var settingsProfile = AirHockeyConstants.getDefaultSettings()

    private var inputManager : InputManager!
    
    private var playingTable : Table!
    
    
    private var playerOne : Player!
    private var playerTwo : Player!
    
    public func getPlayingTable() -> Table {
        return playingTable
    }
    
    
    
    
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.physicsWorld.gravity=CGVectorMake(0,0) // no gravity in this game
        inputManager = InputManager()
        inputManager.setGame(self)
        println("total width")
        println(self.frame.width)
        let fractionOfWidth : CGFloat = 0.8 // how much of the screen should this take up?
        let fractionOfHeight : CGFloat = 0.9
        let width = self.frame.width * fractionOfWidth
        let height = self.frame.height * fractionOfHeight
        println("calculated width")
        println(width)
        let size = CGSize(width: width,height: height)
        
        playingTable = makeTable(CGRect(origin: CGPoint(x: 0,y: 0), size: size))
        
        playingTable.position = CGPoint(x: self.frame.width*((1-fractionOfWidth)/2), y: self.frame.height*((1-fractionOfHeight)/2))
        self.addChild(playingTable)
        
        println("width from scene")
        println(playingTable.frame.width)
    
        
        var puck = getPuckSprite(2.0)
        playingTable.setPuck(puck)
        
        
        playerOne=HumanPlayer(speed: maxHumanPaddleSpeed, accel: maxHumanPaddleAcceleration, s: self, i: 1)
        playerTwo=HumanPlayer(speed: maxHumanPaddleSpeed, accel: maxHumanPaddleAcceleration, s: self, i: 2)
        
        var paddle = getPaddleSprite(CGFloat(settingsProfile.getPlayerOnePaddleRadius()!))
        var tableHalf = playingTable.getPlayerOneHalf()

        paddle.position = CGPoint(x:CGRectGetMidX(tableHalf),y:CGRectGetMidY(tableHalf))
        playingTable.addChild(paddle)
        playerOne.setPaddle(paddle)
        
        
        paddle = getPaddleSprite(CGFloat(settingsProfile.getPlayerTwoPaddleRadius()!))
        tableHalf = playingTable.getPlayerTwoHalf()
        
        paddle.position = CGPoint(x:CGRectGetMidX(tableHalf),y:CGRectGetMidY(tableHalf))
        playingTable.addChild(paddle)
        playerTwo.setPaddle(paddle)
        
        
    }
    
    
    private func makeTable(rect: CGRect) -> Table {
        var table = Table(rect: rect)
        
        
        
        return table
    }
    
    override public func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        inputManager.updateTouches(touches)
    }
    
   override public func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        inputManager.updateTouches(touches)
    }
    
    override public func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        inputManager.updateTouches(touches)
    }
    override public func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        inputManager.updateTouches(touches)
    }
    
    
    
    //TODO: we actually want a textured node here, but this is just for testing
    func getPuckSprite(density : CGFloat) -> Puck {
        var puck = Puck(circleOfRadius : CGFloat(settingsProfile.getPuckRadius()!))
        
        puck.configurePuck(density, settingsProfile: settingsProfile)
        return puck
    }
    
    
    //returns a paddle TODO get a textured node
    func getPaddleSprite(r : CGFloat)-> Paddle{
        var paddle = Paddle(circleOfRadius : r)
        
        paddle.configurePaddle(r, settingsProfile: settingsProfile)
        return paddle
    }
    
    
    override public func didEvaluateActions() {
        // ensure player paddles are not going faster than the maximum
        for player in [playerOne, playerTwo] {
            let paddle=player.getPaddle()!
            var paddleSpeed = Geometry.magnitude(player.getPaddle()!.physicsBody!.velocity)
            if (paddleSpeed>player.getMaxSpeed()) {
                paddle.physicsBody!.velocity = Geometry.getVectorOfMagnitude(paddle.physicsBody!.velocity, b: player.getMaxSpeed())
            }
        }
        
    }
    
   
    override public func update(currentTime: CFTimeInterval) {
        playerOne.movePaddle()
        playerTwo.movePaddle()
    }
//TODO: All of this logic is not good-- we should just get it right in update and not do this ugly post processing in didSimulatePhysics
   override public func didSimulatePhysics() {
    
    }
    
    public func getInputManager() -> InputManager {
        return inputManager
    }
    
    public func getPlayerOnePaddle() -> Paddle {
        return playerOne.getPaddle()!
    }
    
    public func getPlayerTwoPaddle() -> Paddle {
        return playerTwo.getPaddle()!
    }
}