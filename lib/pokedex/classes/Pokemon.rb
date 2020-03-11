class Pokemon
  def initialize(hash)
    @name = hash[:name]
    @type_1 = hash[:type_1]
    @type_2 = hash[:type_2]
    @total = hash[:total]
    @hp = hash[:hp]
    @attack = hash[:attack]
    @defense = hash[:defense]
    @sp_atk = hash[:"sp._atk"]
    @sp_def = hash[:"sp._def"]
    @speed = hash[:speed]
    @generation = hash[:generation]
    @legendary = hash[:legendary]
  end
end