//
//  ViewController.swift
//  StateManagementWithProtocol
//
//  Created by Harun Demirkaya on 22.02.2023.
//
import UIKit

class HomeViewController: UIViewController{

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
    
    var btnProductSelectionBottomSheet: UIButton = {
        let btn = UIButton()
        btn.setTitle("  Choose Product", for: .normal)
        btn.setImage(UIImage(systemName: "apple.logo"), for: .normal)
        btn.tintColor = .systemBlue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemBlue.withAlphaComponent(0.4)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    var btnAddBottomSheet: UIButton = {
        let btn = UIButton()
        btn.setTitle("  Add to Basket", for: .normal)
        btn.setImage(UIImage(systemName: "basket"), for: .normal)
        btn.tintColor = .systemBlue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemBlue.withAlphaComponent(0.4)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    var btnBasket: UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.setImage(UIImage(systemName: "basket"), for: .normal)
        btn.tintColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imgViewProduct.imgViewProductConstraints(view)
        btnProductSelectionBottomSheet.btnBottomSheetConstraints(view)
        btnAddBottomSheet.btnAddConstraints(view, btn: btnProductSelectionBottomSheet)
        lblTitle.lblTitleConstraints(view, btn: btnAddBottomSheet)
        btnBasket.btnBasketConstraints(view)
        
        btnProductSelectionBottomSheet.addTarget(self, action: #selector(btnProductSelectionBottomSheetTarget), for: .touchUpInside)
        btnAddBottomSheet.addTarget(self, action: #selector(btnAddBottomSheetTarget), for: .touchUpInside)
    }
    
    @objc func btnProductSelectionBottomSheetTarget(){
        let productSelectionVC = ProductSelectionViewController()
        productSelectionVC.delegate = self
        
        productSelectionVC.modalPresentationStyle = .pageSheet
        productSelectionVC.sheetPresentationController?.detents = [.medium()]
        productSelectionVC.sheetPresentationController?.prefersGrabberVisible = true
        present(productSelectionVC, animated: true)
    }
    
    @objc func btnAddBottomSheetTarget(){
        let addToBasketVC = AddToBasketViewController()
        addToBasketVC.delegate = self
        
        addToBasketVC.modalPresentationStyle = .pageSheet
        addToBasketVC.sheetPresentationController?.detents = [.medium()]
        addToBasketVC.sheetPresentationController?.prefersGrabberVisible = true
        present(addToBasketVC, animated: true)
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
    
    func lblTitleConstraints(_ view: UIView, btn: UIButton){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomAnchor.constraint(equalTo: btn.topAnchor, constant: -10).isActive = true
    }
    
    func btnBottomSheetConstraints(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.85).isActive = true
        heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.05).isActive = true
    }
    
    func btnAddConstraints(_ view: UIView, btn: UIButton){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomAnchor.constraint(equalTo: btn.topAnchor, constant: -10).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.85).isActive = true
        heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.05).isActive = true
    }
    
    func btnBasketConstraints(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
}

// MARK: -ProductSelectionDelegate Functions
extension HomeViewController: ProductSelectionDelegate{
    func didSelectProduct(name: String, imageName: String) {
        lblTitle.text = name
        imgViewProduct.image = UIImage(named: imageName)
    }
}

// MARK: -AddToBasketDelegate Function
extension HomeViewController: AddToBasketDelegate{
    func didSelectPiece(piece: String) {
        btnBasket.setTitle(piece, for: .normal)
    }
}
