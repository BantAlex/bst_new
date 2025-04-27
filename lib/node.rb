class Node
  attr_accessor :data, :left, :right

 include Comparable #Don't know why
  def initialize(data,left = nil ,right = nil)
    @data = data
    @left = left
    @right = right
  end

  def <=>(other) #Comparable required method
    data <=> other.data
  end

end
