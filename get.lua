args = {...}
local server = 'http://219.224.167.212:10031/files/'
local filename = args[1]
script = http.get(server .. filename).readAll()
fh = fs.open(filename, 'w')
fh.write(script)
fh.close()