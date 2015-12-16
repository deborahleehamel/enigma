class Engine
  # creates the rotation every time Engine.new
  attr_reader :date, :key  # => nil
  def initialize
    @date = Time.new  # => 2015-12-15 22:10:13 -0700
    @key = rand_num   # => [7, 1, 9, 3, 0]
  end                 # => :initialize

  def rand_num
    (0..9).to_a.sample(5)  # => [7, 1, 9, 3, 0]
  end                      # => :rand_num

  def key_gen
    a = @key[0..1].join("").to_i  # => 71, 71, 71, 71
    b = @key[1..2].join("").to_i  # => 19, 19, 19, 19
    c = @key[2..3].join("").to_i  # => 93, 93, 93, 93
    d = @key[3..4].join("").to_i  # => 30, 30, 30, 30
    [a,b,c,d]                     # => [71, 19, 93, 30], [71, 19, 93, 30], [71, 19, 93, 30], [71, 19, 93, 30]
  end                             # => :key_gen

  def date_offset
    formatted_date = @date.strftime("%d%m%y").to_i  # => 151215, 151215, 151215, 151215, 151215, 151215, 151215, 151215, 151215, 151215, 151215, 151215, 151215, 151215, 151215, 151215
    squared_date = (formatted_date ** 2).to_s       # => "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225", "22865976225"
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
    a = key_gen[0] + date_assignment[0]  # => 77
    b = key_gen[1] + date_assignment[1]  # => 21
    c = key_gen[2] + date_assignment[2]  # => 95
    d = key_gen[3] + date_assignment[3]  # => 35
    [a,b,c,d]                            # => [77, 21, 95, 35]
  end                                    # => :rotation

end  # => :rotation

Engine.new.rotation  # => [77, 21, 95, 35]

# (0..9).to_a.sample(5)
#engine = Engine.new
# puts engine.date_offset
# puts engine.date_assignment
# puts engine.rotation
# engine.rotation
# Engine.new.key_gen
