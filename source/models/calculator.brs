function Calculator() as object
  this = {}

  this.add = function(n1 as double, n2 as double) as double
    return n1 + n2
  end function

  this.subtract = function(n1 as double, n2 as double) as double
    return n1 - n2
  end function

  return this
end function
