sub main()

  ' Running Tests on models / services
  cal = calculator()

  roku_testing_framework = RokuTestingFramework()

  specs = [
    CalculatorSpec
  ]

  roku_testing_framework.UnitTesting.runSpecs(specs)




  stop




  app = CreateObject("roSGScreen")
  m.port = CreateObject("roMessagePort")
  app.setMessagePort(m.port)

  ' Use component name your root component is
  m.app_root_component = app.createScene("RootComponent")

  app.show()

  ' app event loop
  while(true)
    msg = wait(0, m.port)
    msg_type = type(msg)

    if msg_type = "roSGNodeEvent"
      ' code for different event types
    end if

    if msg.isScreenClosed()
      ' code to run before app closes
      return
    end if
  end while
end sub
