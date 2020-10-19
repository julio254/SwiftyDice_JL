//
//  ViewController.swift
//  SwiftyDice
//
//  Created by Julio Lopez on 10/13/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    
    // Launch Screen ImageView
    @IBOutlet weak var launchImageView: UIImageView!
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonGotPressed() {
        rollDice()
    }
    
    // Dice Audio Sounds
    func playWinAudio() {
        let asset = NSDataAsset(name: "zfanfare")!
        
        do {
            player = try AVAudioPlayer(data: asset.data, fileTypeHint: "mp3")
            player?.play()
        }
        catch {
            print("error.localizedDescription")
        }
        
    }
    func playLossAudio() {
        let asset = NSDataAsset(name: "failwah")!
        
        do {
            player = try AVAudioPlayer(data: asset.data, fileTypeHint: "mp3")
            player?.play()
        }
        catch {
            print("error.localizedDescription")
        }
    }
    func playRollDice() {
        let asset = NSDataAsset(name: "rolldice")!
        
        do {
            player = try AVAudioPlayer(data: asset.data, fileTypeHint: "mp3")
            player?.play()
        }
        catch {
            print("error.localizedDescription")
        }
    }
    
    func rollDice() {
        // do cool stuff here
        print("WE ROLLIN DICE!")
        
        // Standard Audio for Rolling Dice
        playRollDice()
        
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        diceImageView.image = UIImage(named: imageName)
        
        if(imageName == "d1") {
            playLossAudio()
            criticalLabel.text = "You lose! Now Alt + F4."
        }
        else if (imageName == "d20") {
            playWinAudio()
            criticalLabel.text = "YOU WIN!!!"
        }
        else {
            criticalLabel.text = ""
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
}
