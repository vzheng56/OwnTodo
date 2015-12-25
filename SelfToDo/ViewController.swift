//
//  ViewController.swift
//  SelfToDo
//
//  Created by 刘卫斌 on 15/12/25.
//  Copyright © 2015年 yufu. All rights reserved.
//

import UIKit
import RandomColor


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var todoListTableView: UITableView!
    var thingsModel=[TodoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let thingString = ["Buy books","shopping on the internet","gogogo"]
        for thing in thingString{
            let todo = TodoModel()
            todo.thingsName = thing
            thingsModel.append(todo)
        }
        self.todoListTableView.dataSource = self
        self.todoListTableView.delegate = self
        
        headerImage.layer.masksToBounds = true
        headerImage.layer.cornerRadius = 50
        addButton.layer.zPosition = 5
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.todoListTableView.dequeueReusableCellWithIdentifier("todoListCell")
        //cell?.textLabel?.text = thingsModel[indexPath.row].thingsName
        let todoText = cell?.viewWithTag(1001) as! UILabel
        todoText.text = thingsModel[indexPath.row].thingsName
        let imageDot = cell?.viewWithTag(1000) as! UIImageView
        imageDot.layer.masksToBounds = true
        imageDot.layer.cornerRadius = 10
        imageDot.backgroundColor = randomColor(hue: .Random, luminosity: .Light)
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thingsModel.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "TODAY"
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }

}

