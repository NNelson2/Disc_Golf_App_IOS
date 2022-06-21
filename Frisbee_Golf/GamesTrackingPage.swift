//
//  SecondViewController.swift
//  Frisbee_Golf
//
//  Created by noah nelson on 1/16/22.
//

import UIKit


class GamesTrackingPage: UIViewController {
    var numPlayers : Int = 0
    
    var numHoles : Int = 0
    
    var currentHole : Int = 1
    
    var par : Int = 3
    
    var players = [Player]()
    
    var currentPlayer : Int = 0
    
    @IBOutlet var holeLabel : UILabel!
    
    @IBOutlet var currentPlayerLabel : UILabel!
    
    @IBOutlet var currentPlayerThrowLabel : UILabel!
    
    @IBOutlet var parLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPlayers()
    
    }
    
    /// used to create the player objects for the game
    /// - Returns: nothing
    func createPlayers() {
        for _ in 0..<(numPlayers){
            players.append(Player(rounds: numHoles))
        }
    }
    
    /// changes the throw count for the current player by + 1
    ///  - Parameter sender: the UI button
    @IBAction func incrementThrowUp(sender: UIButton) {
        players[currentPlayer].addThrow()
        currentPlayerThrowLabel.text = String(players[currentPlayer].getCurrentThrows())
    }
    
    /// changes the throw count for the current player by - 1
    /// - Parameter sender: the UI button
    @IBAction func incrementThrowDown(sender: UIButton) {
        players[currentPlayer].subThrow()
        currentPlayerThrowLabel.text = String(players[currentPlayer].getCurrentThrows())
    }
    
    /// changes the current player in an increment of + 1
    /// - Parameter sender: the UI button
    @IBAction func changePlayerUp(sender: UIButton) {
        if (currentPlayer < numPlayers - 1){
            currentPlayer += 1
        }
        currentPlayerLabel.text = String(currentPlayer + 1)
        currentPlayerThrowLabel.text = String(players[currentPlayer].getCurrentThrows())
    }
    
    /// changes the current player in an increment of - 1
    /// - Parameter sender: the UI button
    @IBAction func changePlayerDown(sender: UIButton) {
        if (currentPlayer > 0){
            currentPlayer -= 1
        }
        currentPlayerLabel.text = String(currentPlayer + 1)
        currentPlayerThrowLabel.text = String(players[currentPlayer].getCurrentThrows())
    }
    
    /// goes to the next hole
    /// - Parameter sender: the UI button
    @IBAction func nextHole(sender: UIButton) {
        
        if (currentHole < numHoles) {
            currentHole += 1
            
            for x in 0..<players.count {
                players[x].addScore()
            }
        }
        holeLabel.text = String(currentHole)
        currentPlayerThrowLabel.text = String(players[currentPlayer].getCurrentThrows())
    }
    
    /// goes to the previous hole
    /// - Parameter sender: the UI button
    @IBAction func lastHole(sender: UIButton) {
        if (currentHole > 1) {
            currentHole -= 1
            
            for x in 0..<players.count {
                players[x].reduceRound()
            }
        }
        holeLabel.text = String(currentHole)
        currentPlayerThrowLabel.text = String(players[currentPlayer].getCurrentThrows())
    }
    
    /// sets the par for all the players on the hole
    @IBAction func setPar(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            par = 3
            
        } else if (sender.selectedSegmentIndex == 1) {
            par = 4
            
        } else if (sender.selectedSegmentIndex == 2) {
            par = 5
            
        } else if (sender.selectedSegmentIndex == 3) {
            par = 6
        }
        for x in 0..<players.count {
            players[x].setPar(par: par)
        }
    }
    
    /// used to end the game and present the final score UI
    /// - Parameter sender: the UI button
    @IBAction func endGame(sender : UIButton) {
        let presentConfimPage = storyboard?.instantiateViewController(withIdentifier: "confirm") as! ConfirmPage
        presentConfimPage.setPlayers(players: players)
        presentConfimPage.setNumPlayers(numPlayers: numPlayers)
        presentConfimPage.modalPresentationStyle = .fullScreen
        present(presentConfimPage, animated: true)
        
    }
}
