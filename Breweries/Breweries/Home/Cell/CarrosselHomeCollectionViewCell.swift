//
//  CarrosselHomeCollectionViewCell.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 26/11/22.
//

import UIKit

class CarrosselHomeCollectionViewCell: UICollectionViewCell {
    
	static let identifier: String = "CarrosselHomeCollectionViewCell"
	
	lazy var breweryImageView: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		image.image = UIImage(named: "Sucess")
		return image
	}()
	
	lazy var breweryName: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.robotoRegular(ofSize: 16)
		return lbl
	}()
	
	lazy var breweryStar: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		image.image = UIImage(named: "Star 1")
		return image
	}()
	
	lazy var breweryRating: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.robotoRegular(ofSize: 14)
		return lbl
	}()
	
	lazy var breweryType: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.robotoRegular(ofSize: 14)
		return lbl
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.configSuperView()
		self.setupConstraints()
		self.backgroundColor = .white
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configSuperView(){
		self.addSubview(breweryImageView)
		self.addSubview(breweryName)
		self.addSubview(breweryStar)
		self.addSubview(breweryRating)
		self.addSubview(breweryType)
	}
	
	private func setupConstraints(){
		NSLayoutConstraint.activate([
			self.breweryImageView.topAnchor.constraint(equalTo: self.topAnchor),
			self.breweryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			self.breweryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			
			self.breweryName.topAnchor.constraint(equalTo: self.breweryImageView.bottomAnchor, constant: 10),
			self.breweryName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
			self.breweryName.trailingAnchor.constraint(equalTo: self.breweryImageView.trailingAnchor),
			
			self.breweryStar.topAnchor.constraint(equalTo: self.breweryName.bottomAnchor, constant: 5),
			self.breweryStar.leadingAnchor.constraint(equalTo: self.breweryName.leadingAnchor),
			self.breweryStar.trailingAnchor.constraint(equalTo: self.breweryRating.leadingAnchor),
			
			self.breweryRating.topAnchor.constraint(equalTo: self.breweryName.bottomAnchor, constant: 5),
			self.breweryRating.trailingAnchor.constraint(equalTo: self.breweryImageView.trailingAnchor),
			
			self.breweryType.topAnchor.constraint(equalTo: self.breweryStar.bottomAnchor, constant: 8),
			self.breweryType.leadingAnchor.constraint(equalTo: self.breweryStar.leadingAnchor),
			self.breweryType.trailingAnchor.constraint(equalTo: self.breweryRating.trailingAnchor),
			self.breweryType.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -29)
		])
	}
	
	public func setupCell(brewery:Brewery10?){
		self.breweryName.text = brewery?.name ?? ""
		if let rating = brewery?.average{
			self.breweryRating.text = "\(rating)"
		}
		self.breweryType.text = brewery?.type ?? ""
	}
}
