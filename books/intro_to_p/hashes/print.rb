h = {two: "Hundred!!!", four: "Four", five: "Five"}

h.keys.each { |k| p "#{k} " }

h.values.each { |v| p "#{v} " }

h.each { |k, v| p "#{k}: #{v}" }
