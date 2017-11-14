
def sudoku2(grid)
  combined_grid = Array.new
  seen = Array.new(9,false)
  
 #puts "check row"
 #check row
  grid.each do |row|
   #print row
   #puts
   row.each do |row_value|
     #puts row_value
     #puts seen[row_value.to_i - 1]
      if row_value != "." && seen[row_value.to_i - 1] == false then
         seen[row_value.to_i - 1] = true
      elsif row_value != "." && seen[row_value.to_i - 1] == true  then
        return false
      end
    end
    seen.each_index do |s|
      seen[s] = false
   end
  end
  #puts "check column"
  #check column
  grid.transpose.each do |col|
    col.each do |col_value|
      if col_value != "." && seen[col_value.to_i - 1] == false then
        seen[col_value.to_i - 1] = true
      elsif col_value != "." && seen[col_value.to_i - 1] == true  then
        return false
      end
    end
    seen.each_index do |s|
      seen[s] = false
    end
  end
  
  #puts "check grid"
  #slice rows into groups of 3s
  grid.each do |row|
    combined_grid.push(row.each_slice(3).to_a)
  end
  #combine the 3x3 subgrids into a single array
  combined_grid = combined_grid.transpose.flatten.each_slice(9).to_a
  #check subgrids
  combined_grid.each do |grid|
    grid.each do |set|
      if set != "." && seen[set.to_i - 1] == false then
         seen[set.to_i - 1] = true
      elsif set != "." && seen[set.to_i - 1] == true  then
        return false
      end
    end
    seen.each_index do |s|
      seen[s] = false
    end
  end 

return true
  
end


grid = [['.', '.', '.', '1', '4', '.', '.', '2', '.'],['.', '.', '6', '.', '.', '.', '.', '.', '.'],['.', '.', '.', '.', '.', '.', '.', '.', '.'],['.', '.', '1', '.', '.', '.', '.', '.', '.'],['.', '6', '7', '.', '.', '.', '.', '.', '9'],['.', '.', '.', '.', '.', '.', '8', '1', '.'],['.', '3', '.', '.', '.', '.', '.', '.', '6'],['.', '.', '.', '.', '.', '7', '.', '.', '.'],['.', '.', '.', '5', '.', '.', '.', '7', '.']]
        
        
#grid = [['.', '.', '.', '.', '2', '.', '.', '9', '.'],['.', '.', '.', '.', '6', '.', '.', '.', '.'],['7', '1', '.', '.', '7', '5', '.', '.', '.'],['.', '7', '.', '.', '.', '.', '.', '.', '.'],['.', '.', '.', '.', '8', '3', '.', '.', '.'],['.', '.', '8', '.', '.', '7', '.', '6', '.'],['.', '.', '.', '.', '.', '2', '.', '.', '.'],['.', '1', '.', '2', '.', '.', '.', '.', '.'],['.', '2', '.', '.', '3', '.', '.', '.', '.']]

sudoku2(grid)