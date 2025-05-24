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
p tree.level_order #[6,4,11,3,5,7,88,2,9]
p tree.inorder #[2,3,4,5,6,7,9,11,88]
p tree.preorder #[6,4,3,2,5,11,7,9,88]
p tree.postorder #[2,3,5,4,9,7,88,11,6]
tree.height_depth(5)
tree.height_depth(11)
tree.height_depth(4)
tree.height_depth(7)
p tree.height_depth(76)
p 'here'

p tree.balanced?

tree.insert(1000)
tree.insert(1400)
tree.insert(16700)
tree.insert(1040)
tree.insert(10410)
tree.insert(1020)
tree.pretty_print
