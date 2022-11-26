//
//  HomeCarrosselScreen.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 26/11/22.
//

import UIKit

class HomeCarrosselScreen: UIView {
	
	lazy var topTenLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.text = "As 10 mais bem avaliadas"
		lbl.font = UIFont.robotoRegular(ofSize: 18)
		return lbl
	}()
	
	lazy var carrosselView: UICollectionView = {
		let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
		cv.translatesAutoresizingMaskIntoConstraints = false
		cv.backgroundColor = .clear
		cv.showsVerticalScrollIndicator = false
		cv.showsHorizontalScrollIndicator = false
		cv.delaysContentTouches = false
		cv.register(CarrosselHomeCollectionViewCell.self, forCellWithReuseIdentifier: CarrosselHomeCollectionViewCell.identifier)
		let layout = UICollectionViewFlowLayout.init()
		layout.scrollDirection = .horizontal
		cv.setCollectionViewLayout(layout, animated: false)
		return cv
	}()
	
	public func delegateCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
		self.carrosselView.delegate = delegate
		self.carrosselView.dataSource = dataSource
	}
	
	public func reloadCollectionView(){
		carrosselView.reloadData()
	}
	
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
		self.addSubview(topTenLabel)
		self.addSubview(carrosselView)
	}
	
	private func setupConstraints(){
		NSLayoutConstraint.activate([
			
			self.topTenLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
			self.topTenLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
			self.topTenLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
			
			self.carrosselView.topAnchor.constraint(equalTo: self.topTenLabel.bottomAnchor, constant: 15),
			self.carrosselView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			self.carrosselView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			self.carrosselView.heightAnchor.constraint(equalToConstant: 250)
		])
	}
	
}
