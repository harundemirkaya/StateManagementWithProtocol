//
//  AddToBasketViewController.swift
//  StateManagementWithProtocol
//
//  Created by Harun Demirkaya on 22.02.2023.
//

import UIKit

protocol AddToBasketDelegate: AnyObject{
    func didSelectPiece(piece: String)
}

class AddToBasketViewController: UIViewController {

    // MARK: -Define
    
    var btnDecrease: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .gray.withAlphaComponent(0.3)
        btn.setTitle("-", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    var txtFieldPiece: UITextField = {
        var txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.text = "1"
        txtField.textColor = .black
        txtField.backgroundColor = .gray.withAlphaComponent(0.3)
        txtField.layer.cornerRadius = 10
        txtField.textAlignment = .center
        return txtField
    }()
    
    var btnIncrease: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .gray.withAlphaComponent(0.3)
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    var btnAddToBasket: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .gray.withAlphaComponent(0.3)
        btn.setTitle("Add to Basket", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    weak var delegate: AddToBasketDelegate?
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        txtFieldPiece.txtFieldPieceConstraints(view)
        btnDecrease.btnDecreaseConstraints(view, txtField: txtFieldPiece)
        btnIncrease.btnIncreaseConstraints(view, txtField: txtFieldPiece)
        btnAddToBasket.btnAddToBasketConstraints(view, txtField: txtFieldPiece)
        
        btnDecrease.addTarget(self, action: #selector(btnDecreaseTarget), for: .touchUpInside)
        btnIncrease.addTarget(self, action: #selector(btnIncreaseTarget), for: .touchUpInside)
        btnAddToBasket.addTarget(self, action: #selector(btnAddToBasketTarget), for: .touchUpInside)
    }
    
    @objc func btnDecreaseTarget(){
        if let text = txtFieldPiece.text, let number = Int(text), txtFieldPiece.text != "0" {
            let incrementedNumber = number - 1
            let resultText = String(incrementedNumber)
            txtFieldPiece.text = resultText
        }
    }
    
    @objc func btnIncreaseTarget(){
        if let text = txtFieldPiece.text, let number = Int(text){
            let incrementedNumber = number + 1
            let resultText = String(incrementedNumber)
            txtFieldPiece.text = resultText
        }
    }
    
    @objc func btnAddToBasketTarget(){
        delegate?.didSelectPiece(piece: txtFieldPiece.text ?? "0")
        dismiss(animated: true)
    }
}

extension UIView{
    
    func txtFieldPieceConstraints(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.3).isActive = true
        heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.1).isActive = true
    }
    
    func btnDecreaseConstraints(_ view: UIView, txtField: UITextField){
        view.addSubview(self)
        trailingAnchor.constraint(equalTo: txtField.leadingAnchor, constant: -10).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func btnIncreaseConstraints(_ view: UIView, txtField: UITextField){
        view.addSubview(self)
        leadingAnchor.constraint(equalTo: txtField.trailingAnchor, constant: 10).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func btnAddToBasketConstraints(_ view: UIView, txtField: UITextField){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: txtField.bottomAnchor, constant: 10).isActive = true
        widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.75).isActive = true
    }
}
