require_relative 'lib/tree'

array = [12,6,7,4,3,5,7,88,4,11,4]
#sorted: [3, 4, 5, 6, 7, 11, 12, 88]
tree = Tree.new(array)
tree.pretty_print
tree.insert(2)
tree.insert(9)
tree.insert(100)
tree.pretty_print
tree.delete(100)
tree.pretty_print
tree.delete(12)
tree.pretty_print
p tree.find(100)
p tree.find(2)
