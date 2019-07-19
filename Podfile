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

target 'SwiftySnippets_iOS' do
    sharedPodsIOS
end

target 'SwiftySnippets_tvOS' do
    platform :tvos, '9.0'
    sharedPods
end

target 'SwiftySnippets_macOS' do
    sharedPodsOSX
end

target 'SwiftySnippets_watchOS' do
    platform :watchos, '3.0'
    sharedPods
end

target 'UnitTests_iOS' do
    sharedPodsIOS
end

target 'UnitTests_OSX' do
    sharedPodsOSX
end

target 'FunctionalTests_iOS' do
    sharedPodsIOS
end

target 'FunctionalTests_OSX' do
    sharedPodsOSX
end
