//
//  SplashScreenViewController.swift
//  GoT-Houses
//
//  Created by Cameron Arrigo on 4/8/19.
//  Copyright © 2019 Cameron Arrigo. All rights reserved.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {
    @IBOutlet weak var throneImageView: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    var thronesImageY: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(soundName: "GoT_theme", audioPlayer: &audioPlayer)
        thronesImageY = throneImageView.frame.origin.y
    }
    
    override func viewWillAppear(_ animated: Bool) {
        throneImageView.frame.origin.y = self.view.frame.height + self.throneImageView.frame.height
        UIView.animate(withDuration: 1.0, delay: 1.0, animations:
            {self.throneImageView.frame.origin.y = self.thronesImageY})
    }
    
    
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("*** ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else {
            print("*** ERROR: file \(soundName) didn't load.")
        }
    }

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        audioPlayer.stop()
    }
    
    
}
