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

