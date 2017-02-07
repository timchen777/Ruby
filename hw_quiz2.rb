1. 
Q: 請用簡單的方式敘述以下每一行程式碼：
   a = 1 
   @a = 2
   @@a = 5
   user = User.new
   user.name
   user.name = "Joe"
A: a=1 ==> assign 1 to variable a
   @a = 2 ==> set 2 to instance variable @a
   @@a = 5 ==> set 5 to class variable @@a
   user = User.new ==> instantiate a class object called 'user'
   user.name ==> instance method read/get
   user.name = "Joe" ==> instance method write/set

2.
Q: 什麼是 module? 請寫一段程式碼說明一個 class 要如何使用一個 module 裡面的 method?
A: - Modules are about providing methods(functions), you don't instantiate it, 
   and it's methods can be used across multiple classes.
   - Classes are about objects ( dynamic instances created/newed ), a class can 
   have only one superclass, but it can mix in as many modules as it wants.
   Example:
   # --- This is file module_file.rb ---
   module School
     def School.info(name)
       if name=="NTU"
         puts name + " has 32168 students"
       elsif name=="NCKU"
         puts name + " has 22636 students"
       elsif name=="JGHS"
         puts name + " has 712 students"
       else
         puts name + " : No such school!"   
       end
     end
   end
   # --- This is file class_file.rb ---
   $LOAD_PATH << '.'
   require "module_file"
   class University
     include School # module
     def info(x)
       School.info(x) # module method
     end
   end
   class Highschool
     include School # module
     def info(x)
       School.info(x) # module method
     end
   end
   u=University.new
   h=Highschool.new
   u.info("NTU")
   u.info("NCKU")
   u.info("NX")
   h.info("JGHS")
   # --- This is execution result ---
   NTU has 32168 students
   NCKU has 22636 students
   NX : No such school!
   JGHS has 712 students

3.
Q: 請說明 class variable 和 instance variable 之間的差別
A: A class variable( @@ ) is shared by all objects of a class and its descendants, 
   while instance variable ( @ ) belongs to one object. 
   
4.
Q: 請說明 class method 和 instance method 之間的差別
A: (a) Class method called in conjuction with the name of the class ( Ex: new), 
   we use "self" refers to the current instance of the class and define a method on self to
   creates a class method.( Ex: use "Class1.method1"  to call "self.method1" below ):
   -------------------------------
   class Class1
     def self.method1
       puts 'class method'
     end
   end
 
   --------------------------------
  (b)Instance method called after a new instance created 
  (Ex: use "Class2.new.method2" to call "method2" below). 
   -------------------------------    
   class Class2
     def method2
       puts 'instance method'
     end
   end
   -------------------------------  
   
5.
Q: 如果今天我為一個叫 User 的 class 產生一個新物件的方式是:
   User.new("Bob", "male", "Engineer")
   請寫出 User class 的 initialize method
A: class User
     def initialize (name, gender, occupation)
       @name = name
       @gender = gender
       @occupation = occupation
     end
   end

6. 
Q: 在： A. 一個 class 裡，method 外面 B. 一個 class 裡，insta6.nce method 裡 self 分別是指向什麼?
A: #self always refers to an instance, a class (ex: Class1) itself is an instance of "Class"
   class Class1
     # outside of class method,'self' refer to Class1
     def self.class_method_1 
       puts self
     end
     def instance_method_1
       #inside of instance method, 'self' refer to current instance of Class1
       puts self 
       self.class.class_method_1
     end
   end
   Class1.class_method_1 
   Class1.new.instance_method_1 
   -------------------------------------
   Output:
   Class1
   #<Class1:0x00000001e4d0d0>
   Class1   
7. 
Q: attr_accessor 的功能是什麼，它和 attr_reader、attr_writer 之間的差別是什麼？
A: An object's instance variables are its attributes, attr_accessor is a method to do both jobs
   done by attr_reader ( get method ) and attr_writer ( set method ).

8. 
Q: 請說明 public 和 private method 之間的不同
A: Public method can be called from anywhere.
   Private method cannot be called from outside the class scope, the object
   just send message to itself.

9. 
Q: 請說明 Inheritance 和 Module 之間的差別，它們分別是用於哪些情況？ 請舉例說明
A: A class can inherited from only one superclass, but it can mix in as many modules as it wants.
   Example: 
   Ex1: Please refer to Q#2  above, class University and class Highschool mix in module School
   Ex2: # ' class University' inherited from 'class School'
   class School
     def method1
       puts "School_method1"
     end
     def method2
       puts "School_method2"
     end
   end
   class University < School
     def method1
       puts "university_method1"
     end
   end
   University.new.method1   
   University.new.method2
   ------------------------
   Output: 
   University_method1  # polymorphism through inheritance
   School_method2      # inheritance

10. 
Q: 若今天有一個 class 有 include 一個 module，他的 parent class 和 sub class 是否可以使用該 module 裡的 method?
A: sub class can, parent class cannot.

11. 
Q: 請間單說明什麼是 Relational Database，什麼是 SQL
A: Relational Database : Data stored in tables where every table shared
   at least one field with another table in 'one to one', 'one to many',
   or 'many to many' relationships.
   SQL: Stands for Structured Query Language, whuch is a language used 
   to communicate with database like CREATE, INSERT, DELETE, etc.
