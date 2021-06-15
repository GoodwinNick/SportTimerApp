

import UIKit

class WorkOutsList {
    
    static private var workOuts: [WorkOut]? = []
    
    static var shared: WorkOutsList {
        let instance = WorkOutsList()
        return instance
    }
    
    func getWorkOutCounts () -> Int {
        return WorkOutsList.workOuts?.count ?? 0
    }
    
    func addWorkOut(newWorkOut: WorkOut) {
        WorkOutsList.workOuts?.append(newWorkOut)
    }
    
    func deleteBy(index: Int) {
        WorkOutsList.workOuts?.remove(at: index)
    }
    
    func getWorkOut(with index: Int) -> WorkOut {
        
        guard let workOut = WorkOutsList.workOuts?[index] else {
            return WorkOut(title: "Wrong", exDuration: 0, restDuration: 0)
        }
        
        return workOut
    }
    
}
