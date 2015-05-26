//
//  AddTaskViewController.swift
//  Taskit
//
//  Created by David Vences Vaquero on 24/5/15.
//  Copyright (c) 2015 David. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    var mainVC:ViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        //como la transición a este ViewController no es a través del navigation controller (no tenemos la Menu Bar gratis) no podemos pedirle al navigation controller que nos saque de aquí como hicimos con el boton "cancel" TaskDetailViewController. Le pedimos a este mismo ViewController que nos saque de aquí:
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
        var task = TaskModel(task: taskTextField.text, subtask: subTaskTextField.text,
            date: dueDatePicker.date)
        mainVC.taskArray.append(task)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
