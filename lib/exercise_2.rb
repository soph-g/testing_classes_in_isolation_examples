class Greeter
  def initialize(kernel = Kernel)
    @kernel = kernel
  end

  def greet
    @kernel.puts "What is your name?"
    name = @kernel.gets.chomp
    @kernel.puts "Hello, #{name}"
  end
end
