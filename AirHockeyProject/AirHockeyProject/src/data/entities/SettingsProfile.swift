//
//  SettingsProfile.swift
//  AirHockeyProject
//
//  Created by divms on 3/24/15.
//  Copyright (c) 2015 divms. All rights reserved.
//

import Foundation

public class SettingsProfile {
    private var id : Int64?
    private var friction : Double?
    private var playerOnePaddleRadius : Double?
    private var playerTwoPaddleRadius : Double?
    private var puckRadius : Double?
    private var timeLimit : Int?
    private var goalLimit : Int? // null if they are infinite
    private var aiDifficulty : Int?
    
    init() {
        
    }
    
    public func getId() -> Int64? {
        return id;
    }
    public func setId(id : Int64?) {
        self.id=id
    }
    public func getFriction() -> Double? {
        return friction
    }
    public func setFriction(fric : Double?) {
        self.friction=fric
    }
    public func getPlayerOnePaddleRadius() -> Double? {
        return playerOnePaddleRadius
    }
    public func setPlayerOnePaddleRadius(r: Double?) {
        playerOnePaddleRadius=r
    }
    public func getPlayerTwoPaddleRadius() -> Double? {
        return playerTwoPaddleRadius
    }
    public func setPlayerTwoPaddleRadius(r: Double?) {
        playerTwoPaddleRadius=r
    }
    public func getPuckRadius() -> Double? {
        return puckRadius
    }
    public func setPuckRadius(r: Double?) {
        puckRadius=r
    }
    public func getTimeLimit() -> Int? {
        return timeLimit
    }
    public func setTimeLimit(t : Int?) {
        timeLimit=t
    }
    public func getGoalLimit() -> Int? {
        return goalLimit
    }
    public func setGoalLimit(g: Int?) {
        goalLimit=g
    }
    public func getAIDifficulty() -> Int? {
        return aiDifficulty
    }
    public func setAIDifficulty(d: Int? ){
        aiDifficulty=d
    }
    
    
}