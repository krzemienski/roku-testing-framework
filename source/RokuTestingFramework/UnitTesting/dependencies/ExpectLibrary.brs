function ExpectLibrary(test_object) as object
  this = {}
  this.test_object = test_object

  this.toEqual = function(expected_value) as boolean
    if m.test_object = expected_value then return true else return false
  end function

  this.toBeValid = function() as boolean
    if m.test_object <> invalid then return true else return false
  end function

  this.toBeTrue = function() as boolean
    if m.test_object <> invalid and m.test_object = true then return true else return false
  end function

  this.toBeFalse = function() as boolean
    if m.test_object <> invalid and m.test_object = false then return true else return false
  end function

  this.toHaveType = function(var_type) as boolean
    if type(m.test_object) = var_type then return true else return false
  end function

  this.toHaveFunction = function(func_name) as boolean
    if m.test_object <> invalid and m.test_object[func_name] <> invalid and type(m.test_object[func_name]) = "roFunction" then return true else return false
  end function

  return this
end function
