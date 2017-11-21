# Uncomment the next line to define a global platform for your project

platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

target 'Pytt' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks

  pod 'SDWebImage'
  pod 'Cosmos'
  pod 'SwiftLint'
  pod 'Decodable'
  pod 'SwiftWebVC'
  pod 'SwiftMessages'
  pod 'Localize-Swift'
  pod 'RxSwift'
  pod 'RxCocoa'

  target 'PyttTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
    pod 'Mockingjay'
    pod 'Decodable'
    pod 'FBSnapshotTestCase'
    pod 'Nimble-Snapshots'
  end

  target 'PyttUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
