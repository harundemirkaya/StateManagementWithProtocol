//
//  ProductSelectionViewController.swift
//  StateManagementWithProtocol
//
//  Created by Harun Demirkaya on 22.02.2023.
//

import UIKit

protocol ProductSelectionDelegate{
    func didSelectProduct(name: String, imageName: String)
}

class ProductSelectionViewController: UIViewController {
    
    // MARK: -Define
    
    var btnIphone: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "iphone"), for: .normal)
        btn.setTitle("  Iphone", for: .normal)
        btn.setTitleColor(.systemGreen, for: .normal)
        btn.tintColor = .systemGreen
        btn.backgroundColor = .systemGreen.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    var btnIpad: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "ipad"), for: .normal)
        btn.setTitle("  Ipad", for: .normal)
        btn.setTitleColor(.systemPurple, for: .normal)
        btn.tintColor = .systemPurple
        btn.backgroundColor = .systemPurple.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    var btnMacbook: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "laptopcomputer"), for: .normal)
        btn.setTitle("  Macbook", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.tintColor = .systemBlue
        btn.backgroundColor = .systemBlue.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    var delegate: ProductSelectionDelegate?
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        btnIphone.btnIphoneConstraint(view)
        btnIpad.btnIpadConstraints(view, btn: btnIphone)
        btnMacbook.btnMacbookConstraints(view, btn: btnIpad)
        
        btnIphone.addTarget(self, action: #selector(btnIphoneTarget), for: .touchUpInside)
        btnIpad.addTarget(self, action: #selector(btnIpadTarget), for: .touchUpInside)
        btnMacbook.addTarget(self, action: #selector(btnMacbookTarget), for: .touchUpInside)
        
    }
    
    @objc func btnIphoneTarget(){
        dismiss(animated: true)
    }
    
    @objc func btnIpadTarget(){
        dismiss(animated: true)
    }
    
    @objc func btnMacbookTarget(){
        dismiss(animated: true)
    }
}

// MARK: -Constraints
extension UIView{
    func btnIphoneConstraint(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
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
