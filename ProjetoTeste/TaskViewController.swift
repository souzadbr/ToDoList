//
//  ViewController.swift
//  ProjetoTeste
//

import UIKit

class TaskViewController: UIViewController {

    /// Tabela que exibe as tarefas existentes
    @IBOutlet weak var tableView: UITableView!

    /// Gerenciador de tarefas
    let taskManager = TaskManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        taskManager.loadTasks()
    }
    
    @IBAction func trashTaskhButtonPressed(_ sender: Any) {
        guard let trashButton = sender as? UIButton else { return }
        let pointOfButton = trashButton.convert(CGPoint.zero, to: tableView)
        guard let indexPath = tableView.indexPathForRow(at: pointOfButton) else { return }
        deleteTask(at: indexPath.row)
    }
    
    func deleteTask(at index: Int) {
        taskManager.deleteTask(at: index)
        tableView.reloadData()
    }
}

extension TaskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.getTasks().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        let task = taskManager.getTasks()[indexPath.row]
        cell.titleLabel.text = task.title
        return cell
    }
}

extension TaskViewController: UITableViewDelegate {
    // TODO: implementar comportamento ao selecionar uma tarefa
}
