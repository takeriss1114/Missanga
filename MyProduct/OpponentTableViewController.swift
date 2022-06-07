//
//  OpponentTableViewController.swift
//  MyProduct
//
//  Created by 赤池春輝 on 2020/09/05.
//  Copyright © 2020 com.beneif. All rights reserved.
//

import UIKit
import NCMB
import Kingfisher

//var nname :String = ""

class OpponentTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var opponentTableView: UITableView!
    
    var person = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()

        opponentTableView.rowHeight = 200
        
        opponentTableView.dataSource = self
        
        opponentTableView.delegate = self
        
        opponentTableView.tableFooterView = UIView()
        
        let nib = UINib(nibName: "OpponentTableViewCell", bundle: Bundle.main)
        opponentTableView.register(nib, forCellReuseIdentifier: "opponentCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadPerson()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
        //return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "opponentCell") as! OpponentTableViewCell
        cell.nameLabel.text = person[indexPath.row].name
        cell.ageLabel.text = person[indexPath.row].age
        cell.areaLabel.text = person[indexPath.row].area
        cell.commentTextView.text = person[indexPath.row].comment
        let userImageUrl = "https://mbaas.api.nifcloud.com/2013-09-01/applications/xbS6RMjeVi2zmhvU/publicFiles/" + person[indexPath.row].objectId
        cell.userImage.kf.setImage(with: URL(string: userImageUrl), placeholder: UIImage(named: "placeholder.png"))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let selectedIndexPath = opponentTableView.indexPathForSelectedRow!
        //nname = person[selectedIndexPath.row].name!
        detailViewController.nameLabel = person[selectedIndexPath.row].name!
        detailViewController.ageLabel = person[selectedIndexPath.row].age!
        detailViewController.areaLabel = person[selectedIndexPath.row].area!
        detailViewController.contactLabel = person[selectedIndexPath.row].contact!
        detailViewController.occupationLabel = person[selectedIndexPath.row].occupation!
        detailViewController.heightLabel = person[selectedIndexPath.row].height!
        detailViewController.bodyLabel = person[selectedIndexPath.row].body!
        detailViewController.sakeLabel = person[selectedIndexPath.row].sake!
        detailViewController.tobaccoLabel = person[selectedIndexPath.row].tobacco!
        detailViewController.piasLabel = person[selectedIndexPath.row].pias!
        detailViewController.personalLabel = person[selectedIndexPath.row].personal!
        detailViewController.hobbyLabel = person[selectedIndexPath.row].hobby!
        detailViewController.artLabel = person[selectedIndexPath.row].art!
        detailViewController.commentLabel = person[selectedIndexPath.row].comment!
        detailViewController.cellObjectId = person[selectedIndexPath.row].objectId
        
        detailViewController.navigationItem.title = person[selectedIndexPath.row].name
    }
    
    func loadPerson() {
        let query = NCMBUser.query()
        let user = NCMBUser.current()
        
        query?.whereKey("objectId", notEqualTo: NCMBUser.current()?.objectId)
        
        query?.limit = 10
        query?.order(byDescending: "createDate")
        
        query?.findObjectsInBackground({ (result, error) in
            if error != nil {
                print("error")
            } else {
                self.person = [Person]()
                print(result)
                for personObject in result as! [NCMBUser] {
                    let name = personObject.object(forKey: "name") as? String
                    let age = personObject.object(forKey: "age") as? String
                    let area = personObject.object(forKey: "area") as? String
                    let contact = personObject.object(forKey: "contact") as? String
                    let occupation = personObject.object(forKey: "occupation") as? String
                    let height = personObject.object(forKey: "height") as? String
                    let body = personObject.object(forKey: "body") as? String
                    let sake = personObject.object(forKey: "sake") as? String
                    let tobacco = personObject.object(forKey: "tobacco") as? String
                    let pias = personObject.object(forKey: "pias") as? String
                    let personal = personObject.object(forKey: "personal") as? String
                    let hobby = personObject.object(forKey: "hobby") as? String
                    let art = personObject.object(forKey: "art") as? String
                    let sex = personObject.object(forKey: "sex") as? String
                    let comment = personObject.object(forKey: "comment") as? String
                    let personModel = Person(objectId: personObject.objectId, name: name, age: age, area: area, contact: contact, occupation: occupation, height: height, body: body, sake: sake, tobacco: tobacco, pias: pias, personal: personal, hobby: hobby, art: art, sex: sex, comment: comment)
                    let me = user?.object(forKey: "sex") as? String
                    let here = user?.object(forKey: "area") as? String
                    let same = user?.object(forKey: "same") as? String
                    if same == "しない" {
                        if me != sex {
                            self.person.append(personModel)
                        }
                    } else if same == "する" {
            
                        self.person.append(personModel)
                        
                    }
                }
                print(self.person)
                self.opponentTableView.reloadData()
            }
        })
        
        
    }
}
