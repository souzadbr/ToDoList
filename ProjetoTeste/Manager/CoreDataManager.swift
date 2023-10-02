//
//  CoreDataManager.swift
//  ProjetoTeste
//
//  Created by Debora Rodrigues  on 02/10/23.
//

//import Foundation
//import CoreData
//
//class CoreDataManager {
//    static let shared = CoreDataManager() // Singleton
//    
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "TaskDataModel") // Nome do seu modelo de dados
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Falha ao carregar o armazenamento persistente: \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//    
//    // MARK: - Saving Tasks
//    func saveTask(title: String, description: String) {
//        let task = Task(context: persistentContainer.viewContext)
//        task.title = title
//        task.descriptionTask = description
//        task.createdAt = Date()
//        
//        do {
//            try persistentContainer.viewContext.save()
//        } catch {
//            print("Erro ao salvar tarefa: \(error.localizedDescription)")
//        }
//    }
//    
//    // MARK: - Fetching Tasks
//    func fetchTasks() -> [Task] {
//        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
//        
//        do {
//            let tasks = try persistentContainer.viewContext.fetch(fetchRequest)
//            return tasks
//        } catch {
//            print("Erro ao buscar tarefas: \(error.localizedDescription)")
//            return []
//        }
//    }
//    
//    // MARK: - Editing Task
//    func editTask(task: Task, newTitle: String, newDescription: String) {
//        task.title = newTitle
//        task.description = newDescription
//        
//        do {
//            try persistentContainer.viewContext.save()
//        } catch {
//            print("Erro ao editar tarefa: \(error.localizedDescription)")
//        }
//    }
//    
//    // MARK: - Deleting Task
//    func deleteTask(task: Task) {
//        persistentContainer.viewContext.delete(task)
//        
//        do {
//            try persistentContainer.viewContext.save()
//        } catch {
//            print("Erro ao excluir tarefa: \(error.localizedDescription)")
//        }
//    }
//}
//
