import Foundation
import UIKit

// Extension to add iOS 15+ specific features and visual enhancements
extension UIView {
    /// Apply iOS 15+ "Liquid Glass" visual effects and styling
    func applyLiquidGlassEffect() {
        if #available(iOS 15.0, *) {
            // Create a modern material-based visual effect view
            let materialView = UIVisualEffectView()
            
            // Use the modern system materials that have the "Liquid Glass" appearance
            materialView.effect = UIBlurEffect(style: .systemMaterial)
            materialView.layer.cornerCurve = .continuous
            materialView.layer.cornerRadius = 16
            
            // Configure for the new iOS 15+ appearance
            materialView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(materialView)
            NSLayoutConstraint.activate([
                materialView.topAnchor.constraint(equalTo: self.topAnchor),
                materialView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                materialView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                materialView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
    }
    
    /// Apply iOS 15+ modern configuration to buttons
    func configureModernButtonIOS15() {
        if #available(iOS 15.0, *) {
            if let button = self as? UIButton {
                // Use the new iOS 15 button configuration system
                var config = UIButton.Configuration.filled()
                config.titleAlignment = .leading
                config.buttonSize = .large
                config.cornerStyle = .medium
                
                // Apply modern color scheme
                config.baseBackgroundColor = UIColor.systemBackground
                config.baseForegroundColor = UIColor.label
                
                button.configuration = config
                
                // Add hover effect for iPad/macCatalyst
                if #available(iOS 16.0, *) {
                    button.isPointerInteractionEnabled = true
                }
                
                // Configure the button's state update handler
                button.configurationUpdateHandler = { button in
                    switch button.state {
                    case .normal:
                        button.configuration?.baseBackgroundColor = .systemBackground
                    case .highlighted:
                        button.configuration?.baseBackgroundColor = .systemGray6
                    case .disabled:
                        button.configuration?.baseBackgroundColor = .systemGray5
                    default:
                        break
                    }
                }
            }
        } else {
            // Fallback for earlier versions
            if let button = self as? UIButton {
                button.layer.cornerRadius = 8
                button.layer.masksToBounds = true
                button.backgroundColor = .systemBackground
            }
        }
    }
}

// Extension for modern collection view enhancements with iOS 15+ features
extension UICollectionView {
    /// Configure modern supplementary views for iOS 15+
    func configureModernSupplementaryViewsIOS15() {
        if #available(iOS 15.0, *) {
            // Register modern supplementary views with new iOS 15+ configurations
            register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "ModernListCell")
            
            // Configure section header behavior with iOS 15+ features
            sectionHeaderTopPadding = 0
            
            // Apply modern iOS 15+ material backgrounds
            backgroundColor = .systemBackground
        }
        
        if #available(iOS 16.0, *) {
            // Additional iOS 16+ features
            isPrefetchingEnabled = true
        }
    }
    
    /// Create a modern iOS 15+ collection view layout with "Liquid Glass" elements
    static func createModernLayoutIOS15() -> UICollectionViewCompositionalLayout {
        if #available(iOS 15.0, *) {
            // Create a modern compositional layout with iOS 15+ features
            let config = UICollectionViewCompositionalLayoutConfiguration()
            config.interSectionSpacing = 20
            
            return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
                // Define a modern section with iOS 15+ design principles
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(100)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(100)
                )
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                
                // Add supplementary views for headers with iOS 15+ materials
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(50)
                )
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                // Apply iOS 15+ visual effect to header
                if #available(iOS 15.0, *) {
                    header.edgeSpacing = .init(leading: .fixed(0), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(10))
                }
                
                section.boundarySupplementaryItems = [header]
                return section
            }, configuration: config)
        } else {
            // Fallback for earlier versions
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(100)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(100)
            )
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: groupSize,
                subitems: [item]
            )
            
            let section = NSCollectionLayoutSection(group: group)
            return UICollectionViewCompositionalLayout(section: section)
        }
    }
}

// Extension for modern table view enhancements with iOS 15+ features
extension UITableView {
    /// Configure modern table view for iOS 15+
    func configureModernTableViewIOS15() {
        if #available(iOS 15.0, *) {
            // Enable modern configuration with iOS 15+ features
            sectionHeaderTopPadding = 0
            
            // Configure cell appearance with iOS 15+ materials
            if self.style == .insetGrouped {
                backgroundColor = .systemGroupedBackground
            } else if self.style == .plain {
                backgroundColor = .systemBackground
            }
            
            // Apply modern iOS 15+ separators
            separatorStyle = .none
        }
    }
}

// Extension for modern navigation controller enhancements with iOS 15+ features
extension UINavigationController {
    /// Configure modern navigation appearance for iOS 15+ with "Liquid Glass"
    func configureModernNavigationBarIOS15() {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            
            // Use iOS 15+ system materials for the "Liquid Glass" effect
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            
            // Apply modern blur effect
            appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            // Configure title display mode
            appearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.label
            ]
            
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.label
            ]
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
            
            // Make the navigation bar translucent for the "Liquid Glass" effect
            navigationBar.isTranslucent = true
            navigationBar.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
        }
    }
}

// Extension for modern tab bar controller enhancements with iOS 15+ features
extension UITabBarController {
    /// Configure modern tab bar appearance for iOS 15+ with "Liquid Glass"
    func configureModernTabBarIOS15() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            
            // Use iOS 15+ system materials for the "Liquid Glass" effect
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            
            // Apply modern blur effect
            appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            tabBar.standardAppearance = appearance
            
            if #available(iOS 16.0, *) {
                tabBar.compactAppearance = appearance
                tabBar.scrollEdgeAppearance = appearance
            }
        }
    }
}

// Extension for iOS 15+ Control Configuration
extension UIControl {
    /// Configure modern iOS 15+ control appearance
    func configureModernControlIOS15() {
        if #available(iOS 15.0, *) {
            // Use the new configuration API introduced in iOS 15
            self.layer.cornerCurve = .continuous
            
            // Apply subtle shadow for depth as per iOS 15 design
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 1)
            self.layer.shadowOpacity = 0.1
            self.layer.shadowRadius = 2.0
        }
    }
}

// Extension for iOS 15+ Material Views
extension UIVisualEffectView {
    /// Create a modern iOS 15+ material view with "Liquid Glass" appearance
    @available(iOS 15.0, *)
    static func createLiquidGlassMaterial() -> UIVisualEffectView {
        let materialView = UIVisualEffectView()
        
        // Use the modern iOS 15+ system materials
        materialView.effect = UIBlurEffect(style: .systemMaterial)
        
        // Apply continuous corner curves (iOS 15+ feature)
        materialView.layer.cornerCurve = .continuous
        materialView.layer.cornerRadius = 16
        
        // Configure for proper blending
        materialView.clipsToBounds = false
        
        return materialView
    }
    
    /// Create a modern iOS 15+ prominent material view with "Liquid Glass" appearance
    @available(iOS 15.0, *)
    static func createProminentLiquidGlassMaterial() -> UIVisualEffectView {
        let materialView = UIVisualEffectView()
        
        // Use the prominent system material for more contrast
        materialView.effect = UIBlurEffect(style: .systemMaterialProminent)
        
        // Apply continuous corner curves (iOS 15+ feature)
        materialView.layer.cornerCurve = .continuous
        materialView.layer.cornerRadius = 20
        
        // Configure for proper blending
        materialView.clipsToBounds = false
        
        return materialView
    }
}

// Extension for iOS 15+ Toolbar Configuration
extension UIToolbar {
    /// Configure modern toolbar appearance for iOS 15+
    func configureModernToolbarIOS15() {
        if #available(iOS 15.0, *) {
            let appearance = UIToolbarAppearance()
            
            // Use iOS 15+ system materials
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            
            // Apply modern blur effect
            appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            self.standardAppearance = appearance
            
            if #available(iOS 16.0, *) {
                self.compactAppearance = appearance
                self.scrollEdgeAppearance = appearance
            }
        }
    }
}

// Extension for iOS 15+ Search Controller Configuration
extension UISearchController {
    /// Configure modern search controller appearance for iOS 15+
    func configureModernSearchControllerIOS15() {
        if #available(iOS 15.0, *) {
            // Use iOS 15+ search bar styling
            searchBar.searchBarStyle = .default
            
            // Configure search bar appearance with iOS 15+ materials
            let searchAppearance = UISearchBarAppearance()
            searchAppearance.configureWithDefaultBackground()
            
            // Apply material effect
            searchAppearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            searchBar.standardAppearance = searchAppearance
            searchBar.scrollEdgeAppearance = searchAppearance
        }
    }
}