//
//  TaskDetailViewController.swift
//  Taskit
//
//  Created by David Vences Vaquero on 21/5/15.
//  Copyright (c) 2015 David. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var detailTaskModel: TaskModel!
    var mainVC:ViewController!

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskTextField.text = self.detailTaskModel.task
        subtaskTextField.text = self.detailTaskModel.subtask
        dueDatePicker.date = self.detailTaskModel.date

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func doneBarButtonTapped(sender: UIBarButtonItem) {
        
        var task = TaskModel(task: taskTextField.text, subtask: subtaskTextField.text, date: dueDatePicker.date)
        
        mainVC.taskArray[mainVC.tableView.indexPathForSelectedRow()!.row] = task
        
        self.navigationController!.popViewControllerAnimated(true)
    }


}
