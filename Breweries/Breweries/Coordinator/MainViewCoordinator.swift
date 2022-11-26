//
//  File.swift
//  APODViwer
//
//  Created by Ramon Queiroz dos Santos on 04/10/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
	var navigationController: UINavigationController?
	 func startCoordinator() {
		 let vc = ViewController()
		 		vc.mainCoordinator = self
		 navigationController?.pushViewController(vc, animated: false)
	 }

}
