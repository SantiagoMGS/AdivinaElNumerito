class MasterMind
    @code = ''
    def self.input_code
        print "Marico ingresate un numero de 4 digitos entre 1-6: "
        @code = gets.chomp.split('')
        @code.map!(&:to_i)
        while @code.length != 4
            print 'Marica te dije que de 4 digitos: '
            @code = gets.chomp.split('')
            @code.map!(&:to_i)
        end
    end

    def self.generate_code
        @code = []
        for i in 0..3
            @code.push(rand(1..6))
        end
        return @code
    end

    def self.play_game
        @flag = false
        @code = generate_code()
        while @flag == false
            @hint = ''
            puts 'Adivinate pues el numero: '
            @guess = gets.chomp.split('')
            @guess.map!(&:to_i)
            while @guess.length != 4
                print 'Es enserio?: '
                @guess = gets.chomp.split('')
                @guess.map!(&:to_i)
            end
            if @code == @guess
                puts 'GANASTE WEEEEE'
                flag = true
                break
            end
            @guess.each_with_index do |element, index|
                if @code[index]== element
                    @hint+= '+'
                elsif @code.include?(element) == true
                    @hint+= '-'
                end
            end
            print "\n hint: #{@hint} \n"
        end                
    end
end

MasterMind.play_game