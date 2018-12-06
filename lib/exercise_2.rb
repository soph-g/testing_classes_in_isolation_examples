class Greeter
  def greet
    puts "What is your name?"
    name = Kernel.gets.chomp
    puts "Hello, #{name}"
  end
end
