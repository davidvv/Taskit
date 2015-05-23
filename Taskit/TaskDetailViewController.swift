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

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskTextField.text = self.detailTaskModel.task
        subtaskTextField.text = self.detailTaskModel.subtask

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
