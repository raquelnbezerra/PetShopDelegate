//
//  ViewController.swift
//  SwiftDelegateProtocol
//
//  Created by quirino on 31/05/23.
//

import UIKit

class ViewController: UIViewController, ProductSelectionDelegate {
    
    
    
    let productImageView = UIImageView()
    let productNameLabel = UILabel()
    let chooseProductButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func didSelectProduct(name: String, imageName: String) {
        productNameLabel.text = name
        productImageView.image = UIImage(named: imageName)
    }
    
    func didSelectClient(name: String, imageName: String, age: Int, race: String) {
        debugPrint("Nome:", name, "Propriedade 2:", imageName, "Propriedade 3:", age)
    }

    
    @objc func presentProductSelectionVC() {
        let destinationVC = ProductSelectionVC()
        destinationVC.delegate = self
        destinationVC.modalPresentationStyle = .pageSheet
        destinationVC.sheetPresentationController?.detents = [.medium()]
        destinationVC.sheetPresentationController?.prefersGrabberVisible = true
        present(destinationVC, animated: true)
        
    }
    
    func setupUI () {
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        view.addSubview(chooseProductButton)

        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseProductButton.translatesAutoresizingMaskIntoConstraints = false

        productImageView.image = UIImage(named: "petshop")

        productNameLabel.text = "Pet Shop"
        productNameLabel.textAlignment = .center
        productNameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        productNameLabel.textColor = .darkGray

        chooseProductButton.configuration = .tinted()
        chooseProductButton.configuration?.title = "Escolha Seu Serviço"
        chooseProductButton.configuration?.image = UIImage(systemName: "petshop")
        chooseProductButton.configuration?.imagePadding = 8
        chooseProductButton.addTarget(self, action: #selector(presentProductSelectionVC), for: .touchUpInside)

        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
            productImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 225),
            productImageView.widthAnchor.constraint(equalToConstant: 300),

            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: padding),
            productNameLabel.centerXAnchor.constraint(equalTo: productImageView.centerXAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            productNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),

            chooseProductButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            chooseProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseProductButton.heightAnchor.constraint(equalToConstant: 50),
            chooseProductButton.widthAnchor.constraint(equalToConstant: 260)
        ])
    }
    
    
}

