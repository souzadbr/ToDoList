//
//  ViewController.swift
//  ProjetoTeste
//

import UIKit

class ViewController: UIViewController {

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
}

extension ViewController: UITableViewDataSource {
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

extension ViewController: UITableViewDelegate {
    // TODO: implementar comportamento ao selecionar uma tarefa
}
