//
//  InfoViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//


import UIKit

class InfoViewController: UIViewController {
    
    var textForLabel: String?
    var textOrbitalLabel: String?
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let orbitalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupLabels()
    }
    
    private func setupLabels() {
        view.addSubview(textLabel)
        view.addSubview(orbitalLabel)
        textLabel.text = JsonParsing.textForLabel
        orbitalLabel.text = JsonParsing.orbital
        
        let constraints = [
            orbitalLabel.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -5),
            orbitalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -15),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Удалить пост?", message: "Пост нельзя будет восстановить", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Отмена")
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            print("Удалить")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
