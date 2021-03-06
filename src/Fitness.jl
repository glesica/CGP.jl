export fitness, hamming_max, hamming_raw

# Evaluates the fitness of a particular chromosome relative to a
# particular goal. The sum of the Hamming distances for each output
# relative to the goal for that output is passed through the `h2f`
# function to convert it into a useful fitness value. Valid `h2f`
# functions should always result in higher values for more "fit"
# candidates. In other words, bigger should always be better. Beyond
# that, the result only need be numeric.

function fitness{N}(c::Chromosome, g::Goal{N}, h2f::Function)
    outputs = execute_chromosome(c)
    dist = 0
    for i = 1:N
        dist += count_ones(outputs[i] $ g.truth_table[i])
    end
    return h2f(dist)
end

fitness(c::Chromosome, g::Goal) = fitness(c, g, hamming_max)

hamming_max(dist) = 1.0 / (1.0 + dist)
hamming_neg(dist) = -dist
