//
//  Table.swift
//  AirHockeyProject
//
//  Created by divms on 3/28/15.
//  Copyright (c) 2015 divms. All rights reserved.
//
//TODO: We actually want textured nodes, but I'm just testing physics with simple graphics

import Foundation
import SpriteKit
public class Table : SKShapeNode {
    
    private var puck : Puck!
    private var playerOnePaddle : Paddle!
    private var playerTwoPaddle : Paddle!
    private var otherObjects  : [SKNode]! = []
    
    
    init(rect : CGRect) {
        super.init()
        self.path = CGPathCreateWithRect(rect, nil)

        self.fillColor = SKColor.grayColor()
        self.physicsBody=SKPhysicsBody(edgeLoopFromRect: rect)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // returns a CGRect representing the bounds of the bottom half of the table,
    // which is the half belonging to player one
    func getPlayerTwoHalf()-> CGRect {
        var rect = self.frame
        var originPoint=rect.origin
        originPoint.y = rect.midY //middle starts at the middle of the board, with the same x value
        return CGRect(origin: originPoint, size: CGSize(width: rect.width, height: rect.height/2))

    }
    
    //returns a CGRect representing the bounds of the top half of the table, which is the player two half
    func getPlayerOneHalf() -> CGRect {
        return CGRect(origin: self.frame.origin, size: CGSize(width: self.frame.width, height: self.frame.height/2))
    }
    
    public func setPuck(p : Puck) {
        puck = p
    }
    public func getPuck() -> Puck {
        return puck
    }
    public func setPlayerOnePaddle(p : Paddle) {
        playerOnePaddle=p
        
    }
    public func setPlayerTwoPaddle(p : Paddle) {
        playerTwoPaddle=p
        
    }
    public func getPlayerOnePaddle() -> Paddle {
        return playerOnePaddle
    }
    
    public func getPlayerTwoPaddle() -> Paddle {
        return playerTwoPaddle
    }
    
}