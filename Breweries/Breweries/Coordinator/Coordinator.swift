//
//  Coordinator.swift
//  CoordinatorApp
//
//  Created by Ramon Queiroz dos Santos on 06/10/22.
//

import Foundation
import UIKit

protocol Coordinator {
//	 var childCoordinators: [Coordinator] { get }
	var navigationController: UINavigationController? { get set }

	 func startCoordinator()
}
