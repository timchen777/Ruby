puts "------Ruby HW2: 石頭 剪刀 布 猜拳遊戲-----"
continue = "N"
begin
    puts "(S: 石頭 C:剪刀 P:布 ) : "
    youPick= gets.chomp
    cpuPick = ["S","C","P"].sample

    if youPick == "S" || youPick == "C" || youPick == "P"
        if youPick == cpuPick
            puts "平手" + "(電腦也出"+ cpuPick+")"     
       else
            case youPick
            when "S"
                puts cpuPick == "P" ? "你輸" + "(電腦出"+ cpuPick+")": "你贏" + "(電腦出"+ cpuPick+")"
            when "C"
                puts cpuPick == "S" ? "你輸" + "(電腦出"+ cpuPick+")": "你贏" + "(電腦出"+ cpuPick+")"
            when "P"
                puts cpuPick == "C" ? "你輸" + "(電腦出"+ cpuPick+")": "你贏" + "(電腦出"+ cpuPick+")" 
            end
        end
    else
        puts "你輸: 只能出 (S: 石頭 C:剪刀 P:布 )"
    end

    print "繼續?(Y: Yes) "
    continue = gets.chomp
end while continue == "Y"
