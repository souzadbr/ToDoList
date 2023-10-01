//
//  TaskDetailViewController.swift
//  ProjetoTeste
//
//  Created by Debora Rodrigues  on 30/09/23.
//

import UIKit

protocol NewTaskViewControllerDelegate: AnyObject {
    
    func newTaskViewController( _ controller: NewTaskViewController, add task: Task)
}

class NewTaskViewController: UIViewController {
    
    var task: Task?
    weak var delegate: NewTaskViewControllerDelegate?
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func salveButtonPressed(_ sender: Any) {
        addTask()
    }
    
    public func addTask() {
        
        guard let title = titleTextField.text, !title.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty else {
            // Exiba um alerta informando que os campos estão vazios
            let alertController = UIAlertController(title: "Campos Vazios", message: "Preencha todos os campos antes de adicionar a tarefa.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        let newTask = Task(title: title, description: description, createdAt: datePicker.date)
        
        delegate?.newTaskViewController(self, add: newTask)
        self.dismiss(animated: true)
    }
}


