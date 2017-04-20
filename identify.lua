-- Work out the backend name for a given request's HTTP path

TAG_AD = 88888

core.register_fetches("backend_select", function(txn)

  -- we consider path only, not host - this makes development easier
  -- sf is string fetch - get something from txn that is guaranteed string
  local path = txn.sf:path()
  -- c is converter collection but in this case will return in (sc would guarantee string)
  local crc = txn.c:crc32(path)

  -- todo use core.concat for speeeed
  core.log("CRC of " .. path .. " is " .. tostring(crc))

  if crc == TAG_AD then
  	return "ad"
  else
  	return "default"
  end


end
