//
//  ViewController.swift
//  MoviesAPP
//
//  Created by rai on 07/10/23.
//  Copyright © 2023 Railson Dev. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        return imageView
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor.white
        button.setTitle("Random Photo", for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        setupNavigation()
    }
    
    private func setupNavigation(){
        let navigationBar: UINavigationBar = {
            let navigationBar = UINavigationBar(frame: CGRect(x:0,y:view.safeAreaInsets.top,width:self.view.frame.width,height:44))
            let navigationItem = UINavigationItem(title: "Random Photo")
            navigationBar.setItems([navigationItem], animated: false)
            return navigationBar;
        }()
        view.addSubview(navigationBar)
    }
    
    
    @objc func didTapButton(){
        getRandomPhoto()
    }
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
    }
    
}

extension HomeViewController: ViewCode{
    func buildHierarchy() {
        view.addSubview(imageView)
        view.addSubview(button)
    }
    
    func setupContraints() {
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
    }
    
    func applyAdditionalChanges() {
        view.backgroundColor = UIColor.purple
        button.addTarget(self, action: #selector(didTapButton), for: UIControlEvents.touchUpInside)
        
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height:55
        )
        
        getRandomPhoto()
    }
}

