require_relative 'node'

class Tree

  attr_reader :root

  def initialize(arr)
    arr = arr.uniq.sort
    @root = build_tree(arr,0,arr.length - 1)
  end

  def build_tree(arr,left,right)
    return nil if left > right

    mid = (left + right) / 2
    root_node = Node.new(arr[mid])

    root_node.left = build_tree(arr,left, mid - 1 )

    root_node.right = build_tree(arr,mid + 1,right )
    return root_node
  end

  def insert(value)
    current_node = @root

    while current_node
      if current_node.data == value
        p "This Node already exists"
        return
      end

      if current_node.data > value
        return current_node.left = Node.new(value) if !current_node.left
        current_node = current_node.left
      else
        return current_node.right = Node.new(value) if !current_node.right
        current_node = current_node.right
      end

    end
  end

  def delete(value)

  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end
