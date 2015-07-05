def roller(die, rep=1)
	return rep.times.map{1 + rand(die)}
end