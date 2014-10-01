# modules to break out the functionality
# temperature module that holds conversion  methods

module Temperature

  KELVIN_CONSTANT = 273.15
  FAHRENHEIT_CONSTANT = 32

  class Kelvin

    def initialize(num)
      @num = num
    end

    def c_to_k
      @num + KELVIN_CONSTANT
    end

    def f_to_k
      ((@num - FAHRENHEIT_CONSTANT)/1.8) + KELVIN_CONSTANT
    end
  end

  class Celsius

    def initialize(num)
      @num = num
    end

    def f_to_c
      ((@num - FAHRENHEIT_CONSTANT)* 5)/9
    end

    def k_to_c
      @num - KELVIN_CONSTANT
    end
  end

  class Fahrenheit

    def initialize(num)
      @num = num
    end

    def c_to_f
      ((@num * 9)/5) + FAHRENHEIT_CONSTANT
    end

    def k_to_f
      ((@num - KELVIN_CONSTANT) * 1.8) + FAHRENHEIT_CONSTANT
    end

  end

end

puts Temperature::Kelvin.new(0).c_to_k
puts Temperature::Kelvin.new(0).f_to_k

puts Temperature::Celsius.new(88).f_to_c
puts Temperature::Celsius.new(0).k_to_c

puts Temperature::Fahrenheit.new(0).c_to_f
puts Temperature::Fahrenheit.new(273.15).k_to_f

