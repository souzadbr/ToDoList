//
//  DetailsTaskViewController.swift
//  ProjetoTeste
//
//  Created by Debora Rodrigues  on 30/09/23.
//

import UIKit


class DetailTaskViewController: UIViewController {
    
    private enum segues: String {
        case seeEditTask = "EditTaskViewController"
    }
    
    var task: Task?
    
    @IBAction func backViewButtonPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "EditTaskViewController", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier,
              let segueEsperada = DetailTaskViewController.segues(rawValue: segueId) else { return }
        
        switch segueEsperada {
            
        case .seeEditTask:
            prepareForEditTask(segue, sender)
        }
    }
    
    private func prepareForEditTask( _ segue: UIStoryboardSegue, _ sender: Any?) {
        guard let controllerDestination = segue.destination as? EditTaskViewController else {
            fatalError("Não é possivel encontrar \(segue.destination)")
        }
        
        controllerDestination.task = task
    }
}
