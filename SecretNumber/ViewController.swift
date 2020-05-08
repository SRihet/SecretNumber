//
//  ViewController.swift
//  SecretNumber
//
//  Created by Stéphane Rihet on 28/04/2020.
//  Copyright © 2020 SapinRocher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _gameRangeToScreenRatio:CGFloat = 1
    let _gameController = GameController()

    @IBOutlet weak var ui_numberTestValue: UITextField!
    @IBOutlet weak var ui_verifyButton: UIButton!
    @IBOutlet weak var ui_boundaryZone: UIView!
    
    @IBOutlet weak var ui_statusLabel: UILabel!
    
    @IBOutlet weak var ui_lowBoundaryLabel: UILabel!
    @IBOutlet weak var ui_highBoundaryLabel: UILabel!
    
    @IBOutlet weak var cs_boundaryTrailing: NSLayoutConstraint!
    @IBOutlet weak var cs_boundaryLeading: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplay()
        // Do any additional setup after loading the view.
    }

    @IBAction func ui_verifyValueTest() {
        if let guessText = ui_numberTestValue.text,
            let guessInt = Int(guessText) {
            _gameController.verifyGuessedValue(guessInt)
            ui_numberTestValue.text = nil
            updateDisplay()
        }
    }
    
    @IBAction func ui_startNewGame() {
        _gameController.startNewGame()
        updateDisplay()
    }
    
    override func viewDidLayoutSubviews() {
        let barWidth:CGFloat = self.ui_boundaryZone.bounds.width
        _gameRangeToScreenRatio = barWidth / CGFloat(GameController.MAX_VALUE - GameController.MIN_VALUE)
        updateDisplay()
        super.viewWillLayoutSubviews()
    }
    
    func updateDisplay(){
        if _gameController.isGameInProgress {
            if ui_boundaryZone.isHidden != false {
                UIView.transition(with: ui_boundaryZone, duration: 0.5, options: [.transitionCurlDown], animations: {
                self.ui_boundaryZone.isHidden = false
            }, completion: nil)
                ui_statusLabel.text = "Essayez  de trouver le nombre mystère"
                ui_numberTestValue.isHidden = false
                ui_verifyButton.isHidden = false
                UIView.animate(withDuration: 0.4, animations: {
                    self.view.layoutIfNeeded()
                })
            }

            
            
            ui_lowBoundaryLabel.text = String(_gameController.lowBoundary)
            ui_highBoundaryLabel.text = String(_gameController.highBoundary)
            
            UIView.animate(withDuration: 0.4, animations: {
                          self.view.layoutIfNeeded()
                      })
            
            cs_boundaryLeading.constant = CGFloat(_gameController.lowBoundary) * _gameRangeToScreenRatio
            cs_boundaryTrailing.constant = CGFloat(GameController.MAX_VALUE - _gameController.highBoundary) * _gameRangeToScreenRatio
            
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.45, initialSpringVelocity: 10, options: [], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
          
        }else {
            ui_statusLabel.text = nil
            ui_numberTestValue.isHidden = true
            ui_verifyButton.isHidden = true
            if ui_boundaryZone.isHidden != true {
            UIView.transition(with: ui_boundaryZone, duration: 1, options: [.transitionCurlUp], animations: {
                self.ui_boundaryZone.isHidden = true
            }, completion: nil)
            }
            
        }
    }
    
}

