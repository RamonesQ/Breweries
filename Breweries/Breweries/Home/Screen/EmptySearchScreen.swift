//
//  EmptySearchScreen.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 28/11/22.
//

import UIKit

class EmptySearchScreen: UIView {
	
	lazy var titleLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.textAlignment = .center
		lbl.font = UIFont.robotoRegular(ofSize: 20)
		lbl.text = "Nenhum termo digitado"
		lbl.numberOfLines = 0
		return lbl
	}()
	
	lazy var subtitleLabel: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.textAlignment = .center
		lbl.font = UIFont.robotoRegular(ofSize: 16)
		lbl.text = "Por favor, verifique sua pesquisa e tente novamente para obter resultados."
		lbl.numberOfLines = 0
		return lbl
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
		self.addSubview(self.titleLabel)
		self.addSubview(self.subtitleLabel)
	}
	
	private func setupConstraints(){
		NSLayoutConstraint.activate([
			self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
			self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.titleLabel.widthAnchor.constraint(equalToConstant: 300),
			
			self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
			self.subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.subtitleLabel.widthAnchor.constraint(equalToConstant: 342),

		])
	}

}
