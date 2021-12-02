//
//  ViewController.swift
//  GreatNumberGame
//
//  Created by admin on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberEntry: UITextField!
    
    var number = Int.random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func submitButton(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        let guessedNumber = Int(numberEntry.text ?? "") ?? -1
        
        if guessedNumber == number{
            alert.title = "Correct"
            alert.message = "\(guessedNumber) Was Correct!!!"
            
            alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { action in
                self.playAgain()
            }))
            alert.view.backgroundColor = .green
        }
        else if guessedNumber == -1{
            alert.title = "Error"
            alert.message = "Please Enter Valid Number Between 1 and 100"
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil
            ))
            alert.view.backgroundColor = .red
        }
        else if guessedNumber < number {
            alert.title = "Incorrect"
            alert.message = "\(guessedNumber) is Too Low"
            
            alert.addAction(UIAlertAction(title: "Guess Again", style: .default, handler: nil
            ))
            alert.view.backgroundColor = .red
        }
        else {
            alert.title = "Incorrect"
            alert.message = "\(guessedNumber) is Too Big"
            
            alert.addAction(UIAlertAction(title: "Guess Again", style: .default, handler: nil
            ))
            alert.view.backgroundColor = .red
        }
        
        self.present(alert, animated: true, completion: nil)
        numberEntry.text?.removeAll()
    }
    
    func playAgain(){
        number = Int.random(in: 1...100)
    }
    
}

