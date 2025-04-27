require_relative 'lib/tree'

array = [12,6,7,4,3,5,7,88,4,11,4]
#sorted: [3, 4, 5, 6, 7, 11, 12, 88]
tree = Tree.new(array)
tree.pretty_print
