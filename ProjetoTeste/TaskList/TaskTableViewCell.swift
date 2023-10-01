//
//  TaskTableViewCell.swift
//  ProjetoTeste
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var task: Task? {
        
        didSet{
            guard let task = task else { return }
            
            titleLabel.text = task.title
            descriptionLabel.text = task.description
            datePicker.date = task.createdAt
        }
    }
}
