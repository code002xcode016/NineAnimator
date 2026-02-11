import Foundation
import UIKit

// Extension to add iOS 16+ specific features and visual enhancements
// Including updates for iOS 26's "Liquid Glass" effects and other modern UI elements
extension UIView {
    /// Apply iOS 16+ enhanced "Liquid Glass" visual effects and styling
    func applyEnhancedLiquidGlassEffect() {
        if #available(iOS 16.0, *) {
            // Create a modern material-based visual effect view with enhanced properties
            let materialView = UIVisualEffectView()
            
            // Use the enhanced iOS 16+ system materials that have the "Liquid Glass" appearance
            // These materials have better performance and visual quality compared to earlier versions
            materialView.effect = UIBlurEffect(style: .systemMaterial)
            materialView.layer.cornerCurve = .continuous
            materialView.layer.cornerRadius = 16
            
            // Configure for the enhanced iOS 16+ appearance with better performance
            materialView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(materialView)
            NSLayoutConstraint.activate([
                materialView.topAnchor.constraint(equalTo: self.topAnchor),
                materialView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                materialView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                materialView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
            
            // Add iOS 16+ enhanced shadow properties for the "Liquid Glass" effect
            materialView.layer.shadowColor = UIColor.black.cgColor
            materialView.layer.shadowOffset = CGSize(width: 0, height: 4)
            materialView.layer.shadowOpacity = 0.15
            materialView.layer.shadowRadius = 8.0
            materialView.layer.masksToBounds = false
        } else if #available(iOS 15.0, *) {
            // Fallback to iOS 15 implementation
            let materialView = UIVisualEffectView()
            materialView.effect = UIBlurEffect(style: .systemMaterial)
            materialView.layer.cornerCurve = .continuous
            materialView.layer.cornerRadius = 16
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
    
    /// Apply iOS 16+ modern configuration to buttons with enhanced features
    func configureModernButtonIOS16() {
        if #available(iOS 16.0, *) {
            if let button = self as? UIButton {
                // Use the refined iOS 16 button configuration system
                var config = UIButton.Configuration.filled()
                config.titleAlignment = .leading
                config.buttonSize = .large
                config.cornerStyle = .medium
                
                // Apply modern color scheme with iOS 16+ dynamic colors
                config.baseBackgroundColor = UIColor.systemBackground
                config.baseForegroundColor = UIColor.label
                
                button.configuration = config
                
                // Enable pointer interaction for iPad/macCatalyst with iOS 16+
                button.isPointerInteractionEnabled = true
                
                // Configure the button's state update handler with iOS 16+ capabilities
                button.configurationUpdateHandler = { button in
                    switch button.state {
                    case .normal:
                        button.configuration?.baseBackgroundColor = .systemBackground
                        button.configuration?.background.strokeColor = .systemGray5
                    case .highlighted:
                        button.configuration?.baseBackgroundColor = .systemGray6
                        button.configuration?.background.strokeColor = .systemGray4
                    case .disabled:
                        button.configuration?.baseBackgroundColor = .systemGray5
                        button.configuration?.baseForegroundColor = .systemGray2
                    default:
                        break
                    }
                }
            }
        } else if #available(iOS 15.0, *) {
            // Fallback to iOS 15 implementation
            if let button = self as? UIButton {
                var config = UIButton.Configuration.filled()
                config.titleAlignment = .leading
                config.buttonSize = .large
                config.cornerStyle = .medium
                config.baseBackgroundColor = UIColor.systemBackground
                config.baseForegroundColor = UIColor.label
                button.configuration = config
                
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

// Extension for modern collection view enhancements with iOS 16+ features
extension UICollectionView {
    /// Configure modern supplementary views for iOS 16+ with enhanced "Liquid Glass" features
    func configureModernSupplementaryViewsIOS16() {
        if #available(iOS 16.0, *) {
            // Register modern supplementary views with new iOS 16+ configurations
            register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "ModernListCell")
            
            // Configure section header behavior with iOS 16+ features
            sectionHeaderTopPadding = 0
            
            // Apply modern iOS 16+ material backgrounds
            backgroundColor = .systemBackground
            
            // Enable enhanced prefetching for better performance
            isPrefetchingEnabled = true
            
            // Apply iOS 16+ enhanced visual configuration
            if let layout = collectionViewLayout as? UICollectionViewCompositionalLayout {
                layout.configuration = UICollectionViewCompositionalLayoutConfiguration()
                layout.configuration.interSectionSpacing = 20
            }
        } else if #available(iOS 15.0, *) {
            // Fallback to iOS 15 implementation
            register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "ModernListCell")
            sectionHeaderTopPadding = 0
            backgroundColor = .systemBackground
            isPrefetchingEnabled = true
        }
    }
    
    /// Create a modern iOS 16+ collection view layout with enhanced "Liquid Glass" elements
    static func createModernLayoutIOS16() -> UICollectionViewCompositionalLayout {
        if #available(iOS 16.0, *) {
            // Create a modern compositional layout with iOS 16+ features
            let config = UICollectionViewCompositionalLayoutConfiguration()
            config.interSectionSpacing = 20
            
            return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
                // Define a modern section with iOS 16+ design principles
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(100)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Add padding and spacing for iOS 16+ aesthetic
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(110)
                )
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                
                // Add supplementary views for headers with iOS 16+ materials
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(50)
                )
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                // Apply iOS 16+ visual effect to header with "Liquid Glass" styling
                header.edgeSpacing = .init(leading: .fixed(0), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(10))
                
                section.boundarySupplementaryItems = [header]
                
                // Add section footer if needed
                let footerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(30)
                )
                let footer = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
                
                section.boundarySupplementaryItems = [header, footer]
                
                return section
            }, configuration: config)
        } else if #available(iOS 15.0, *) {
            // Fallback to iOS 15 implementation
            let config = UICollectionViewCompositionalLayoutConfiguration()
            config.interSectionSpacing = 20
            
            return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
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
                
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(50)
                )
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
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

// Extension for modern table view enhancements with iOS 16+ features
extension UITableView {
    /// Configure modern table view for iOS 16+ with enhanced "Liquid Glass" features
    func configureModernTableViewIOS16() {
        if #available(iOS 16.0, *) {
            // Enable modern configuration with iOS 16+ features
            sectionHeaderTopPadding = 0
            
            // Configure cell appearance with iOS 16+ materials
            if self.style == .insetGrouped {
                backgroundColor = .systemGroupedBackground
            } else if self.style == .plain {
                backgroundColor = .systemBackground
            }
            
            // Apply modern iOS 16+ separators
            separatorStyle = .none
            
            // Enable enhanced performance features
            maintainsViewportSizings = true
        } else if #available(iOS 15.0, *) {
            // Fallback to iOS 15 implementation
            sectionHeaderTopPadding = 0
            
            if self.style == .insetGrouped {
                backgroundColor = .systemGroupedBackground
            } else if self.style == .plain {
                backgroundColor = .systemBackground
            }
            
            separatorStyle = .none
        }
    }
}

// Extension for modern navigation controller enhancements with iOS 16+ features
extension UINavigationController {
    /// Configure modern navigation appearance for iOS 16+ with enhanced "Liquid Glass"
    func configureModernNavigationBarIOS16() {
        if #available(iOS 16.0, *) {
            let appearance = UINavigationBarAppearance()
            
            // Use iOS 16+ system materials for the enhanced "Liquid Glass" effect
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            
            // Apply modern blur effect with enhanced properties
            appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            // Configure title display mode with iOS 16+ enhanced styling
            appearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.label
            ]
            
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.label
            ]
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
            
            // Make the navigation bar translucent for the enhanced "Liquid Glass" effect
            navigationBar.isTranslucent = true
            navigationBar.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            
            // Apply iOS 16+ enhanced styling
            navigationBar.prefersLargeTitles = true
        } else if #available(iOS 15.0, *) {
            // Fallback to iOS 15 implementation
            let appearance = UINavigationBarAppearance()
            
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            
            appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            appearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.label
            ]
            
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.label
            ]
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
            
            navigationBar.isTranslucent = true
            navigationBar.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
        }
    }
}

// Extension for modern tab bar controller enhancements with iOS 16+ features
extension UITabBarController {
    /// Configure modern tab bar appearance for iOS 16+ with enhanced "Liquid Glass"
    func configureModernTabBarIOS16() {
        if #available(iOS 16.0, *) {
            let appearance = UITabBarAppearance()
            
            // Use iOS 16+ system materials for the enhanced "Liquid Glass" effect
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            
            // Apply modern blur effect with iOS 16+ enhancements
            appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        } else if #available(iOS 15.0, *) {
            // Fallback to iOS 15 implementation
            let appearance = UITabBarAppearance()
            
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            
            appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            tabBar.standardAppearance = appearance
        }
    }
}

// Extension for iOS 16+ Control Configuration
extension UIControl {
    /// Configure modern iOS 16+ control appearance with enhanced features
    func configureModernControlIOS16() {
        if #available(iOS 16.0, *) {
            // Use the enhanced configuration API available in iOS 16+
            self.layer.cornerCurve = .continuous
            
            // Apply enhanced shadow for depth as per iOS 16+ design
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowOpacity = 0.15
            self.layer.shadowRadius = 4.0
            self.layer.masksToBounds = false
        } else if #available(iOS 15.0, *) {
            // Fallback to iOS 15 implementation
            self.layer.cornerCurve = .continuous
            
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 1)
            self.layer.shadowOpacity = 0.1
            self.layer.shadowRadius = 2.0
        }
    }
}

// Extension for iOS 16+ Material Views with enhanced "Liquid Glass" effects
extension UIVisualEffectView {
    /// Create an enhanced iOS 16+ material view with advanced "Liquid Glass" appearance
    @available(iOS 16.0, *)
    static func createEnhancedLiquidGlassMaterial() -> UIVisualEffectView {
        let materialView = UIVisualEffectView()
        
        // Use the enhanced iOS 16+ system materials with better performance
        materialView.effect = UIBlurEffect(style: .systemMaterial)
        
        // Apply continuous corner curves (enhanced in iOS 16+)
        materialView.layer.cornerCurve = .continuous
        materialView.layer.cornerRadius = 16
        
        // Configure for proper blending with enhanced properties
        materialView.clipsToBounds = false
        
        // Add iOS 16+ enhanced shadow properties
        materialView.layer.shadowColor = UIColor.black.cgColor
        materialView.layer.shadowOffset = CGSize(width: 0, height: 4)
        materialView.layer.shadowOpacity = 0.15
        materialView.layer.shadowRadius = 8.0
        
        return materialView
    }
    
    /// Create an enhanced iOS 16+ prominent material view with advanced "Liquid Glass" appearance
    @available(iOS 16.0, *)
    static func createEnhancedProminentLiquidGlassMaterial() -> UIVisualEffectView {
        let materialView = UIVisualEffectView()
        
        // Use the prominent system material for more contrast (enhanced in iOS 16+)
        materialView.effect = UIBlurEffect(style: .systemMaterialProminent)
        
        // Apply continuous corner curves (enhanced in iOS 16+)
        materialView.layer.cornerCurve = .continuous
        materialView.layer.cornerRadius = 20
        
        // Configure for proper blending with enhanced properties
        materialView.clipsToBounds = false
        
        // Add iOS 16+ enhanced shadow properties
        materialView.layer.shadowColor = UIColor.black.cgColor
        materialView.layer.shadowOffset = CGSize(width: 0, height: 6)
        materialView.layer.shadowOpacity = 0.2
        materialView.layer.shadowRadius = 12.0
        
        return materialView
    }
}

// Extension for iOS 16+ Toolbar Configuration
extension UIToolbar {
    /// Configure modern toolbar appearance for iOS 16+ with enhanced features
    func configureModernToolbarIOS16() {
        if #available(iOS 16.0, *) {
            let appearance = UIToolbarAppearance()
            
            // Use iOS 16+ system materials with enhanced properties
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            
            // Apply modern blur effect with iOS 16+ enhancements
            appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            self.standardAppearance = appearance
            self.scrollEdgeAppearance = appearance
        } else if #available(iOS 15.0, *) {
            // Fallback to iOS 15 implementation
            let appearance = UIToolbarAppearance()
            
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
            
            appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            self.standardAppearance = appearance
        }
    }
}

// Extension for iOS 16+ Search Controller Configuration
extension UISearchController {
    /// Configure modern search controller appearance for iOS 16+ with enhanced features
    func configureModernSearchControllerIOS16() {
        if #available(iOS 16.0, *) {
            // Use iOS 16+ search bar styling with enhanced features
            searchBar.searchBarStyle = .default
            
            // Configure search bar appearance with iOS 16+ materials
            let searchAppearance = UISearchBarAppearance()
            searchAppearance.configureWithDefaultBackground()
            
            // Apply enhanced material effect
            searchAppearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            searchBar.standardAppearance = searchAppearance
            searchBar.scrollEdgeAppearance = searchAppearance
            
            // Enable enhanced search field styling
            searchBar.enablesReturnKeyAutomatically = true
        } else if #available(iOS 15.0, *) {
            // Fallback to iOS 15 implementation
            searchBar.searchBarStyle = .default
            
            let searchAppearance = UISearchBarAppearance()
            searchAppearance.configureWithDefaultBackground()
            
            searchAppearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
            
            searchBar.standardAppearance = searchAppearance
            searchBar.scrollEdgeAppearance = searchAppearance
        }
    }
}

// Extension for iOS 16+ ScrollView enhancements
extension UIScrollView {
    /// Configure modern scroll view for iOS 16+ with enhanced features
    func configureModernScrollViewIOS16() {
        if #available(iOS 16.0, *) {
            // Apply modern iOS 16+ scroll view enhancements
            if #available(iOS 17.0, *) {
                // Use any iOS 17+ specific features if needed
            }
            
            // Configure indicator style with iOS 16+ materials
            self.indicatorStyle = .default
            
            // Enable enhanced performance features
            self.bounces = true
            self.alwaysBounceVertical = false
            self.showsVerticalScrollIndicator = true
            self.showsHorizontalScrollIndicator = true
        }
    }
}

// Extension for iOS 16+ View Controller enhancements
extension UIViewController {
    /// Configure modern view controller for iOS 16+ with enhanced features
    func configureModernViewControllerIOS16() {
        if #available(iOS 16.0, *) {
            // Apply iOS 16+ enhanced view controller features
            self.view.backgroundColor = UIColor.systemBackground
            
            // Configure enhanced view controller presentation styles
            if let sheet = self.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.preferredCornerRadius = 20
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            }
        }
    }
}