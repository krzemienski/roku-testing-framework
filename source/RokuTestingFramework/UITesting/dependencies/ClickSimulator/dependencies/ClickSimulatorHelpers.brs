' Credit to Khurshid Fayzullaev (https://github.com/khfayzullaev)
'   - Functions taken from Zype Roku Scenegraph (https://github.com/zype/zype-roku-scenegraph)
function ClickSimulatorHelpers() as object
  this = {}

  this.paramsToString = function(params_object as object) as string
    result = ""

    for each i in params_object
      result = result + i + "=" + params_object[i] + "&"
    end for

    return result
  end function

  this.makePostRequest = function(src as string, params as object) as object
    request = CreateObject("roUrlTransfer")
    port = CreateObject("roMessagePort")
    request.setMessagePort(port)
    url = src

    bodyData = m.paramsToString(params)

    if url.InStr(0, "https") = 0
      request.SetCertificatesFile("common:/certs/ca-bundle.crt")
      request.AddHeader("X-Roku-Reserved-Dev-Id", "")
      request.InitClientCertificates()
    end if

    request.SetUrl(url)

    if request.AsyncPostFromString(bodyData)
      while true
        msg = wait(0, port)
        if type(msg) = "roUrlEvent"
          code = msg.GetResponseCode()
          if 200 <= code and code < 300
            response = ParseJson(msg.GetString())
            return response
          end if
          exit while
        else if event = invalid
          request.AsyncCancel()
        end if
      end while
    end if

    return invalid
  end function

  this.deviceIP = function() as string
    di = CreateObject("roDeviceInfo")
    ip_address = di.GetConnectionInfo().ip
    return ip_address
  end function

  return this
end function
