while true do
  local line = io.read()
  if line == nil then break
  else
    local _, _, package_name = string.find(line, "package: name='([%a%._]*)'")
    if package_name then
      print (package_name)
    end
  end
end
