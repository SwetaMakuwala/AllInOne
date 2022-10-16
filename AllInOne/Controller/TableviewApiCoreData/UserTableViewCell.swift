//
//  UserTableViewCell.swift
//  AllInOne
//
//  Created by Dhaval Dobariya on 23/06/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    var superViewController = UIViewController()
    var name = ""
    var location = ""
    var dob = ""
    var picture = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    func configureuserTableViewCell( model: UserDataModel){
//        userNameLabel.text = model.name
//        name = model.name
//        location = model.location
//        dob = model.dob
//        picture = model.picture
//        // load images from web
//        if let imageUrl = URL(string: picture){
//            if let imageData = try? Data(contentsOf: imageUrl) {
//                DispatchQueue.main.async {
//                    self.userImageView.image = UIImage(data: imageData)
//                }
//            }
//        }
//
//    }
//
    func configureuserTableViewCell(name : String){
        self.userNameLabel.text = name
    }
    func generateAlert(title: String, message: String){
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "cancel", style: .cancel, handler: .none)
        alert.addAction(action)
        self.superViewController.present(alert, animated: false, completion: nil)
    }
    
    @IBAction func personInfoBtnPressed(_ sender: UIButton) {
        generateAlert(title: "My full name is", message: name)
    }
    
    @IBAction func persnBirthDatePressed(_ sender: UIButton) {
        generateAlert(title: "My date of birth is", message: dob)
    }
    
    @IBAction func personLocationPressed(_ sender: UIButton) {
        generateAlert(title: "My address is", message: location)
    }
}
