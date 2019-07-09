use_frameworks!

# Cocoapods for multiple targets
def sharedPods
  
end

def sharedPodsIOS
  platform :ios, '9.0'
  sharedPods
end

def sharedPodsOSX
  platform :osx, '10.10'
  sharedPods
end

# Targets
target 'Example' do
    workspace 'SwiftySnippets'
    project 'Example/Example.xcodeproj'

    sharedPodsIOS
end

target 'SwiftySnippets iOS' do
    sharedPodsIOS
end

target 'SwiftySnippets tvOS' do
    platform :tvos, '9.0'
    sharedPods
end

target 'SwiftySnippets macOS' do
    sharedPodsOSX
end

target 'SwiftySnippets watchOS' do
    platform :watchos, '3.0'
    sharedPods
end

target 'UnitTests iOS' do
    sharedPodsIOS
end

target 'UnitTests OSX' do
    sharedPodsOSX
end

target 'FunctionalTests iOS' do
    sharedPodsIOS
end

target 'FunctionalTests OSX' do
    sharedPodsOSX
end
