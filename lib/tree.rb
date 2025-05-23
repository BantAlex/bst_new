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
    return "Wrong input!" if value.class != Integer
    current_node = @root

    while current_node
      if current_node.data == value
        p "This Node already exists"
        return
      elsif current_node.data > value
        return current_node.left = Node.new(value) if !current_node.left
        current_node = current_node.left
      else
        return current_node.right = Node.new(value) if !current_node.right
        current_node = current_node.right
      end
    end
  end

  def get_successor(current) #Find smallest successor
    current = current.right
    while !current && !current.left
      current = current.left
    end
  end

  def delete(current = @root,value) #Recursive approach

    return nil if !current

    if current.data > value #?Search both sides untill you current.data == value
      current.left = delete(current.left,value)
    elsif current.data < value #?Search both sides untill you current.data == value
      current.right = delete(current.right,value)

    else
      return current.right if !current.left #?Return
      return current.left if !current.right #?Return

      successor = get_successor(current)
      current.data = successor.data #Swap the current one with its successor
      current.right = delete(current.right,successor.data) #Delete the twin
    end

    return current
  end

  def find(value)
    current = @root

    while current
      if current.data > value
        current = current.left
      elsif current.data < value
        current = current.right
      else
        return current
      end
    end
    return nil
  end


  def level_order
    return @root if !@root

    queue = []
    res_arr = []

    queue << @root

    while queue != []
      queue.length.times do
        node = queue.shift

        res_arr << node.data
        yield node if block_given?

        queue << node.left if node.left
        queue << node.right if node.right
      end
    end
    res_arr
  end

  def inorder(current = @root,result = [])
    if current
      inorder(current.left,result)

      result << current.data
      yield current if block_given?

      inorder(current.right,result)
    end
    result
  end

  def preorder(current = @root,result = [])
    if current
      result << current.data
      yield current if block_given?

      preorder(current.left,result)

      preorder(current.right,result)
    end
    result
  end

  def postorder(current = @root,result = [])
    if current
      postorder(current.left,result)

      postorder(current.right,result)

       result << current.data
      yield current if block_given?
    end
    result
  end

  def height_depth(value)
    return nil if !find(value)
    height = -1
    depth = -1
    queue = [@root]
    level = 0

    while queue.length > 0
      queue.length.times do
        node = queue.shift

        if node.data == value
          depth = level
          queue = []
        end
          queue << node.left if node.left
          queue << node.right if node.right
        break if node.data == value
      end
    level += 1
    end
    height = level - depth - 1
    p "height: #{height}"
    p "depth: #{depth}"
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end
