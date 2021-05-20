class GraphAlgorithm
    hash = { nodes: [0, 1, 2, 3, 4, 5, 6, 7], 
             routes: [[0, 3], [3, 5], [5, 6], [5, 7], 
                      [1, 2], [2, 6], [4, 6], [6, 7]] }
    loaded = []
    dependences ||= {}

    hash[:nodes].each do |value|
        dependences[value] = []
        hash[:routes].each do |route| 
            if route[1] == value
                dependences[value] << route[0]
            end
        end
    end

    hash[:nodes].each do |n|
        loaded << n if dependences[n].empty? && !loaded.include?(n)
    end

    while !(hash[:nodes] - loaded).empty? do
        hash[:nodes].each do |n|
            if !dependences[n].empty?  
                next unless (dependences[n] - loaded).empty?
                loaded << n if !loaded.include?(n)  
            end
        end
    end
    p "Vertex are load in the sequence: #{loaded.join(', ')}"
end