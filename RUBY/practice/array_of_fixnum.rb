def array_of_fixnums?(array)
    # Write your code here
    array.each do |e|
      if !(e.nil? || e.to_s.to_i == e)
        return false
      end
    end
    true
  end