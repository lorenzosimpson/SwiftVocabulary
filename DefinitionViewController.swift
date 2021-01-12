//
//  DefinitionViewController.swift
//  Swift Vocabulary
//
//  Created by Lorenzo on 1/10/21.
//

import UIKit

class DefinitionViewController: UIViewController {

     @IBOutlet weak var wordLabel: UILabel!
     @IBOutlet weak var definitionText: UITextView!

     var vocabWord: VocabularyWord?

     func updateViews() {
         if let unwrappedWord = vocabWord {
             wordLabel.text = unwrappedWord.word
             definitionText.text = unwrappedWord.definition
            print("views updated")
         }
     }

     override func viewDidLoad() {
         super.viewDidLoad()

         updateViews()
     }

 }
