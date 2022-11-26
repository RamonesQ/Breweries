//
//  HomeScreen.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 26/11/22.
//

import UIKit

class HomeScreen: UIView {
	
	lazy var navView: HomeNavScreen = {
		let view = HomeNavScreen()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.backgroundColor()
		self.configSuperView()
		self.setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configSuperView(){
		self.addSubview(navView)
	}
	
	private func setupConstraints(){
		NSLayoutConstraint.activate([
			self.navView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			self.navView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			self.navView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			self.navView.heightAnchor.constraint(equalToConstant: 160)
		])
	}
	
}
