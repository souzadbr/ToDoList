//
//  DetailsTaskViewController.swift
//  ProjetoTeste
//
//  Created by Debora Rodrigues  on 30/09/23.
//

import UIKit

protocol DetailTaskViewControllerDelegate: AnyObject {
    
    func detailTaskViewController( _ controller: DetailTaskViewController, view index: Int)
}

class DetailTaskViewController: UIViewController {
    
    var taskTitle: String?
    var taskDescription: String?
    var taskDate: Date?
    var task: Task?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func backViewButtonPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    weak var delegate: DetailTaskViewControllerDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           // Atualize as informações da tarefa na tela
           updateTaskInfo(title: taskTitle, description: taskDescription, date: taskDate)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getInfoDetailTask()
    }
    
    public func getInfoDetailTask() {
        
        // Certifique-se de que taskDate é uma Date
        if let taskDate = taskDate {
                datePicker.date = taskDate
            }
        
        titleTextField.text = taskTitle
        descriptionTextField.text = taskDescription
        
    }
    
    // Função para atualizar as informações da tarefa na tela
        func updateTaskInfo(title: String?, description: String?, date: Date?) {
            // Atualize os campos com as novas informações
            titleTextField.text = title
            descriptionTextField.text = description
            datePicker.date = date ?? Date() // Use a nova data se fornecida, caso contrário, use a data atual
        }
}
