# Function to check the ranks of player...

def climbingLeaderboard(ranked, player)
    all_ranks = []
    i = 0
    for  i in 0..player.length-1 do# 50
        j = 0
        rank = 0
        for j in 0..ranked.length-1 do
            rank += 1
            # To check if it is unique or not...
            if (ranked[j] == ranked[j-1])
                rank -= 1
            end
            # To check its rank...
            if(player[i] >= ranked[j])
                all_ranks.append(rank)
                break
            end
            # If it is smallest...
            if(j == ranked.length-1)
                all_ranks.append(rank+1)
                break
            end  

        end
    end
    return all_ranks
end

# To check if scores of more than m players are entered
def player_number(m, players)
    while(players.length != m)
        puts("Invalid input!\nEnter score of #{m} matches: ")
        players = gets.strip.split(/\s+/).map(&:to_i)
        player_value(players)
    end
    return players
end

# To check if score is > 10^9
def player_value(players)
    # Constraint ton check if value is > 10^9
    while(players.any?{|x| x > 1000000000 || x < 0 })
        puts("Invalid Input!\nEnter score less than 1000000000 and greater than -1")
        players = gets.strip.split(/\s+/).map(&:to_i)
    end
    return players
end

# To check if ranks are in descending order or not...
def descending? arr
    arr.each_cons(2).all?{|left, right| left >= right}
end

# To check if value > 10^9
def rank_value(ranked)
    while(ranked.any?{|x| x > 1000000000 || x < 0 })

        puts("Invalid Input!\nEnter score less than 1000000000 and greater than -1")
        ranked = gets.strip.split(/\s+/).map(&:to_i)
    end
    return ranked
end


# To check if player scores are in ascending order or not...
def ascending? arr
    arr.each_cons(2).all?{|left, right| left <= right}
end

# To check if more than n ranks entered
def rank_number(n, ranked)
    while(ranked.length != n)
        puts("Invalid input!\nEnter score of #{n} players: ")
        ranked = gets.strip.split(/\s+/).map(&:to_i)
        rank_value(ranked)
    end
    return ranked
end

# Enter the total number of ranks on leaderboard...
puts("Enter the number of players on leaderboard: ")
n = gets.strip

# Converting it to interger...
n = n.to_i

# Checking constraint number 1...
while(n > 200000 || n < 1)

    puts("Wrong input!\nNumber should be greater than 1 and less than 200000")
    n = gets.strip
    n = n.to_i
end

# Get n number of ranks seperated
# by spaces...
puts("Enter score of all players: ")
ranked = gets.strip.split(/\s+/).map(&:to_i)

ranked = rank_value(ranked)
# Constraint 3...
# Checking length of ranked...
ranked = rank_number(n, ranked)
# Constraint to check if ranks are 
# entered in descending or not... 

while (!descending?(ranked))
    puts("Enter score of all players\n(In Descending Order!): ")
    ranked = gets.strip.split(/\s+/).map(&:to_i)
    ranked = rank_value(ranked)
    ranked = rank_number(n, ranked)
end 




# Number of games player has played...
puts("\n------------------------\nEnter the number of games played by you: ")
m = gets.strip

# Converting it to interger...
m = m.to_i

# Checking constraint number 2...
while(m > 200000 || m < 1)

    puts("Wrong input!\nNumber should be greater than 1 and less than 200000")
    n = gets.strip
    n = n.to_i
end

# Get n number of player scores
#  seperated by spaces...
puts("Enter all your scores: ")
players = gets.strip.split(/\s+/).map(&:to_i)

players = player_value(players)

# Constraint 4...
# Checking length of players...

players = player_number(m, players)

# Constraint to check if players are 
# entered in ascending or not... 
while (!ascending?(players))
    puts("Enter all of your scores\n(In Ascending Order!): ")
    players = gets.strip.split(/\s+/).map(&:to_i)
    players = player_value(players)
    players = player_number(m, players)
end 

# Output...
puts("\n------------------------\nLeader board: #{ranked}")
puts("Your scores: #{players}")
puts("Your ranks: #{climbingLeaderboard(ranked, players)}")
