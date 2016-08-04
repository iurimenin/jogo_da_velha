//
//  ViewController.swift
//  Jogo da Velha
//
//  Created by Iuri Menin on 03/08/16.
//  Copyright © 2016 Iuri Menin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 1 = o, 2 = x
    
    var activePlayer = 1
    var gameActive = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winCombinations = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                            [0, 3, 6], [1, 4 ,7], [2, 5, 8],
                            [0, 4, 8], [2, 4, 6]
                          ]
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(sender: UIButton) {
    
        activePlayer = 1
        gameActive = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        winnerLabel.hidden = true
        playAgainButton.hidden = true
        
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 500 , winnerLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500 , playAgainButton.center.y)
        
        var button : UIButton
        for i in 0 ..< 9 {
            
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
            
//            if let button = view.viewWithTag(i) as? UIButton {
//                button.setImage(nil, forState: .Normal)
//            }
            
//            if let imageview = view.viewWithTag(i) as? UIImageView {
//                imageview.image = UIImage()
//            }
        }
        
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
            
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                image = UIImage(named: "circulo.jpg")!
                activePlayer = 2
            } else {
                image = UIImage(named: "x.png")!
                activePlayer = 1
            }
            
            sender.setImage(image, forState: .Normal)
            
            for combination in winCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    var winnerText = "Bolinha ganhou"
                    if gameState[combination[0]] == 2 {
                        winnerText = "X ganhou"
                    }
                
                    gameActive = false
                    
                    winnerLabel.text = winnerText
                    
                    winnerLabel.hidden = false
                    playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: {
                        self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 500 , self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500 , self.playAgainButton.center.y)
                    })
                }
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.hidden = true
        playAgainButton.hidden = true
        
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 500 , winnerLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500 , playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

