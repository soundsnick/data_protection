puts "Enter person info (name, last name, day of birth, month, year), separated by comma: "
lib = gets.chomp.gsub(/\s+/, "").split(',')
open('lib3.out', 'a') do |f|
    lib.each do |n|
        f.puts "#{n}\n"
        0.upto(lib.length-1).each do |m|
            f.puts "#{n+lib[m]}\n"
            f.puts "#{n}_#{lib[m]}\n"
            f.puts "#{n}-#{lib[m]}\n"
            f.puts "#{n}.#{lib[m]}\n"
            0.upto(lib.length-1).each do |b|
                f.puts "#{n+lib[m]+lib[b]}\n"
                f.puts "#{n}_#{lib[m]}_#{lib[b]}\n"
                f.puts "#{n}_#{lib[m]}.#{lib[b]}\n"
                f.puts "#{n}_#{lib[m]}-#{lib[b]}\n"

                f.puts "#{n}.#{lib[m]}_#{lib[b]}\n"
                f.puts "#{n}.#{lib[m]}.#{lib[b]}\n"
                f.puts "#{n}.#{lib[m]}-#{lib[b]}\n"

                f.puts "#{n}-#{lib[m]}_#{lib[b]}\n"
                f.puts "#{n}-#{lib[m]}.#{lib[b]}\n"
                f.puts "#{n}-#{lib[m]}-#{lib[b]}\n"
            end
        end
    end
end
