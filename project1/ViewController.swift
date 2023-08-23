//
//  ViewController.swift
//  project1
//
//  Created by Vlad Klunduk on 28/07/2023.
//

import UIKit

class ViewController: UITableViewController {
    
    var pics = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        performSelector(inBackground: #selector(loadImages), with: nil)
    }
    
    @objc func loadImages(){
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pics.append(item)
            }
        }
        pics.sort()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pics[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "Detail") as! DetailViewController
        vc.selectedImage = pics[indexPath.row]
        vc.numOfPics = pics.count
        vc.indOfPic = indexPath.row + 1
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

