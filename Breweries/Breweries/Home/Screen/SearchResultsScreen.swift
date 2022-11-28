//
//  SearchResultsScreen.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 28/11/22.
//

import UIKit

class SearchResultsScreen: UIView {
	
	lazy var titleLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.robotoRegular(ofSize: 18)
		lbl.text = "Segundo a opinião dos usuários:"
		return lbl
	}()
	
	lazy var resultsLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.quicksandRegular(ofSize: 14)
		lbl.text = "30 resultados"
		return lbl
	}()
	
	lazy var sortedByLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.robotoRegular(ofSize: 14)
		lbl.text = "Ordenar por: Nota"
		return lbl
	}()
	
	lazy var sortButton: UIButton = {
		let btn = UIButton()
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setBackgroundImage(UIImage(named: "filter_list_24px"), for: .normal)
		return btn
	}()
	
	lazy var tableView: UITableView = {
		let table = UITableView()
		table.translatesAutoresizingMaskIntoConstraints = false
		table.backgroundColor = .clear
		table.separatorStyle = .none
		table.register(SearchResultsTableViewCell.self, forCellReuseIdentifier: SearchResultsTableViewCell.identifier)
		return table
	}()
	
	public func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
		self.tableView.delegate = delegate
		self.tableView.dataSource = dataSource
	}
	
	public func reloadTableView(){
		self.tableView.reloadData()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.configSuperView()
		self.setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configSuperView(){
		self.addSubview(titleLabel)
		self.addSubview(resultsLabel)
		self.addSubview(sortedByLabel)
		self.addSubview(sortButton)
		self.addSubview(tableView)
	}
	
	private func setupConstraints(){
		NSLayoutConstraint.activate([

			self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
			self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
			self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42),

			self.resultsLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 2),
			self.resultsLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
			
			self.sortedByLabel.topAnchor.constraint(equalTo: self.resultsLabel.bottomAnchor, constant: 20),
			self.sortedByLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
			self.sortedByLabel.trailingAnchor.constraint(equalTo: self.sortButton.leadingAnchor, constant: -35),
			
			self.sortButton.topAnchor.constraint(equalTo: self.sortedByLabel.topAnchor),
			self.sortButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -17),
			
			self.tableView.topAnchor.constraint(equalTo: sortedByLabel.bottomAnchor, constant: 5),
			self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
			self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
			self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18)
		])
	}
}
