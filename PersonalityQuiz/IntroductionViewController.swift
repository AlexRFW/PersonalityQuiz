//
//  IntroductionViewController.swift
//  PersonalityQuiz
//
//  Created by Alex Witkamp on 22-02-18.
//  Copyright © 2018 Alex Witkamp. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Go back to introduction screen when Done is pressed
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
        
    }
}

