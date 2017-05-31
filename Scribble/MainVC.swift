//
//  MainVC.swift
//  Scribble
//
//  Created by Hung Nguyen on 5/31/17.
//  Copyright © 2017 Luvdub Nation. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class MainVC: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activitySpinner.isHidden = true
        
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        activitySpinner.stopAnimating()
        activitySpinner.isHidden = true
    }
    
    func requestAuthorization() {
        
        
        SFSpeechRecognizer.requestAuthorization { (result) in
            if SFSpeechRecognizer.authorizationStatus() == .authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                let recognizer = SFSpeechRecognizer()
                let request = SFSpeechURLRecognitionRequest(url: path)
                
                recognizer?.recognitionTask(with: request) { (result, error) in
                    if let result = result {
                    
                    self.textField.text = result.bestTranscription.formattedString
                
                    } else {
                        print("What")
                    }
             
                do {
                    
                    self.audioPlayer = try AVAudioPlayer(contentsOf: path)
                    self.audioPlayer.delegate = self
                    self.audioPlayer.play()
                    
                } catch let error as NSError {
                    print("\(error)")
                }
                
                    }
            }
        }
    }
    }
    

    @IBAction func playBtnPressed(_ sender: Any) {
        requestAuthorization()
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
    }
    
}

