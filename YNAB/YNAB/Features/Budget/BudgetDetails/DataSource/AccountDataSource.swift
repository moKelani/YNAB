//
//  AccountDataSource.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import UIKit

class AccountDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var accountList: [Account]
    var currencySymbol: String?
    init(with accountList: [Account], currencySymbol: String?) {
        self.accountList = accountList
        self.currencySymbol = currencySymbol
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accountList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCollectionViewCell.identifier, for: indexPath) as? AccountCollectionViewCell {
            cell.bind(account: accountList[indexPath.row], symbol: currencySymbol)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 16) / 2, height: 60)
    }
    
    
   
    
}
