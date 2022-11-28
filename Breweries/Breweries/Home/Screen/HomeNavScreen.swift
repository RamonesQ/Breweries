//
//  HomeNavScreen.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 26/11/22.
//

import UIKit

class HomeNavScreen: UIView {
	
	lazy var backgroundImage: UIImageView = {
		let img = UIImageView()
		img.translatesAutoresizingMaskIntoConstraints = false
		img.image = UIImage(named: "Frame 168")
		return img
	}()
	
	lazy var titleLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.robotoRegular(ofSize: 18)
		lbl.text = "Bem-Vindo(a)!"
		return lbl
	}()
	
	lazy var subtitleLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.robotoRegular(ofSize: 18)
		lbl.text = "Encontre as melhores Cervejarias!"
		return lbl
	}()
	
	lazy var searchBar: UISearchBar = {
		let sb = UISearchBar()
		sb.translatesAutoresizingMaskIntoConstraints = false
		sb.placeholder = "Busque por local"
		sb.searchTextField.layer.cornerRadius = 20
		sb.searchTextField.layer.masksToBounds = true
		sb.searchTextField.backgroundColor = UIColor.BreweryYellowPale()
		sb.searchTextField.font = UIFont.robotoRegular(ofSize: 14)
		sb.searchBarStyle = .minimal
		sb.isUserInteractionEnabled = true
		return sb
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.configSuperView()
		self.setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configSuperView(){
		self.addSubview(backgroundImage)
		self.backgroundImage.addSubview(titleLabel)
		self.backgroundImage.addSubview(subtitleLabel)
		self.backgroundImage.addSubview(searchBar)
	}
	
	private func setupConstraints(){
		NSLayoutConstraint.activate([
			self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
			self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -1),
			self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			self.backgroundImage.heightAnchor.constraint(equalToConstant: 160),
			
			self.titleLabel.topAnchor.constraint(equalTo: self.backgroundImage.topAnchor, constant: 14),
			self.titleLabel.leadingAnchor.constraint(equalTo: self.backgroundImage.leadingAnchor, constant: 12),
			self.titleLabel.trailingAnchor.constraint(equalTo: self.backgroundImage.trailingAnchor, constant: -50),
			
			self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5),
			self.subtitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
			self.subtitleLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
			
			self.searchBar.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 12),
			self.searchBar.leadingAnchor.constraint(equalTo: self.backgroundImage.leadingAnchor, constant: 9),
			self.searchBar.trailingAnchor.constraint(equalTo: self.backgroundImage.trailingAnchor, constant: -9),
			self.searchBar.bottomAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: -25)
		])
	}
	
}
