def prime?(value, generator = Prime::Generator23.new)
  raise ArgumentError, "Expected a prime generator, got #{generator}" unless generator.respond_to? :each
  raise ArgumentError, "Expected an integer, got #{value}" unless value.respond_to?(:integer?) && value.integer?
  return false if value < 2
  generator.each do |num|
    q,r = value.divmod num
    return true if q < num
    return false if r == 0
  end
end