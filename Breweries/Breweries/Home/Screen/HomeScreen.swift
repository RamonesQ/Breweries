//
//  HomeScreen.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 26/11/22.
//

import UIKit

class HomeScreen: UIView {
	
	var filtered: [Brewery] = []
	var isSearching: Bool = false
	
	lazy var searchBar: UISearchBar = {
		let sb = UISearchBar()
		sb.translatesAutoresizingMaskIntoConstraints = false
		sb.placeholder = "Busque por local"
		sb.searchTextField.layer.cornerRadius = 20
		sb.searchTextField.layer.masksToBounds = true
		sb.searchTextField.backgroundColor = UIColor.BreweryYellowPale()
		sb.searchTextField.font = UIFont.robotoRegular(ofSize: 14)
		sb.searchBarStyle = .minimal
		return sb
	}()
	
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
	
	lazy var searchResult: SearchResultsScreen = {
		let view = SearchResultsScreen()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var emptySearch: EmptySearchScreen = {
		let view = EmptySearchScreen()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var noResult: NoResultScreen = {
		let view = NoResultScreen()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.backgroundColor()
		self.configSuperView()
		self.setupConstraints()
		self.configCollectionView()
		self.configTableView()
		self.searchBar.delegate = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	private func configCollectionView(){
		self.carrosselView.delegateCollectionView(delegate: self, dataSource: self)
	}
	
	private func configTableView(){
		self.searchResult.configTableView(delegate: self, dataSource: self)
	}
	
	private func configSuperView(){
		self.addSubview(navView)
		self.addSubview(searchBar)
		self.addSubview(searchResult)
	}
	
	private func setupConstraints(){
		NSLayoutConstraint.activate([
			self.searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
			self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 9),
			self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -9),
			self.searchBar.heightAnchor.constraint(equalToConstant: 40),
			
			self.navView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			self.navView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			self.navView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			self.navView.heightAnchor.constraint(equalToConstant: 160),
			
			//			self.carrosselView.topAnchor.constraint(equalTo: self.navView.bottomAnchor, constant: 10),
			//			self.carrosselView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			//			self.carrosselView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			//			self.carrosselView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			
			self.searchResult.topAnchor.constraint(equalTo: self.navView.bottomAnchor, constant: 10),
			self.searchResult.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			self.searchResult.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			self.searchResult.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			
			//			self.emptySearch.topAnchor.constraint(equalTo: self.navView.bottomAnchor, constant: 10),
			//			self.emptySearch.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			//			self.emptySearch.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			//			self.emptySearch.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			
			//			self.noResult.topAnchor.constraint(equalTo: self.navView.bottomAnchor, constant: 10),
			//			self.noResult.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			//			self.noResult.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			//			self.noResult.bottomAnchor.constraint(equalTo: self.bottomAnchor)
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

extension HomeScreen: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		if isSearching {
			return filtered.count
		}
		return breweriesMock.count
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultsTableViewCell.identifier, for: indexPath) as? SearchResultsTableViewCell
		if isSearching {
			cell?.setupCell(brewery: filtered[indexPath.section])
			
		}else {
			cell?.setupCell(brewery: breweriesMock[indexPath.section])
		}
		return cell ?? UITableViewCell()
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 65
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("You tapped cell number \(indexPath.section).")
	}
}


extension HomeScreen : UISearchBarDelegate {
	
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		isSearching = true;
	}
	
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		isSearching = false;
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		isSearching = false;
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		isSearching = false;
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		filtered.removeAll(keepingCapacity: false)
		let searchPredicate = searchBar.text!
		filtered = breweriesMock.filter( {$0.name.range(of: searchPredicate) != nil})
		isSearching = (filtered.count == 0) ? false: true
		searchResult.tableView.reloadData()
	}
	
}


