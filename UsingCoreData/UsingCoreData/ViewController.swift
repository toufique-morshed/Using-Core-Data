//
//  ViewController.swift
//  UsingCoreData
//
//  Created by Sekai Lab BD on 3/22/16.
//  Copyright © 2016 Sekai Lab BD. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtID: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadButton(sender: AnyObject) {
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
                var result: NSArray = try context.executeFetchRequest(request)
                if result.count > 0 {
                    print(result)
                } else {
                    print("ERROR")
                }
        } catch _ {
            print("ERROR")
        }
        
        
        
    }
    @IBAction func saveButton(sender: AnyObject) {
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        newUser.setValue("Badol", forKey: "userName")
        newUser.setValue("Badol", forKey: "pass")
        do {
             try context.save()
        } catch _ {
            
        }
        
        
        
    }

}

