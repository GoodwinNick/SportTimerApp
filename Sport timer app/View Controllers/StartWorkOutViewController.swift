//
//  StartWorkOutViewController.swift
//  Sport timer app
//
//  Created by Евгений Петренко on 15.06.2021.
//

import UIKit

class StartWorkOutViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let workOutCellIdn = "workOutCellIdn"
    
    private let instance = WorkOutsList.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: TableRegistration
        tableView.register(UINib(nibName: "WorkOutTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: workOutCellIdn)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Default workouts
        instance.addWorkOut(newWorkOut: WorkOut(title: "Exercise 1",
                                                exDuration: 5,
                                                restDuration: 5)
        )
        
        instance.addWorkOut(newWorkOut: WorkOut(title: "Exercise 2",
                                                exDuration: 5,
                                                restDuration: 5)
        )
        
        instance.addWorkOut(newWorkOut: WorkOut(title: "Exercise 3",
                                                exDuration: 5,
                                                restDuration: 5)
        )
        
        instance.addWorkOut(newWorkOut: WorkOut(title: "Exercise 4",
                                                exDuration: 5,
                                                restDuration: 5)
        )
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
  

}


extension StartWorkOutViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instance.getWorkOutCounts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "workOutCellIdn",
                                                       for: indexPath) as? WorkOutTableViewCell else {
            return UITableViewCell()
        }
        
        let workOut = instance.getWorkOut(with: indexPath.row)
        
        cell.workOutTitleLabel.text = workOut.title
        cell.workOutDurationLabel.text = "\(workOut.exDuration)"
        cell.restDurationLabel.text = "\(workOut.restDuration)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            instance.deleteBy(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}
