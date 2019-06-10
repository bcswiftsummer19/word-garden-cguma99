//
//  ViewController.swift
//  Word Garden
//
//  Created by Christian Guma on 6/10/19.
//  Copyright © 2019 Christian Guma. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var guesLabel: UILabel!
    @IBOutlet weak var guessedLetField: UITextField!
    @IBOutlet weak var guessLetButton: UIButton!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    var wordToGuess = "IRISH"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessLetButton.isEnabled = false
        playAgainButton.isHidden = true
    }
    
    func updateUIAfterGuess(){
        guessedLetField.resignFirstResponder()
        guessedLetField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed = lettersGuessed + guessedLetField.text!
        
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + " " + String(letter)
            } else {
                revealedWord = revealedWord + " _"
            }
        }
        revealedWord.removeFirst()
        guesLabel.text = revealedWord
    }
    
    func guessALetter() {
        formatUserGuessLabel()
        guessCount = guessCount + 1
        
        let currentLetterGuessed = guessedLetField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        
        let reveleadWord = guesLabel.text!
        
        
        if wrongGuessesRemaining == 0{
            playAgainButton.isHidden = false
            guessedLetField.isEnabled = false
            guessLetButton.isEnabled = false
            guessCountLabel.text = "Darn, you're all out of guesses. Try again?"
        } else if !reveleadWord.contains("_") {
            playAgainButton.isHidden = false
            guessedLetField.isEnabled = false
            guessLetButton.isEnabled = false
            guessCountLabel.text = "Nice work!! It took you \(guessCount) guesses to guess the word!"
        } else {
            let guess = (guessCount == 1 ? "Guess" : "Guesses")
            guessCountLabel.text = "You've made \(guessCount) \(guess)."
        }
        
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetField.text?.last {
            guessedLetField.text = "\(letterGuessed)"
            guessLetButton.isEnabled = true
        } else {
            guessLetButton.isEnabled = false
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetField.isEnabled = true
        guessLetButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've made 0 Guesses."
        guessCount = 0
    }
    
}
