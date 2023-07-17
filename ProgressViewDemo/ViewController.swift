//
//  ViewController.swift
//  ProgressViewDemo
//
//  Created by Platfarm on 2023/07/17.
//

import UIKit

class ViewController: UIViewController {

    private let lvlLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Lv.1"
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 11.0)
        lbl.backgroundColor = .systemPink
        lbl.clipsToBounds = true
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let prgLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "50%"
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let prgBar: UIProgressView = {
        let bar = UIProgressView()
        bar.progress = 0.0
        bar.clipsToBounds = true
        bar.progressViewStyle = .default
        bar.progressTintColor = .systemPink
        bar.trackTintColor = .systemGray
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(prgBar)
        view.addSubview(lvlLabel)
        prgBar.addSubview(prgLabel)
        
        NSLayoutConstraint.activate([
            
            prgBar.topAnchor.constraint(equalToSystemSpacingBelow: lvlLabel.topAnchor, multiplier: 0.5),
            lvlLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: prgBar.bottomAnchor, multiplier: 0.5),
            lvlLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            prgBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lvlLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: prgBar.leadingAnchor, multiplier: 1.5),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: prgBar.trailingAnchor, multiplier: 16),
            prgBar.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            prgLabel.centerXAnchor.constraint(equalTo: prgBar.centerXAnchor),
            prgLabel.centerYAnchor.constraint(equalTo: prgBar.centerYAnchor)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.prgBar.setProgress(0.1, animated: true)
        }
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        NSLayoutConstraint.activate([
            lvlLabel.widthAnchor.constraint(equalTo: lvlLabel.heightAnchor)
        ])
        
        lvlLabel.layer.cornerRadius = lvlLabel.frame.height / 2
        
        prgBar.layer.cornerRadius = prgBar.frame.height / 2
        prgBar.layer.sublayers![1].cornerRadius = prgBar.frame.height / 2
        prgBar.subviews[1].clipsToBounds = true
    }

}

