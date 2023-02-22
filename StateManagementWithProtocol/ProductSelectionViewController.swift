//
//  ProductSelectionViewController.swift
//  StateManagementWithProtocol
//
//  Created by Harun Demirkaya on 22.02.2023.
//

import UIKit

class ProductSelectionViewController: UIViewController {
    
    // MARK: -Define
    
    var btnIphone: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "iphone"), for: .normal)
        btn.setTitle("  Iphone", for: .normal)
        return btn
    }()
    
    var btnIpad: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "ipad"), for: .normal)
        btn.setTitle("  Ipad", for: .normal)
        return btn
    }()
    
    var btnMacbook: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "laptopcomputer"), for: .normal)
        btn.setTitle("  Macbook", for: .normal)
        return btn
    }()
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        btnIphone.btnIphoneConstraint(view)
        btnIpad.btnIpadConstraints(view, btn: btnIphone)
        btnMacbook.btnMacbookConstraints(view, btn: btnIpad)
    }
}

// MARK: -Constraints
extension UIView{
    func btnIphoneConstraint(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.85).isActive = true
        heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.05).isActive = true
    }
    
    func btnIpadConstraints(_ view: UIView, btn: UIButton){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 5).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.85).isActive = true
        heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.05).isActive = true
    }
    
    func btnMacbookConstraints(_ view: UIView, btn: UIButton){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 5).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.85).isActive = true
        heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.05).isActive = true
    }
}
