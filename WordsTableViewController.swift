//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Lorenzo on 1/10/21.
//

import UIKit

class WordsTableViewController: UITableViewController {

    @IBAction func addWord(_ sender: Any) {
        let alert = UIAlertController(title: "New Word", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Word"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Definition"
        }
        
        let textField1 = alert.textFields?[0] as UITextField?
        let textField2 = alert.textFields![1] as UITextField?
        
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                   
                   // Code in this block will trigger when OK button tapped.
            if let newWord = textField1?.text, let newDef = textField2?.text {
                self.vocabWords.append(VocabularyWord(word: newWord, definition: newDef))
                self.tableView.reloadData()
            } else {
                print("Text fields can't be blank");
                return
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action:UIAlertAction) in
            print("Cancel button tapped")
        }
        
                                     
        alert.addAction(OKAction)
        alert.addAction(cancelAction)
    
        
        self.present(alert, animated: true, completion: nil)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabWords.count
    }
    
    var vocabWords: [VocabularyWord] = [VocabularyWord(word: "Constant", definition: "fixed value that cannot be altered during a program's execution"), VocabularyWord(word: "Variable", definition: "named storage of a value that may be changed during a program's execution"), VocabularyWord(word: "Function", definition: "named chunk of code that performs a specific task")]

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)

//         Configure the cell...
        cell.textLabel?.text = vocabWords[indexPath.row].word

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if segue.identifier == "ShowDefinitionSegue" {
                 if let indexPath = tableView.indexPathForSelectedRow {
                     let definitionVC = segue.destination as? DefinitionViewController
                     definitionVC?.vocabWord = vocabWords[indexPath.row]
                    print("prepare function")
                 }
             }
    }
        
    

}
