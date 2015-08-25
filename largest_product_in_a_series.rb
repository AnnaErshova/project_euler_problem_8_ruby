# assume input will be an integer

class LargestProductInASeries

  LENGTH_OF_SAMPLE_SEQUENCE = 13

  DEFAULT_INPUT = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450

  def initialize(input = DEFAULT_INPUT)
    @input = input
  end

  def find_max_product
    print find_all_products.max
  end

  private

  def find_all_possible_arrays
    new_array = []
    i = 0
    number_of_times.times do 
      (new_array << make_sliced_array(i)) if array_contains_0?(i)
      i +=1
    end
    new_array
  end

  def make_sliced_array(i)
    make_into_array_and_convert_contents_to_i[i..i+LENGTH_OF_SAMPLE_SEQUENCE-1]
  end

  def array_contains_0?(i)
    !make_sliced_array(i).include?(0)
  end

  def number_of_times
    make_into_array_and_convert_contents_to_i.length-LENGTH_OF_SAMPLE_SEQUENCE+1
  end

  def stringify_input
    @input.to_s 
  end

  def make_into_array_and_convert_contents_to_i
    stringify_input.split("").map {|x| x.to_i }
  end

  def find_all_products
    max_array = []
    find_all_possible_arrays.each { |x| max_array << x.inject(:*)}
    max_array
  end

end

a = LargestProductInASeries.new
a.find_max_product
