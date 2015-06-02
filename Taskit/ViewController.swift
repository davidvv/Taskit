
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
    
    var baseArray:[[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 03)
        let date3 = Date.from(year: 2014, month: 12, day: 13)
        
        let task1 = TaskModel(task: "Study french", subtask:"Verbs", date: date1, completed: false)
        let task2 = TaskModel(task: "Eat Dinner", subtask: "Burgers", date: date2, completed: false)
        
        let taskArray = [task1, task2, TaskModel(task: "Gym", subtask: "Leg day", date: date3, completed: false)]
        
        var completedArray = [TaskModel(task: "Code", subtask: "Task project", date: date2, completed: true)]
        
        baseArray = [taskArray, completedArray]
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated) //entiendo que esta linea sobra, funciona igual sin ella
        
        baseArray[0] = baseArray[0].sorted{
            (taskOne:TaskModel, taskTwo:TaskModel) -> Bool in
            //comparison logic here
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //esta funcion se llama sola cuando se pica en un segway: ella sola mete un UIStoryboardSegue dentro del parámetro segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
        }
        else if segue.identifier == "showTaskAdd" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as! AddTaskViewController
            addTaskVC.mainVC = self
        }
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: ViewController.self)
    }
    
    

    
        //A continuación añadimos tres funciones, las dos primeras son necesarias para trabajar con TableViews. La tercera no. Hemos puesto tb los protocols ahí arriba donde se define la class ViewController. Apple llamará a estas funciones cuando le parezca, aunque nosotros tb podemos hacerlo, ya veremos como.
    
    
        // UITableViewDataSource: estás funciones se necesitan para las UITable. La primera cuenta el número de filas de la tabla y devuelve ese número, la segunda, se llama tantas veces como filas salgan de la perimera y genera celdas.
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.baseArray[section].count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println(indexPath.section)
        println(indexPath.row)
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    // UITableViewDelegate: esta función se llama cuando tocamos en una Row. Lo que le decimos, es que ejecute el Segue

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
}