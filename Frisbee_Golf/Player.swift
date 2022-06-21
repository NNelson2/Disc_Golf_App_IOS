//
//  Game.swift
//  Frothing_App
//
//  Created by noah nelson on 10/10/21.
//

import Foundation

/// class used for keeping track of the a players variables
public class Player{

    private var numRounds : Int
    
    private var scores : [Int]
    
    private var currentPar : [Int]
    
    private var numThrows : Int
    
    private var currentHole : Int
    
    private var finalScore : Int
    
    /// initilizer
    ///  - Parameter rounds: number of rounds set to be played
    public init(rounds: Int) {
        numRounds = rounds
        
        scores = [Int](repeating: 0, count: numRounds)
        
        currentPar = [Int](repeating: 0, count: numRounds)
        
        numThrows = 0
        
        currentHole = 1
        
        finalScore = 0
        
    }
    
    /// getter for the current hole
    /// - Returns: the current hole
    public func getCurrentHole() -> Int {
        return currentHole
    }
    
    /// getter for the players score
    /// - Parameter player: the given round
    /// - Returns: the score of the given player
   public func getPlayerScore(round : Int) -> Int {
        return scores[round]
    }
    
    /// getter for the current number of throws
    /// - Parameter player: the given player
    /// - Returns: the number of throws for the given player
    public func getCurrentThrows() -> Int {
        return numThrows
    }
    
    /// adds the score to memory and increments up  the round
    /// - Returns: nothing
    public func addScore() -> Void {
        if (currentHole < numRounds) {
            scores[currentHole] = numThrows
            currentHole += 1
            numThrows = scores[currentHole]
        }
    }
    
    /// reduces current round by 1 and set the players score to the previous round
    ///  - Returns: nothing
    public func reduceRound() -> Void {
        if (currentHole > 1){
            scores[currentHole] = numThrows
            currentHole -= 1
            numThrows = scores[currentHole]
        }
    }
    
    /// adds a throw for a given player
    /// - Parameter player: the given player
    /// - Returns: nothing
    public func addThrow() -> Void {
        numThrows += 1
    }
    
    /// subtracts a throw for the given player
    /// - Parameter player: the given player
    /// - Returns: nothing
    public func subThrow() -> Void {
        numThrows -= 1
    }
    
    /// get the total number of throws for all holes
    ///  - Returns: the total number of throws for the player for every round
    public func getFinalScore() -> Int {
        for x in 0..<numRounds {
            finalScore += scores[x]
    
        }
        return finalScore
    }
    
    public func setPar(par: Int) {
        currentPar[currentHole] = par
    }
    
    public func getPar() -> Int {
        return currentPar[currentHole]
    }
    
}

