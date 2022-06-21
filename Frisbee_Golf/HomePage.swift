//
//  ViewController.swift
//  Frisbee_Golf
//
//  Created by noah nelson on 1/16/22.
//

import UIKit

class HomePage: UIViewController {
    var numPlayers : Int = 1
    var numHoles : Int = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    /// used when the start button is pressed
    @IBAction func startGameButton(sender: UIButton) {
        let startTracking = storyboard?.instantiateViewController(withIdentifier: "GameTracking") as! GamesTrackingPage
        startTracking.numHoles = numHoles
        startTracking.numPlayers = numPlayers
        startTracking.modalPresentationStyle = .fullScreen
        present(startTracking, animated: true)
        
    }
    
    /// used to grab input from the player segmented control bar
    ///  - Parameter sender: input from the UI
    @IBAction func numberPlayers(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
           numPlayers = segmentedValuePlayers(number: 1)
            
        } else if (sender.selectedSegmentIndex == 1) {
            numPlayers = segmentedValuePlayers(number: 2)
            
        } else if (sender.selectedSegmentIndex == 2) {
            numPlayers = segmentedValuePlayers(number: 3)
            
        } else if (sender.selectedSegmentIndex == 3) {
            numPlayers = segmentedValuePlayers(number: 4)
            
        } else if (sender.selectedSegmentIndex == 4) {
            numPlayers = segmentedValuePlayers(number: 5)
        }
    }
    
    /// used to grab input from the holes segmented control bar
    ///  - Parameter sender: input from the UI
    @IBAction func numberHoles(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            numHoles = segmentedValueHoles(number: 8)
            
        } else if (sender.selectedSegmentIndex == 1) {
            numHoles = segmentedValueHoles(number: 18)
            
        }
    }
    
    
    /// used to calculate the value given by the players segmented control bar
    ///  - Parameter number: the number given by the control bart
    ///  - Returns: the number of players for the game
    func segmentedValuePlayers(number: Int) -> Int {
        if (number == 1){
            return 1
            
        } else if (number == 2){
            return 2
            
        } else if (number == 3){
            return 3
            
        } else if (number == 4){
            return 4
            
        } else if (number == 5){
            return 5
            
        } else{
            return 1
        }
    }
    
    /// used to calculate the value given by the holes segmented control bar
    ///  - Parameter number: the given number for the control bar
    ///  - Returns: number of Holes
    func segmentedValueHoles(number: Int) -> Int {
        if (number == 8){
            return 9
            
        } else {
            return 18
        }
    }
}

