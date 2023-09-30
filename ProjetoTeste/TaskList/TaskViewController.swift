//
//  ViewController.swift
//  ProjetoTeste
//

import UIKit

class TaskViewController: UIViewController {
    
    private enum segues: String {
        case seeNewTask = "NewTaskViewController"
        case seeDetailTask = "DetailTaskViewController"
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
    
    private func prepareForDetailTask( _ segue: UIStoryboardSegue, _ sender: Any?) {
        if segue.identifier == "SeeDetailTaskSegue",
               let selectedIndexPath = taskListTableView.indexPathForSelectedRow,
               let detailViewController = segue.destination as? DetailTaskViewController {
                
                // Obtenha a tarefa selecionada
                let selectedTask = taskManager.getTasks()[selectedIndexPath.row]
                
                // Configure as informações da tarefa na tela de detalhes
                detailViewController.taskTitle = selectedTask.title
                detailViewController.taskDescription = selectedTask.description
                detailViewController.taskDate = selectedTask.createdAt
                
                // Defina o delegate para receber atualizações, se necessário
                detailViewController.delegate = self
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier,
              let segueEsperada = TaskViewController.segues(rawValue: segueId) else { return }
        
        switch segueEsperada {
            
        case .seeNewTask:
            prepareForNewTask(segue, sender)
        case .seeDetailTask:
            prepareForDetailTask(segue, sender)
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Ao selecionar uma célula, dispare o segue para exibir detalhes
        performSegue(withIdentifier: "ShowDetailTaskSegue", sender: tableView.cellForRow(at: indexPath))
    }
}

extension TaskViewController: NewTaskViewControllerDelegate {
    func newTaskViewController(_ controller: NewTaskViewController, add task: Task) {
        
        taskManager.addTask(task: task)
        taskListTableView.reloadData()
    }
}

extension TaskViewController: DetailTaskViewControllerDelegate {
    
    func detailTaskViewController( _ controller: DetailTaskViewController, view index: Int) {
        taskManager.loadTasks()
    }
}
