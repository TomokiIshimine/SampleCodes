//
//  ViewController.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/04/28.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class SampleCodesViewController: BaseViewController ,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
	
	let sampleCodesLayoutColNum:CGFloat = 3.0
	let sampleCodesLayoutMargin:CGFloat = 5.0
	
	@IBOutlet weak var sampleCodesCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
		Logger.info()
		self.title = "Sample Codes"
		sampleCodesCollectionView.delegate = self
		sampleCodesCollectionView.dataSource = self
		sampleCodesCollectionView.register(SampleCodeCell.self, forCellWithReuseIdentifier: SampleCodeCell.SampleCodeCellIdentifer)
		
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellWidth = (collectionView.frame.width - sampleCodesLayoutMargin)/sampleCodesLayoutColNum - sampleCodesLayoutMargin
        let collectionViewCellSize = CGSize(width: cellWidth,
											height: cellWidth)
		Logger.info("collectionViewCellSize : \(collectionViewCellSize)")
        return collectionViewCellSize
    }
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		Logger.debug("Set Cell num to \(SampleCodeList.shared.count)")
		return SampleCodeList.shared.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:SampleCodeCell = sampleCodesCollectionView.dequeueReusableCell(withReuseIdentifier: SampleCodeCell.SampleCodeCellIdentifer, for: indexPath) as! SampleCodeCell
		cell.sampleCodeModel = SampleCodeList.shared[indexPath.item]
		
		Logger.debug("\(cell)")
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let sampleCode = SampleCodeList.shared[indexPath.item]
		guard let vc = sampleCode?.viewController() else {
			return
		}
		
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: sampleCodesLayoutMargin,
							left: sampleCodesLayoutMargin,
							bottom: sampleCodesLayoutMargin,
							right: sampleCodesLayoutMargin)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return sampleCodesLayoutMargin
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return sampleCodesLayoutMargin
	}
}

