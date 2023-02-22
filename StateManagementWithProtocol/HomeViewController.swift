//
//  ViewController.swift
//  StateManagementWithProtocol
//
//  Created by Harun Demirkaya on 22.02.2023.
//
import UIKit

class HomeViewController: UIViewController, ProductSelectionDelegate {

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
        btn.setTitle("  Choose Product", for: .normal)
        btn.setImage(UIImage(systemName: "apple.logo"), for: .normal)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imgViewProduct.imgViewProductConstraints(view)
        lblTitle.lblTitleConstraints(view, imgView: imgViewProduct)
        btnBottomSheet.btnBottomSheetConstraints(view)
        
        btnBottomSheet.addTarget(self, action: #selector(btnBottomSheetTarget), for: .touchUpInside)
    }
    
    @objc func btnBottomSheetTarget(){
        let productSelectionVC = ProductSelectionViewController()
        productSelectionVC.delegate = self
        
        productSelectionVC.modalPresentationStyle = .pageSheet
        productSelectionVC.sheetPresentationController?.detents = [.medium()]
        productSelectionVC.sheetPresentationController?.prefersGrabberVisible = true
        present(productSelectionVC, animated: true)
    }
    
    // MARK: Delegate Function
    func didSelectProduct(name: String, imageName: String) {
        lblTitle.text = name
        imgViewProduct.image = UIImage(systemName: imageName)
    }
}

// MARK: -Constraints
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
    
    func btnBottomSheetConstraints(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.85).isActive = true
        heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.05).isActive = true
    }
}
