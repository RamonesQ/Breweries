//
//  ViewController.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 26/11/22.
//

import UIKit

class ViewController: UIViewController {
	
	var mainCoordinator: MainCoordinator?

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .lightGray
		self.navigationController?.navigationBar.backgroundColor = .yellow
		self.title = "Brewery"
	}


}

