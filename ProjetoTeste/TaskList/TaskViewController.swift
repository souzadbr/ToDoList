//
//  ViewController.swift
//  ProjetoTeste
//

import UIKit

class TaskViewController: UIViewController{

    private enum segues: String {
        case seeNewTask = "NewTaskViewController"
    }
    /// Tabela que exibe as tarefas existentes
    @IBOutlet weak var taskListTableView: UITableView!

    /// Gerenciador de tarefas
    let taskManager = TaskManager()
    let newTaskViewController = NewTaskViewController()
    var newTask: [Task] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()

        taskListTableView.dataSource = self
        taskListTableView.delegate = self
        
        taskManager.loadTasks()
    }
    
    private func prepareForNewTask( _ segue: UIStoryboardSegue, _ sender: Any?) {
        guard let controllerDestination = segue.destination as? NewTaskViewController else {
            fatalError("Não é possivel encontrar \(segue.destination)")
        }
        
        controllerDestination.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let segueId = segue.identifier,
                  let segueEsperada = TaskViewController.segues(rawValue: segueId) else { return }
            
            switch segueEsperada {
           
            case .seeNewTask:
                prepareForNewTask(segue, sender)
            }
        }
    
    @IBAction func trashTaskhButtonPressed(_ sender: Any) {
        guard let trashButton = sender as? UIButton else { return }
        let pointOfButton = trashButton.convert(CGPoint.zero, to: taskListTableView)
        guard let indexPath = taskListTableView.indexPathForRow(at: pointOfButton) else { return }
        deleteTask(at: indexPath.row)
    }
    
    func deleteTask(at index: Int) {
        taskManager.deleteTask(at: index)
        taskListTableView.reloadData()
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension TaskViewController: NewTaskViewControllerDelegate {
    func newTaskViewController(_ controller: NewTaskViewController, add task: Task) {
        
        taskManager.addTask(task: task)
        taskListTableView.reloadData()
        
    }
    
}
