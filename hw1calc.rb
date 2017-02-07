puts "Ruby HW1 計算機"
num1 = 0
num2 = 0
quit = 0
begin
    puts "-----------Calculator : ----------\n"
    puts "first number : \n"
    num1 = gets.chomp
    puts "second number : \n"
    num2 = gets.chomp

    print "Operator(+, -, *, /) or Q to quit : "
    operator = gets.chomp 

    case operator

        when "+"
            puts num1+"+"+num2+"=="+(num1.to_f + num2.to_f).to_s
            
        when "-"
            puts  num1+"-"+num2+"=="+ (num1.to_f - num2.to_f).to_s
            
        when "*"
            puts  num1+"*"+num2+"=="+ (num1.to_f * num2.to_f).to_s
            
        when "/"
            if num2 == "0"
                puts "Invalid divisor, divisor cannot be 0"
            else
                puts  num1+"/"+num2+"=="+ (num1.to_f / num2.to_f).to_s
            end
            
        when "Q"
            quit = 1
        else
            puts "Invalid operator!!"

    end
end while quit != 1
