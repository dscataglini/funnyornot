class Visitor
  def visitor?
    true
  end

  def method_missing(method_name, *args, &block)
  end
end
