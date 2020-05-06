# Parse the specificed JSON file and get the list of processes
# Scan the processes to get the component name
# Append .coffee to the component name and change the folder name from msgflo-components to components
# msgflo-components is the name in the msgflo world, components is the folder on disk

# Derek Knight
# March 2020

require "json"

file = File.read(ARGV[0])
data = JSON.parse(file)

processes = data['processes']

processes.each do | key, value |
  component = value['component']
  implementation = "#{component}.coffee".sub! 'msgflo-components', 'components'

  puts " --name #{key} #{implementation}"
end
