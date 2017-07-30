function UnitTesting() as object
  this = {}

  this.expect = ExpectLibrary

  this.runSpecs = function(specs as object) as void
    print "Running tests..." + Chr(10)

    for each spec in specs
      tests = spec().tests

      print tab(4) spec().test_object_name

      test_num = 1
      for each test in tests
        result = test(m.expect, spec().test_object)

        print tab(8) Str(test_num) + ") "; result.test_name
        print tab(12) result.success

        test_num = test_num + 1
      end for
    end for
  end function

  return this
end function
