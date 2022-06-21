//
//  ScoreFinalView.swift
//  Frisbee_Golf
//
//  Created by noah nelson on 1/19/22.
//

import UIKit

class ScoreFinalView: UIViewController {
    private var players = [Player]()
    
    private var numPlayers : Int = 0
    
    private var labels = [UILabel]()
    
    @IBOutlet var player1 : UILabel!
    
    @IBOutlet var player2 : UILabel!
    
    @IBOutlet var player3 : UILabel!
    
    @IBOutlet var player4 : UILabel!
    
    @IBOutlet var player5 : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labels.append(player1)
        labels.append(player2)
        labels.append(player3)
        labels.append(player4)
        labels.append(player5)
        placeScores()
    }
    
    func placeScores(){
        if (numPlayers == 1) {
            player1.text = String(players[0].getFinalScore())
            
        } else if (numPlayers == 2) {
            for x in 0...1 {
                labels[x].text = String(players[x].getFinalScore())
            }

        } else if (numPlayers == 3) {
            for x in 0...2 {
                labels[x].text = String(players[x].getFinalScore())
            }

        } else if (numPlayers == 4) {
            for x in 0...3 {
                labels[x].text = String(players[x].getFinalScore())
            }

        } else if (numPlayers == 5) {
            for x in 0...4 {
                labels[x].text = String(players[x].getFinalScore())
            }
            
        }
    }
    
    public func setPlayers(players : [Player]) {
        self.players = players
    }
    
    public func setPlayerAmount(numPlayers : Int) {
        self.numPlayers = numPlayers
    }
    
    
}
