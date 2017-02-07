# ------Ruby HW3: 石頭 剪刀 布 猜拳遊戲-----
class Player
  def initialize(name)
    @name = name
  end 
end

# 人類玩家的類別
class Human < Player
  def get_gesture
    puts "請出 (S: 石頭 C:剪刀 P:布 ) :"
    gets.chomp
  end
end

# 電腦的類別
class Computer < Player
  def get_gesture
  	['S', 'C', 'P'].shuffle!.last
  end
end

class RPS
  def initialize
    intro
  end
  def intro
    #印出開場畫面，告訴玩家遊戲規則
    puts "------Ruby HW3: 石頭 剪刀 布 猜拳遊戲-----"
    get_player_gestures
  end

  def decide (you_pick,cpu_pick)
    #邏輯判斷式
    if you_pick == "S" || you_pick == "C" || you_pick == "P"
       if you_pick == cpu_pick
         puts "平手" + "(電腦也出"+ cpu_pick+")"     
       else
         case you_pick
           when "S"
              cpu_pick == "P" ? show_message(0,cpu_pick) : show_message(1,cpu_pick)
           when "C"
              cpu_pick == "S" ? show_message(0,cpu_pick) : show_message(1,cpu_pick)
           when "P"
              cpu_pick == "C" ? show_message(0,cpu_pick) : show_message(1,cpu_pick)
         end
       end
    else
        puts "你輸: 只能出 (S: 石頭 C:剪刀 P:布 )"
    end
    if continue? == "Y"
      intro
    end  
  end

  def get_player_gestures
    #取得玩家和電腦兩個物件的
    player1 = Human.new("you")
    player2 = Computer.new("cpu")
    decide(player1.get_gesture,player2.get_gesture)
  end

  def continue?
    #判斷玩家是否要繼續下一輪
    print "繼續?(Y: Yes) "
    gets.chomp    
  end

  def show_message(result,msg)
    #印出結果
    if result==1
      puts "你贏" + "(電腦出"+ msg+")"
    else
      puts "你輸" + "(電腦出"+ msg+")"
    end
  end
end

# ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
  RPS.new
