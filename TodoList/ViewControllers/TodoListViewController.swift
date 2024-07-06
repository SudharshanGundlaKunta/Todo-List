//
//  ViewController.swift
//  TodoList
//
//  Created by Sudharshan on 06/07/24.
//

import UIKit

class TodoListViewController: UIViewController {
    
    @IBOutlet weak var todoListTable: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var todoList: [List] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        
        addButton.layer.cornerRadius = 25
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOpacity = 0.8
        addButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        addButton.layer.shadowRadius = 10
        
        todoListTable.separatorStyle = .none
        todoListTable.delegate = self
        todoListTable.dataSource = self
        todoListTable.register(UINib(nibName: "TodoListTableViewCell", bundle: nil), forCellReuseIdentifier: "TodoListTableViewCell")
        
    }
    
    @IBAction func addTask(_ sender: UIButton) {
        openTaskAddingView()
    }
    
    func openTaskAddingView() {
        
        let alert = UIAlertController(title: "Add", message: "Enter What you want to do", preferredStyle: .alert)
        alert.addTextField { textFeild in
            textFeild.placeholder = "Ex: Take my dog for a walk"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        let okAction = UIAlertAction(title: "ADD", style: .default) {_ in
            if let textField = alert.textFields?.first, let text = textField.text, text.count > 0 {
                let task = List(task: text)
                if self.todoList.isEmpty{
                    self.todoList.append(task)
                }else {
                    self.todoList.insert(task, at: 0)
                }
                
                self.todoListTable.reloadData()
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }

}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath) as? TodoListTableViewCell {
            cell.doneButton.tag = indexPath.row
            cell.doneButton.addTarget(self, action: #selector(isCompleted(_ :)), for: .touchUpInside)
            cell.updateDdata(self.todoList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.todoList.remove(at: indexPath.row)
        }
    }
    
    @objc func isCompleted(_ sender: UIButton) {
        self.todoList[sender.tag].isCompleted = !(self.todoList[sender.tag].isCompleted)
        if todoList[sender.tag].isCompleted {
            let completedTask = todoList.remove(at: sender.tag)
            todoList.append(completedTask)
        }else {
            let completedTask = todoList.remove(at: sender.tag)
            todoList.insert(completedTask, at: 0)
        }
        self.todoListTable.reloadData()
    }
    
}

