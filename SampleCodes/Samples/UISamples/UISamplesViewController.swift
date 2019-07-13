//
//  UISamplesViewController.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/07/06.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class UISamplesViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	
	@IBOutlet weak var uiSamplesCollectionView: UICollectionView!
	
	let uiSamplesLayoutColNum:CGFloat = 3.0
	let uiSamplesLayoutMargin:CGFloat = 5.0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		Logger.info()
		self.title = "UI Samples"
		uiSamplesCollectionView.delegate = self
		uiSamplesCollectionView.dataSource = self
		uiSamplesCollectionView.register(UISampleCell.self, forCellWithReuseIdentifier: UISampleCell.UISampleCellIdentifer)
		
		// Do any additional setup after loading the view.
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellWidth = (collectionView.frame.width - uiSamplesLayoutMargin)/uiSamplesLayoutColNum - uiSamplesLayoutMargin
		let collectionViewCellSize = CGSize(width: cellWidth,
											height: cellWidth)
		Logger.info("collectionViewCellSize : \(collectionViewCellSize)")
		return collectionViewCellSize
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		Logger.debug("Set Cell num to \(UISamplesList.shared.count)")
		return UISamplesList.shared.count
	}
	
	internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UISampleCell = uiSamplesCollectionView.dequeueReusableCell(withReuseIdentifier: UISampleCell.UISampleCellIdentifer, for: indexPath) as! UISampleCell
		cell.uiSampleModel = UISamplesList.shared[indexPath.item]
		
		Logger.debug("\(cell)")
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let sampleCode = UISamplesList.shared[indexPath.item]
		guard let vc = sampleCode?.viewController() else {
			return
		}
		
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: uiSamplesLayoutMargin,
							left: uiSamplesLayoutMargin,
							bottom: uiSamplesLayoutMargin,
							right: uiSamplesLayoutMargin)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return uiSamplesLayoutMargin
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return uiSamplesLayoutMargin
	}
}
