//
//  AddNewWorkOutViewController.swift
//  Sport timer app
//
//  Created by Евгений Петренко on 15.06.2021.
//

import UIKit

class AddNewWorkOutViewController: UIViewController {

   
    @IBOutlet weak var restDuration: UITextField!
    @IBOutlet weak var exDuration: UITextField!
    @IBOutlet weak var exTitle: UITextField!
    private let instance = WorkOutsList.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exDuration.keyboardType = .numberPad
        restDuration.keyboardType = .numberPad
    }
    
    @IBAction func addNewWorkOut(_ sender: Any) {
        
        
        while let range = restDuration.text?.range(of: "[a-zA-ZА-Яа-я]",
                                                   options: .regularExpression) {
            restDuration.text?.removeSubrange(range)
        }
        
        while let range = exDuration.text?.range(of: "[a-zA-ZА-Яа-я]",
                                                 options: .regularExpression) {
            exDuration.text?.removeSubrange(range)
        }
        
        
        guard let exTitle = exTitle.text, let exDuration = Int(exDuration.text ?? "0"),
                let restDuration = Int(restDuration.text ?? "0") else {
            
            let alarm = UIAlertController(title: "Not now!",
                                          message: "You should fill out all fields.",
                                          preferredStyle: .alert)
            
            alarm.addAction(UIAlertAction(title: "Oki:)",
                                          style: .cancel,
                                          handler: nil)
            )
            
            present(alarm,
                    animated: true,
                    completion: nil)
            
            return
        }
        clearFields()
        
        instance.addWorkOut(newWorkOut: WorkOut(title: exTitle,
                                                exDuration: exDuration,
                                                restDuration: restDuration)
        )
        
    }
    
    func clearFields() {
        exTitle.text = ""
        exDuration.text = ""
        restDuration.text = ""
    }


}
