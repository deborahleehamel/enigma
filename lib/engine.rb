class Engine
  # creates the rotation every time Engine.new
  attr_reader :date, :key                          # => nil
  def initialize(date = Time.new, key = rand_num)
    @date = date                                   # => 2015-12-16 15:05:52 -0700
    @key = key                                     # => [2, 7, 4, 1, 8]
  end                                              # => :initialize

  def rand_num
    (0..9).to_a.sample(5)  # => [2, 7, 4, 1, 8]
  end                      # => :rand_num

  def key_gen
    a = @key[0..1].join("").to_i  # => 27, 27, 27, 27
    b = @key[1..2].join("").to_i  # => 74, 74, 74, 74
    c = @key[2..3].join("").to_i  # => 41, 41, 41, 41
    d = @key[3..4].join("").to_i  # => 18, 18, 18, 18
    [a,b,c,d]                     # => [27, 74, 41, 18], [27, 74, 41, 18], [27, 74, 41, 18], [27, 74, 41, 18]
  end                             # => :key_gen

  def date_offset
    formatted_date = @date.strftime("%d%m%y").to_i  # => 161215, 161215, 161215, 161215, 161215, 161215, 161215, 161215, 161215, 161215, 161215, 161215, 161215, 161215, 161215, 161215
    squared_date = (formatted_date ** 2).to_s       # => "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225", "25990276225"
    squared_date[-4..-1]                            # => "6225", "6225", "6225", "6225", "6225", "6225", "6225", "6225", "6225", "6225", "6225", "6225", "6225", "6225", "6225", "6225"
  end                                               # => :date_offset

  def date_assignment
    a = date_offset[0].to_i  # => 6, 6, 6, 6
    b = date_offset[1].to_i  # => 2, 2, 2, 2
    c = date_offset[2].to_i  # => 2, 2, 2, 2
    d = date_offset[3].to_i  # => 5, 5, 5, 5
    [a,b,c,d]                # => [6, 2, 2, 5], [6, 2, 2, 5], [6, 2, 2, 5], [6, 2, 2, 5]
  end                        # => :date_assignment

  def rotation
    a = key_gen[0] + date_assignment[0]  # => 33
    b = key_gen[1] + date_assignment[1]  # => 76
    c = key_gen[2] + date_assignment[2]  # => 43
    d = key_gen[3] + date_assignment[3]  # => 23
    [a,b,c,d]                            # => [33, 76, 43, 23]
  end                                    # => :rotation

end  # => :rotation

Engine.new.rotation  # => [33, 76, 43, 23]

# (0..9).to_a.sample(5)
#engine = Engine.new
# puts engine.date_offset
# puts engine.date_assignment
# puts engine.rotation
# engine.rotation
# Engine.new.key_gen
