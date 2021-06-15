//
//  CurrentWorkOutViewController.swift
//  Sport timer app
//
//  Created by Евгений Петренко on 15.06.2021.
//

import UIKit

class CurrentWorkOutViewController: UIViewController {
    @IBOutlet weak var nextEx: UILabel!
    @IBOutlet weak var restDuration: UILabel!
    @IBOutlet weak var exDuration: UILabel!
    @IBOutlet weak var exTitle: UILabel!
    
    
    private var workOut: WorkOut?
    private var counterOfEx: Int?
    private var counterOfRest: Int?
    private var index: Int?
    
    private var timerOfEx = Timer()
    private var timerOfRest = Timer()
    
    private let instance = WorkOutsList.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        index = instance.getWorkOutCounts()
        
        if index! > 0 {
            
            index = 0
            startWorkOut(index: index!)
            
        } else {
            
            let alert = UIAlertController(title: "Nope",
                                          message: "You have no added work outs.",
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Oh, oki",
                                          style: .cancel,
                                          handler: nil))
            present(alert,
                    animated: true,
                    completion: nil)
        }
        
    }
    
    func startWorkOut (index: Int) {
        
        workOut = instance.getWorkOut(with: index)
        counterOfEx = workOut?.exDuration
        counterOfRest = workOut?.restDuration
        
        exTitle.text = workOut?.title
        exDuration.text = "\(workOut?.exDuration ?? 0)"
        restDuration.text = "\(workOut?.restDuration ?? 0)"
        
        if index < instance.getWorkOutCounts() - 1 {
            nextEx.text = "Next is: " + instance.getWorkOut(with: index + 1).title
        } else {
            nextEx.text = "Almost Done! Keep moving."
        }
        
        timerOfEx = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(firstTimer),
                                         userInfo: nil,
                                         repeats: true)
        
        
    }
    
    
    @objc func firstTimer () {
        
        counterOfEx! -= 1
        exDuration.text = "\( counterOfEx!)"
        
        if counterOfEx == 0 {
            
            timerOfEx.invalidate()
            timerOfRest = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(secondTimer), userInfo: nil, repeats: true)
            
        }
        
    }
    
    
    @objc func secondTimer () {
        
        counterOfRest! -= 1
        restDuration.text = "\(counterOfRest!)"
        
        if counterOfRest == 0 {
            
            if index! < (instance.getWorkOutCounts() - 1) {
                
                timerOfRest.invalidate()
                index! += 1
                startWorkOut(index: index!)
                
            } else {
                
                timerOfRest.invalidate()
                nextEx.text = "Yeah. You did it!!!! Congrats!"
                
            }
            
            
        }
    }

}
