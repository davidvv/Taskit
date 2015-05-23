//
//  ViewController.swift
//  Taskit
//
//  Created by David Vences Vaquero on 12/5/15.
//  Copyright (c) 2015 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskArray:[TaskModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1 = TaskModel(task: "Study french", subtask:"Verbs", date: "01/14/2014")
        let task2 = TaskModel(task: "Eat Dinner", subtask: "Burgers", date: "01/14/2014")
        
        taskArray = [task1, task2, TaskModel(task: "Gym", subtask: "Leg day", date: "01/14/2014")]
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //esta funcion se llama sola cuando se pica en un segway
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
            
        }
    }
    

    
        //A continuación añadimos tres funciones, las dos primeras son necesarias para trabajar con TableViews. La tercera no. Hemos puesto tb los protocols ahí arriba donde se define la class ViewController. Apple llamará a estas funciones cuando le parezca, aunque nosotros tb podemos hacerlo, ya veremos como.
    
    
        // UITableViewDataSource: estás funciones se necesitan para las UITable. La primera cuenta el número de filas de la tabla y devuelve ese número, la segunda, se llama tantas veces como filas salgan de la perimera y genera celdas.
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println(indexPath.section)
        println(indexPath.row)
        
        let thisTask = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = thisTask.date
        
        return cell
    }
    
    // UITableViewDelegate: esta función se llama cuando tocamos en una Row. Lo que le decimos, es que ejecute el Segue

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
}
