//
//  EditTaskViewController.swift
//  ProjetoTeste
//
//  Created by Debora Rodrigues  on 01/10/23.
//

import UIKit


class EditTaskViewController: UIViewController {
    
    var task: Task?
    
    @IBAction func backViewButtonPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
