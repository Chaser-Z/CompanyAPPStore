//
//  APPListViewController.swift
//  CompanyAPPStore
//
//  Created by 张海南 on 2018/3/14.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import UIKit


class APPListViewController: UICollectionViewController {

    var list: [APPList] = []
    public let cellSpacing: CGFloat = 15.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()

    }
    
    private func loadData() {
        APPListFacade.getAPPList { [weak self] (list)   in
            self?.list = list
            CPLog(list)
            self?.collectionView?.reloadData()
        }
    }
    
    fileprivate func cellWidth() -> CGFloat {
        return (self.view.frame.size.width - 5 * cellSpacing) / 2.0
    }
    
    fileprivate func cellHeight() -> CGFloat {
        return cellWidth()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.list.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "APPListCell", for: indexPath) as! APPListCell
        cell.setup(app: self.list[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DownloadController") as? DownloadController {
            vc.link = self.list[indexPath.row].app_link
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension APPListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth(), height: cellHeight())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}
