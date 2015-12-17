class Engine
  attr_reader :date, :key
  def initialize(date = Time.new, key = rand_num)
    @date = date
    @key = key
  end

  def rand_num
    (0..9).to_a.sample(5)
  end

  def key_gen
    a = @key[0..1].join("").to_i
    b = @key[1..2].join("").to_i
    c = @key[2..3].join("").to_i
    d = @key[3..4].join("").to_i
    [a,b,c,d]
  end

  def date_offset
    formatted_date = @date.strftime("%d%m%y").to_i
    squared_date = (formatted_date ** 2).to_s
    squared_date[-4..-1]
  end

  def date_assignment
    a = date_offset[0].to_i
    b = date_offset[1].to_i
    c = date_offset[2].to_i
    d = date_offset[3].to_i
    [a,b,c,d]
  end

  def rotation
    a = key_gen[0] + date_assignment[0]
    b = key_gen[1] + date_assignment[1]
    c = key_gen[2] + date_assignment[2]
    d = key_gen[3] + date_assignment[3]
    [a,b,c,d]
  end
end
