require 'active_support/all'

def parse_it
  <<-HEREDOC
Events[0].Lane=1
Events[0].Object.BoundingBox[0]=1248
Events[0].Object.BoundingBox[1]=3528
Events[0].Object.BoundingBox[2]=1920
Events[0].Object.BoundingBox[3]=3848
Events[0].Object.Center[0]=1584
Events[0].Object.Country=GBR
Events[0].SnapSourceCombine=false
HEREDOC
end

def data
  res = {}
  parse_it.each_line do |line|
    line.gsub!(/^\D*\[\d\]./, '')
    full_key, value = line.split('=')
    value.strip!
    keys = full_key.split('.')

    obj = res

    keys.each do |key|
      is_last = keys.last == key

      # if array
      if /(.*)\[\d\]$/ === key
        key.gsub!(/\[\d\]$/, '')
        obj[key] ||= []
        obj[key].push(value.to_i) if is_last
      else
        is_last ? obj[key] = value : obj[key] ||= {}
      end
      obj = obj[key]
    end
  end
  res
end

pp data

#
# hash = {
#   'Lane' = 1,
#   'SnapSourceCombine' => false
#   'Object' => {
#     'BoundingBox' => [1248, 3528, 1920, 3848],
#     'Center' => [1584],
#     'Country' => 'GBR',
#   }
# }
