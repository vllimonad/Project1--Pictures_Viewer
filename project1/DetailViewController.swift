//
//  DetailViewController.swift
//  project1
//
//  Created by Vlad Klunduk on 30/07/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    var numOfPics: Int?
    var indOfPic: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Image \(indOfPic!) of \(numOfPics!)"
        navigationItem.largeTitleDisplayMode = .never
        imageView.image = UIImage(named: selectedImage!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
