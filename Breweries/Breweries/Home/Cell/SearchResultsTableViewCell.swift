//
//  SearchResultsTableViewCell.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 28/11/22.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {
	
	lazy var firstLetterLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.backgroundColor = UIColor.BreweryYellowPale()
		lbl.layer.cornerRadius = 25
		lbl.layer.masksToBounds = true
		lbl.font = UIFont.robotoRegular(ofSize: 32)
		lbl.textAlignment = .center
		lbl.text = "A"
		lbl.textColor = UIColor.breweryYellowLight()
		return lbl
	}()
	
	lazy var breweryNameLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.robotoRegular(ofSize: 16)
		lbl.text = "Cervejaria A"
		return lbl
	}()
	
	lazy var detailsLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.robotoRegular(ofSize: 16)
		lbl.text = "Cervejaria A"
		return lbl
	}()
	
	lazy var shareButton: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setBackgroundImage(UIImage(named: "icon_share"), for: .normal)
		return btn
	}()
	
	lazy var favoriteButton: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setBackgroundImage(UIImage(named: "favorite_border"), for: .normal)
		return btn
	}()

	
	static let identifier:String = "SearchResultsTableViewCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.configSuperView()
		self.setupConstraints()
		self.backgroundColor = .white
		self.clipsToBounds = true
		self.layer.cornerRadius = 35
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configSuperView(){
		self.contentView.addSubview(firstLetterLabel)
		self.contentView.addSubview(breweryNameLabel)
		self.contentView.addSubview(detailsLabel)
		self.contentView.addSubview(shareButton)
		self.contentView.addSubview(favoriteButton)
	}
	
	private func setupConstraints(){
		NSLayoutConstraint.activate([
			self.firstLetterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			self.firstLetterLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			self.firstLetterLabel.widthAnchor.constraint(equalToConstant: 50),
			self.firstLetterLabel.heightAnchor.constraint(equalToConstant: 50),
			
			self.breweryNameLabel.topAnchor.constraint(equalTo: self.firstLetterLabel.topAnchor),
			self.breweryNameLabel.leadingAnchor.constraint(equalTo: self.firstLetterLabel.trailingAnchor, constant: 5),
			
			self.detailsLabel.topAnchor.constraint(equalTo: self.breweryNameLabel.bottomAnchor, constant: 10),
			self.detailsLabel.leadingAnchor.constraint(equalTo: self.breweryNameLabel.leadingAnchor),
			self.detailsLabel.bottomAnchor.constraint(equalTo: self.firstLetterLabel.bottomAnchor),
			
			self.shareButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			self.shareButton.leadingAnchor.constraint(equalTo: self.breweryNameLabel.trailingAnchor, constant: 15),
			self.shareButton.trailingAnchor.constraint(equalTo: self.favoriteButton.leadingAnchor, constant: -10),
			
			self.favoriteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			self.favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
		])
	}

	public func setupCell(brewery: Brewery){
		self.firstLetterLabel.text =  String(describing:(brewery.name.first ?? "A"))
		self.breweryNameLabel.text = brewery.name
		self.detailsLabel.text = brewery.type //mudar
	}
}
