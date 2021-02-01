//
//  BudgetDetailsDataSource.swift
//  YNAB
//
//  Created by Mohamed Kelany on 01/02/2021.
//

import UIKit

class BudgetDetailsDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var accountList: [Account]
    var payeeList: [Payee]
    var currencySymbol: String?
    init(with accountList: [Account], payeeList: [Payee],  currencySymbol: String?) {
        self.accountList = accountList
        self.payeeList = payeeList
        self.currencySymbol = currencySymbol
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            if accountList.count == 0 {
                return 1
            }
            return accountList.count
        case 1:
            if payeeList.count == 0 {
                return 1
            }
            return payeeList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCollectionViewCell.identifier, for: indexPath) as? AccountCollectionViewCell {
            switch indexPath.section {
            case 0:
                if accountList.count == 0 {
                    cell.setViewEmptyView(emptyPlaceHolderType: .emptyRecord, action: nil)
                    return cell
                }
                cell.bindAccount(account: accountList[indexPath.row], symbol: currencySymbol)
            case 1:
                if payeeList.count == 0 {
                    cell.setViewEmptyView(emptyPlaceHolderType: .emptyRecord, action: nil)
                    return cell
                }
                cell.bindPayee(payee: payeeList[indexPath.row])
            default:
                print("un defined cell")
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    // MARK: Header
   func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       switch kind {
       case UICollectionView.elementKindSectionHeader:

        if let  headerView: SectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as? SectionHeader {
            switch indexPath.section {
            case 0:
                headerView.bind(title: "Accounts")
            case 1:
                headerView.bind(title: "Payees")
            default:
                print("un defined section")
            }
            
            return headerView
        }
        return UICollectionReusableView()
       default:  fatalError("Unexpected element kind")
       }
   }
    
    
}
extension BudgetDetailsDataSource: UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           return CGSize(width: collectionView.frame.size.width, height: 30)
   }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 32) / 2, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
