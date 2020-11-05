# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

workspace 'Podcast'

project '/Users/thedonat/Desktop/CleanPodcast/Podcast/Podcast.xcodeproj'
project '/Users/thedonat/Desktop/CleanPodcast/PodcastAPI/PodcastAPI.xcodeproj'

def api_pods
   pod 'Alamofire', '~> 5.2'
end

def client_pods
  pod 'Kingfisher', '~> 5.0'
end

target 'Podcast' do
  project '/Users/thedonat/Desktop/CleanPodcast/Podcast/Podcast.xcodeproj'
  client_pods
end

target 'PodcastAPI' do
  project '/Users/thedonat/Desktop/CleanPodcast/PodcastAPI/PodcastAPI.xcodeproj'
  api_pods
end

