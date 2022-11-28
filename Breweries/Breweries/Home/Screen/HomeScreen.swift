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
	
	lazy var carrosselView: HomeCarrosselScreen = {
		let view = HomeCarrosselScreen()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.backgroundColor()
		self.configSuperView()
		self.setupConstraints()
		self.configCollectionView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	private func configCollectionView(){
		self.carrosselView.delegateCollectionView(delegate: self, dataSource: self)
	}
	
	private func configSuperView(){
		self.addSubview(navView)
		self.addSubview(carrosselView)
	}
	
	private func setupConstraints(){
		NSLayoutConstraint.activate([
			self.navView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			self.navView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			self.navView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			self.navView.heightAnchor.constraint(equalToConstant: 160),
			
			self.carrosselView.topAnchor.constraint(equalTo: self.navView.bottomAnchor, constant: 10),
			self.carrosselView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			self.carrosselView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			self.carrosselView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}
	
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		topTenMock.count
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarrosselHomeCollectionViewCell.identifier, for: indexPath) as? CarrosselHomeCollectionViewCell
		cell?.setupCell(brewery: topTenMock[indexPath.row])
		return cell ?? UICollectionViewCell()
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.size.width/3, height: 250)
	}
}
