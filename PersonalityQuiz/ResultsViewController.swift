//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Alex Witkamp on 22-02-18.
//  Copyright © 2018 Alex Witkamp. All rights reserved.
//

import UIKit
import AVFoundation

class ResultsViewController: UIViewController {

    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        // show the animal based on answers 
        calculatePersonalityResult()
        
        // hide back button on last page
        navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // labels at the result page
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    func calculatePersonalityResult () {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        
        // iterate over answers in dictionary
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        // sort answers of dictionary
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) -> Bool in return pair1.value > pair2.value})
        
        // answer listed in the dictionary the most
        let mostCommonAnswer = frequentAnswerSorted.first!.key
        
        // update labels on result page
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
        // play sound of animal
        playSound(using: mostCommonAnswer.rawValue)
        }
    
    // define audio player variable
    var player: AVAudioPlayer?
    
    // play sound of given animal
    func playSound(using animal: Character) {
        guard let url = Bundle.main.url(forResource: "\(animal)", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            // iOS 11
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            // iOS 10 or older
            guard let player = player else { return }
            
            // play sound
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
