function ClickSimulator() as object
  this = {}
  this.helpers = ClickSimulatorHelpers()

  this.device_ip_address = this.helpers.deviceIP()
  this.keys = [
    "back",
    "up",
    "down",
    "left",
    "right",
    "OK",
    "replay",
    "play",
    "rewind",
    "fastforward",
    "options"
  ]

  this.validKey = function(key as string) as boolean
    for each k in keys
      if k = key then return true
    end for
    return false
  end function

  this.click = function(key as string) as void
    if m.validKey(key)
      url = "http://" + m.device_ip_address + ":8060/keydown/" + key
      m.helpers.makePostRequest(url, {})
    end if
  end function

  return this
end function
