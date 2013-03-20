local lead = string.rep(" ", 4) .. "public static final String "
local out = io.open("WebStorageTestPages.java", "w+")
out:write([[
/* Copyright 2013 Amazon.com, Inc. or its affiliates. All Rights Reserved. */

package com.amazon.webview.tests;

public class WebStorageTestPages {

]])
for _, file in ipairs(arg) do
  local varRoot = file:gsub("%.html", ""):upper()
  out:write(lead .. varRoot .. "_PATH = " ..'"/' .. file .. '";' .. "\n")
  out:write(lead .. varRoot .. "_HTML =\n")
  local src = io.open(file, "r")
  local first = true
  for line in src:lines("*l") do
     if not first then out:write(" +\n")
     else first = false
     end
     out:write(string.rep(" ", 12) .. '"' .. line .. '"')
  end
  out:write(";\n")
end
out:write ("}\n")
out:close()
