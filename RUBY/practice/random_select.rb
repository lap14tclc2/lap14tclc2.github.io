def random_select(array, n)
    # your code here
    rng = Random.new
    arr = []
    n.times do 
        arr << array[rng.rand(0..array.size-1)]
    end
    arr
end


puts random_select([1,2,3,4,5], 2)