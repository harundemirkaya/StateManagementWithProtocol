//
//  ViewController.swift
//  StateManagementWithProtocol
//
//  Created by Harun Demirkaya on 22.02.2023.
//
import UIKit

class HomeViewController: UIViewController {

    // MARK: -Define
    
    var imgViewProduct: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "mac-iphone-ipad"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Apple Product Line"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var btnBottomSheet: UIButton = {
        let btn = UIButton()
        btn.setTitle("Choose Product", for: .normal)
        return btn
    }()
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imgViewProduct.imgViewProductConstraints(view)
        lblTitle.lblTitleConstraints(view, imgView: imgViewProduct)
    }
}

extension UIView{
    func imgViewProductConstraints(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.85).isActive = true
    }
    
    func lblTitleConstraints(_ view: UIView, imgView: UIImageView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: imgView.bottomAnchor).isActive = true
    }
}
