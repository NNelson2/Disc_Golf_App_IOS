//
//  ConfirmPage.swift
//  Frisbee_Golf
//
//  Created by noah nelson on 1/24/22.
//

import UIKit

class ConfirmPage: UIViewController {
    private var numPlayers : Int = 0
    
    private var players = [Player]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /// used if the yes button is pressed, presents the final scores
    ///  - Parameter sender: the UIbutton on the screen
    ///  - Returns: nothing
    @IBAction func pressedYes(sender : UIButton) {
        let startTracking = storyboard?.instantiateViewController(withIdentifier: "ScoreFinal") as! ScoreFinalView
        
        startTracking.setPlayers(players: players)
        startTracking.setPlayerAmount(numPlayers: numPlayers)
        startTracking.modalPresentationStyle = .fullScreen
        
        present(startTracking, animated: false)
    }
    
    /// sets the players
    ///  - Parameter players: the set of players
    ///  - Returns: nothing 
    func setPlayers (players : [Player]) {
        self.players = players
    }
    
    /// sets the number of players
    ///  - Parameter numPlayers: the number of players playing
    ///  - Returns: nothing
    func setNumPlayers(numPlayers : Int) {
        self.numPlayers = numPlayers
    }
    

}
