//
//  ViewController.swift
//  AllInOne
//
//  Created by Dhaval Dobariya on 23/06/22.
//

import UIKit
import CoreData

class UserTableVC: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    var userDataManager = UserDataManager()
    let dataPassed : UserDataJson! = nil
    var dataModel :[UserDataModel] = []
    var people: [NSManagedObject] = []

    let context = PersistenceStorage.shared.persistentContainer.viewContext
    //user data from coredata
    var items = [People]()
    var name = ""
    var location = ""
    var dob = ""
    var picture = ""
    var numberOfRecords = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        self.userTableView.register(UINib(nibName: Constant.UserTableViewCellNib, bundle: nil), forCellReuseIdentifier: Constant.UserTableViewCellNib)
        userTableView.dataSource = self
        userTableView.delegate = self
        userTableView.estimatedRowHeight = 500
        userTableView.rowHeight = UITableView.automaticDimension
        
        userDataManager.delegate = self
        userDataManager.fetchData()
        getAllItems()
        //deleteExtraData()
    }

    func deleteExtraData() {
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: People.fetchRequest())
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
       print(items.count)
    }
    
}
//MARK: - UserDataDelegate
extension UserTableVC : UserDataDelegate {
    func didUpdateUserData(userData: [UserDataModel]){
        DispatchQueue.main.async {
            /*
             // to load table directly from api data
             self.dataModel = userData
             self.userTableView.reloadData()
             */

            for i in userData {
                self.createItem(name: i.name , uuid: i.uuid)
                //print(i.uuid)
            }
            
            do {
                try self.context.save()
            } catch let error {
                print(error)
            }
            self.getAllItems()
        }
    }
}
//MARK: - UITableViewDataSource
extension UserTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: Constant.UserTableViewCellNib, for: indexPath) as! UserTableViewCell
        myCell.superViewController = self
      //  myCell.configureuserTableViewCell(model: dataModel[indexPath.row])
        let name = items[indexPath.row].name ?? ""
        myCell.configureuserTableViewCell(name: " \(indexPath.row) : \(name)" )
        return myCell
    }
    
}
//MARK: - UITableViewDelegate
extension UserTableVC: UITableViewDelegate {
    private func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("user has pressed row number: \(indexPath.row)")
    }
}
// MARK: - coredata stuff:
extension UserTableVC {
     func getAllItems(){
        //fetch the data from core data
         do {
             self.items = try context.fetch(People.fetchRequest())
             //items.forEach({print("name is : \($0.name)")})
             DispatchQueue.main.async {
                 self.userTableView.reloadData()
             }
         } catch let error {
             print(error)
         }
     }
    func createItem(name: String, uuid: String){
        let newItem = People(context: context)
        newItem.name = name
        newItem.uuid = uuid
        do {
            try context.save()
        } catch let error{
            print(error)
        }
        /*
         */
        /*
         let request: NSFetchRequest<People> = People.fetchRequest()
         request.predicate = NSPredicate(format: "uuid = %@", uuid)
         
         do {
         let fetchResult = try context.fetch(request)
         if fetchResult.count > 0 {
         for doubledData in fetchResult {
         context.delete(doubledData)
         }
         }
         }catch {
         print(error)
         }
         */
        
       /*
        let request = People.fetchRequest()
        request.predicate = NSPredicate(format: "uuid == %@", uuid)
        
        
        do {
        let numberOfRecords = try context.count(for: request)
        print(numberOfRecords)
        if numberOfRecords == 0 {
        let newItem = People(context: context)
        newItem.name = name
        newItem.uuid = uuid
        do {
        try context.save()
        } catch let error{
        print(error)
        }
        }
        } catch let error {
        print(error)
        }
        
    */
        /*
         let newItem = People(context: context)
         let request = People.fetchRequest()
         request.predicate = NSPredicate(format: "uuid == %@", uuid)
         request.fetchLimit = 1
         print("predicate : \(request.predicate)")
         if let id = newItem.value(forKey: "uuid") {
         if id as! String != uuid{
         newItem.name = name
         }
         }
         */
        /*
         let newItem = People(context: context)
         let request = People.fetchRequest()
         let filter = NSPredicate(format: "uuid == %@", uuid)
         let filterApplied = NSCompoundPredicate(type: .and, subpredicates: [filter])
         request.predicate = filter
         request.fetchLimit = 1
         do {
         let numberOfRecords = try context.count(for: request)
         print(numberOfRecords)
         if numberOfRecords == 0 {
         // no matching found so insert one
         let newItem = People(context: context)
         newItem.name = name
         newItem.uuid = uuid
         do {
         try context.save()
         } catch let error{
         print(error)
         }
         }else {
         context.delete(People(context: context))
         }
         } catch let error {
         print(error)
         }
         */
//            do {
//                let numberOfRecords = try context.count(for: request)
//                print(numberOfRecords)
//                if numberOfRecords == 0 {
//                    // no matching found so insert one
//                    let newItem = People(context: context)
//                    newItem.name = name
//                    newItem.uuid = uuid
//                    do {
//                        try context.save()
//                    } catch let error{
//                        print(error)
//                    }
//                }else {
//                    context.delete(People(context: context))
//                }
//            } catch let error {
//                print(error)
//            }
       
        /*
         let request = People.fetchRequest()
         request.predicate = NSPredicate(format: "uuid == %@", uuid)
         request.fetchLimit = 1
         print("predicate : \(request.predicate)")
         
         do {
         let numberOfRecords = try context.count(for: request)
         print(numberOfRecords)
         if numberOfRecords == 0 {
         // no matching found so insert one
         let newItem = People(context: context)
         newItem.name = name
         newItem.uuid = uuid
         do {
         try context.save()
         } catch let error{
         print(error)
         }
         }else {
         // matching found so do nothing
         }
         } catch let error {
         print(error)
         }
         */
        
         
    }
//    func isExisting(with id: String) -> ICGNotificationData? {
//        let filter = NSPredicate(format: "id == %@", id)
//        let filterApplied = NSCompoundPredicate(type: .and, subpredicates: [filter])
//        let result = self.read(predicate: filterApplied)
//        switch result {
//        case .success(let response):
//          if let data = response.first {
//            return data
//          }
//          return nil
//        case .failure(let error):
//          print(error.localizedDescription)
//          return nil
//        }
//    //    return false
//      }
}


