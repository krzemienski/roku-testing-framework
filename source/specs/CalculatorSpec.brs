function CalculatorSpec() as object
  this = {}
  this.test_object_name = "Calculator"
  this.test_object = Calculator()

  this.tests = [
    CalculatorTest1,
    CalculatorTest2
  ]

  return this
end function


function CalculatorTest1(expect_library, test_object) as object
  this = {}
  this.test_name = "Knows how to add 2 numbers"

  expect = expect_library

  has_function    = expect(test_object).toHaveFunction("add")
  correct_return  = expect(test_object.add(3, 4.5)).toEqual(7.5)

  this.success = has_function and correct_return

  return this
end function

function CalculatorTest2(expect_library, test_object) as object
  this = {}
  this.test_name = "Knows how to subtract 2 numbers"

  expect = expect_library

  has_function    = expect(test_object).toHaveFunction("subtract")
  correct_return  = expect(test_object.subtract(8, 3.4)).toEqual(4.6)

  this.success = has_function and correct_return

  return this
end function
