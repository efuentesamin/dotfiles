Reload = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	Reload(name)
	return require(name)
end
