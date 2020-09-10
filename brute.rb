class Bruteforce
    def self.first(password)
        puts "___________________________\n"
        @chars = '+-/*!&$#?=@<>abcdefghijklnopqrstuvwxyz1234567890'.split('');
        @permutations = @chars.permutation(4).to_a
        puts "Checking all possible #{@permutations.length} variants"
        found = false
        @permutations.each do |item|
            if item.join.upcase === password.upcase
                found = true
                puts "Coincidence found: #{item.join.to_s}"
                break
            end
        end
        unless found 
            puts "No coincidences found"
        end
    end

    def self.second(password)
        puts "___________________________\n"
        @chars = '+-/*!&$#?=@<>abcdefghijklnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'.split('');
        @permutations = @chars.permutation(6).to_a
        puts "Checking all possible #{@permutations.length} variants"
        found = false
        @permutations.each_with_index do |item, i|
            if item.join === password
                found = true
                puts "Coincidence found: #{item.join}", "Found in iteration number: #{i}"
                break
            end
        end
        unless found 
            puts "No coincidences found"
        end
    end

    def self.third(password)
        puts "___________________________\n"
        def self.brute(password)
            open('lib3.out', 'r') do |f|
                @re = f.read.split
                puts "Checking all possible #{@re.length} variants"
                @re.each_with_index do |n,i|
                    if n === password 
                        return [n,i]
                    end
                end
            end
            return nil
        end
        result = brute(password)
        if result
            puts "Coincidence found: #{result[0]}", "Found in iteration number: #{result[1]}"
        else
            puts "No coincidence found"
        end
    end
end

def __main__
    puts "Choose level:\n[1] Light\n[2] Medium\n[3] Hard"
    choice = gets.chomp.to_i
    if choice == 1
        print "Type in 4 symboled password: "
        password = gets.chomp
    end
    if choice == 2
        print "Type in 6 symboled password: "
        password = gets.chomp
    end
    if choice == 3
        print "Type in password: "
        password = gets.chomp
    end

    methods = ["first", "second", "third"]
    @from = Time.now
    Bruteforce.send(methods[choice-1], password)
    @to = Time.now 
    puts "Execution time: #{@to-@from} seconds"
end
__main__