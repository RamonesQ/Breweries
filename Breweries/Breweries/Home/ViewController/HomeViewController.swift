//
//  HomeViewController.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 26/11/22.
//

import UIKit

class HomeViewController: UIViewController {
	
	var mainCoordinator: MainCoordinator?
	var screen: HomeScreen?
	
	override func loadView() {
		self.setupNavigationBar()
		self.screen = HomeScreen()
		self.view = screen
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController {
	private func setupNavigationBar() {
		navigationController?.navigationBar.backgroundColor = UIColor.yellowDark()
		navigationController?.navigationBar.isTranslucent = false
		setupNavigationBarItems()
	}
	
	private func setupNavigationBarItems() {
		navigationItem.title = "Breweries"
		setupLeftNavigationBar()
		setupRightNavigationBar()
	}
	
	private func setupLeftNavigationBar() {
		let logoIcon = UIButton(type: .system)
		logoIcon.setImage(UIImage(named: "icon"), for: .normal)
		logoIcon.tintColor = .black
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoIcon)
	}
	
	private func setupRightNavigationBar() {
		let favoriteIcon = UIButton(type: .system)
		favoriteIcon.setImage(UIImage(named: "favorite_border")?.withRenderingMode(.alwaysOriginal), for: .normal)
		
		let starIcon = UIButton(type: .system)
		starIcon.setImage(UIImage(named: "star_border")?.withRenderingMode(.alwaysOriginal), for: .normal)
		starIcon.frame = CGRect(x: 0, y: 0, width: 40, height: 30)
		
		navigationItem.rightBarButtonItems = [
			 UIBarButtonItem(customView: favoriteIcon),
			 UIBarButtonItem(customView: starIcon)
		]
	}
}
