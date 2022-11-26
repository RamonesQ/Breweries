//
//  UIColorExtension.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 26/11/22.
//

import UIKit

struct AppColorName {
	static let backgroundColor = "Background Home"
	static let breweryYellowAlpha16 = "Brewery Yellow Alpha 16"
	static let breweryYellowLight = "Brewery Yellow Light"
	static let breweryBlack = "BreweryBlack"
	static let breweryBlackLight = "BreweryBlackLight"
	static let breweryGold = "BreweryGold"
	static let breweryGrayLight = "BreweryGrayLight"
	static let breweryYellow = "BreweryYellow"
	static let grayLighter = "GrayLighter"
	static let outlineGreen = "OutlineGreen"
	static let outlineBlack = "OutlineBlack"
	static let outlineRed = "OutlineRed"
	static let yellowDark = "YellowDark"
	static let BreweryYellowPale = "BreweryYellowPale"
}

extension UIColor {
	class func backgroundColor() -> UIColor { UIColor(named: AppColorName.backgroundColor) ?? UIColor() }
	class func breweryYellowAlpha16() -> UIColor { UIColor(named: AppColorName.breweryYellowAlpha16) ?? UIColor() }
	class func breweryYellowLight() -> UIColor { UIColor(named: AppColorName.breweryYellowLight) ?? UIColor() }
	class func breweryBlack() -> UIColor { UIColor(named: AppColorName.breweryBlack) ?? UIColor() }
	class func breweryBlackLight() -> UIColor { UIColor(named: AppColorName.breweryBlackLight) ?? UIColor() }
	class func breweryGold() -> UIColor { UIColor(named: AppColorName.breweryGold) ?? UIColor() }
	class func breweryGrayLight() -> UIColor { UIColor(named: AppColorName.breweryGrayLight) ?? UIColor() }
	class func breweryYellow() -> UIColor { UIColor(named: AppColorName.breweryYellow) ?? UIColor() }
	class func grayLighter() -> UIColor { UIColor(named: AppColorName.grayLighter) ?? UIColor() }
	class func outlineGreen() -> UIColor { UIColor(named: AppColorName.outlineGreen) ?? UIColor() }
	class func outlineBlack() -> UIColor { UIColor(named: AppColorName.outlineBlack) ?? UIColor() }
	class func outlineRed() -> UIColor { UIColor(named: AppColorName.outlineRed) ?? UIColor() }
	class func yellowDark() -> UIColor { UIColor(named: AppColorName.yellowDark) ?? UIColor() }
	class func BreweryYellowPale() -> UIColor { UIColor(named: AppColorName.BreweryYellowPale) ?? UIColor() }
	class func favoriteRedColor () -> UIColor { UIColor(rgb: "#FF1744" ) }
	
	convenience init(rgb: String, alpha: CGFloat = 1.0) {
		var string = rgb.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
		
		if (string.hasPrefix("#")) {
			string.remove(at: string.startIndex)
		}
		
		var rgbValue: UInt64 = 0
		Scanner(string: string).scanHexInt64(&rgbValue)
		
		self.init(
			red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha: alpha
		)
	}
}
