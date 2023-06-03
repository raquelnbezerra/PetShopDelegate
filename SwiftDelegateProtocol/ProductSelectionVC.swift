//
//  ProductSelectionVC.swift
//  SwiftDelegateProtocol
//
//  Created by quirino on 01/06/23.
//

import UIKit

protocol ProductSelectionDelegate {
    func didSelectProduct(name: String, imageName: String)
    func didSelectClient(name: String, imageName: String, age: Int, race: String)
    
}

class ProductSelectionVC: UIViewController {
    
    let haircutButton = UIButton()
    let productsButton = UIButton()
    let showerButton = UIButton()

    var delegate: ProductSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @objc func haircutButtonTapped() {
        delegate?.didSelectProduct(name: "Tosa", imageName: "haircut")
        dismiss(animated: true)
    }


    @objc func productsButtonTapped() {
        delegate?.didSelectProduct(name: "Produtos", imageName: "products")
        dismiss(animated: true)
    }


    @objc func showerButtonTapped() {
        delegate?.didSelectProduct(name: "Banho", imageName: "shower")
        dismiss(animated: true)
    }
    

    func setupUI() {
        view.addSubview(haircutButton)
        view.addSubview(productsButton)
        view.addSubview(showerButton)
        view.backgroundColor = .systemBackground

        haircutButton.translatesAutoresizingMaskIntoConstraints = false
        productsButton.translatesAutoresizingMaskIntoConstraints = false
        showerButton.translatesAutoresizingMaskIntoConstraints = false

        haircutButton.configuration = .tinted()
        haircutButton.configuration?.title = "Tosa"
        haircutButton.configuration?.image = UIImage(systemName: "haircut")
        haircutButton.configuration?.imagePadding = 8
        haircutButton.configuration?.baseForegroundColor = .systemBlue
        haircutButton.configuration?.baseBackgroundColor = .systemBlue
        haircutButton.addTarget(self, action: #selector(haircutButtonTapped), for: .touchUpInside)
//        iPhoneButton.addTarget(self, action: #selector(iPhoneButtonTapped), for: .touchUpInside)

        productsButton.configuration = .tinted()
        productsButton.configuration?.title = "Produtos"
        productsButton.configuration?.image = UIImage(systemName: "products")
        productsButton.configuration?.imagePadding = 8
        productsButton.configuration?.baseForegroundColor = .systemTeal
        productsButton.configuration?.baseBackgroundColor = .systemTeal
        productsButton.addTarget(self, action: #selector(productsButtonTapped), for: .touchUpInside)

        showerButton.configuration = .tinted()
        showerButton.configuration?.title = "Banho"
        showerButton.configuration?.image = UIImage(systemName: "shower")
        showerButton.configuration?.imagePadding = 8
        showerButton.configuration?.baseForegroundColor = .systemIndigo
        showerButton.configuration?.baseBackgroundColor = .systemIndigo
        showerButton.addTarget(self, action: #selector(showerButtonTapped), for: .touchUpInside)

        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
            productsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            productsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productsButton.heightAnchor.constraint(equalToConstant: 50),
            productsButton.widthAnchor.constraint(equalToConstant: 280),

            haircutButton.bottomAnchor.constraint(equalTo: productsButton.topAnchor, constant: -padding),
            haircutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            haircutButton.heightAnchor.constraint(equalToConstant: 50),
            haircutButton.widthAnchor.constraint(equalToConstant: 280),

            showerButton.topAnchor.constraint(equalTo: productsButton.bottomAnchor, constant: padding),
            showerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showerButton.heightAnchor.constraint(equalToConstant: 50),
            showerButton.widthAnchor.constraint(equalToConstant: 280),
        ])
    }
}
