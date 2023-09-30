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
        let newTask = Task(title: titleTextField.text ?? "deu errado", description:  descriptionTextField.text ?? "deu errado", createdAt: datePicker.date)
      
        delegate?.newTaskViewController(self, add: newTask)
        self.dismiss(animated: true)
    }
}


