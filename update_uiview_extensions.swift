import Foundation
import UIKit

// Extension to add modern UI enhancements to existing UIView classes
extension UIView {
    /// Apply modern iOS 15+ visual effects and styling
    func applyModernStyling() {
        if #available(iOS 15.0, *) {
            // Apply modern configuration
            self.layer.cornerCurve = .continuous
            
            // Update shadow properties for modern look
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowOpacity = 0.1
            self.layer.shadowRadius = 4.0
        }
        
        // Apply rounded corners with modern approach
        layer.cornerRadius = bounds.height > 0 ? min(bounds.width, bounds.height) / 2 : 8
    }
    
    /// Configure modern button styling
    func configureModernButton() {
        if #available(iOS 15.0, *) {
            // Use modern UIButton.Configuration for iOS 15+
            if let button = self as? UIButton {
                var config = UIButton.Configuration.plain()
                config.baseForegroundColor = .label
                config.background.cornerRadius = 12
                
                button.configuration = config
                button.configurationUpdateHandler = { button in
                    switch button.state {
                    case .normal:
                        button.configuration?.background.backgroundColor = .systemBackground
                    case .highlighted:
                        button.configuration?.background.backgroundColor = .systemGray6
                    default:
                        break
                    }
                }
            }
        } else {
            // Fallback for earlier versions
            if let button = self as? UIButton {
                button.layer.cornerRadius = 12
                button.layer.masksToBounds = true
                button.backgroundColor = .systemBackground
            }
        }
    }
}

// Extension for modern collection view enhancements
extension UICollectionView {
    /// Configure modern supplementary views for iOS 15+
    func configureModernSupplementaryViews() {
        if #available(iOS 15.0, *) {
            // Register modern supplementary views
            register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "ModernListCell")
            
            // Configure section header behavior
            sectionViewLayout = { sectionIndex in
                return UICollectionLayoutSectionBoundarySupplementaryItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .estimated(50)
                    ),
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
            }
        }
    }
}

// Extension for modern table view enhancements
extension UITableView {
    /// Configure modern table view for iOS 15+
    func configureModernTableView() {
        if #available(iOS 15.0, *) {
            // Enable modern configuration
            sectionHeaderTopPadding = 0
            
            // Configure cell appearance
            if self.style == .insetGrouped {
                backgroundColor = .systemGroupedBackground
            } else if self.style == .plain {
                backgroundColor = .systemBackground
            }
        }
    }
}

// Extension for modern navigation controller enhancements
extension UINavigationController {
    /// Configure modern navigation appearance for iOS 15+
    func configureModernNavigationBar() {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemBackground
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
    }
}

// Extension for modern tab bar controller enhancements
extension UITabBarController {
    /// Configure modern tab bar appearance for iOS 15+
    func configureModernTabBar() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemBackground
            
            tabBar.standardAppearance = appearance
            if #available(iOS 16.0, *) {
                tabBar.compactAppearance = appearance
                tabBar.scrollEdgeAppearance = appearance
            }
        }
    }
}