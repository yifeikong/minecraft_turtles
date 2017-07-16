#!/usr/bin/env python
# coding:utf-8

import os, codecs
from bottle import Bottle, request, template
app = Bottle()

index_html = """
<html>
	<head>
		<meta charset="utf-8"/>
		<title>Jyke Document</title>
		<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>
    <script type="text/javascript">
      $('document').ready(function(){
        $('#add').on('click',function(){
        	filename = $('#new').val();
        	location += 'edit/' + filename ;
        });
      })
    </script>
	</head>
	<body>
		<ul>
			% for thefile in files:
				<li><a href="/edit/{{ thefile }}">{{ thefile }}</a>
			% end
			<li><input type="text" id="new" /><button id="add">添加</button>
		</ul>
	</body>
</html>
"""

wiki_html = """
<html>
  <head>
    <meta charset="utf-8">
    <title>Jyke Documents</title>
    <style type="text/css">
      #container {
        margin:0 auto;
        width:960px;
        height: 100%;
      }

      textarea {
        font-family: Consolas, "Ubuntu mono", monospace;
        width:100%;
        height:100%;
      }

      p {
        background-color: red;
        position: absolute;
        right:200px;
      }
    </style>
    <script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>
    <script type="text/javascript">
      $('document').ready(function(){
        $('textarea').on('keydown',function(e){
          var path = window.location.pathname;
          if ((e.keyCode == 10 || e.keyCode == 13) && e.ctrlKey){
            var thetext = $(this).val();
            $.ajax(path, {
              data : thetext,
                contentType : 'text/plain',
                type : 'POST',
                success: function(){
                  location.reload();
                }
              });
          }
        });
      })
    </script>
  </haed>
  <body>
    <div id="container">
      <p id="tips"><a href="/">Home</a>按Ctrl+Enter保存更改</p>
      <textarea>{{ thetext }}</textarea>
    </div>
  </body>
</html>
"""

@app.get('/')
def index():
	docs = []
	for thefile in os.listdir('.'):
		_, extname = os.path.splitext(thefile)
		if os.path.isfile(thefile) and (extname == '.lua' or extname == ''):
			docs.append(thefile)
	return template(index_html, files=docs)

@app.get('/files/<filepath:path>')
def serve_file(filepath):
	with codecs.open(filepath, 'r', 'utf-8') as thefile:
		thetext = thefile.read()
	return thetext

@app.get('/edit/<filepath:path>')
def edit_file(filepath):
	if not os.path.isfile(filepath):
		open(filepath, 'a').close()
	with codecs.open(filepath, 'r', 'utf-8') as thefile:
		thetext = thefile.read()
	return template(wiki_html, thetext=thetext)

@app.post('/edit/<filepath:path>')
def write(filepath):
	thetext = request.body.read()
	with open(filepath, 'w') as thefile:
		thefile.write(thetext)

if __name__ == '__main__':
	os.chdir(os.path.dirname(os.path.abspath(__file__)))
	app.run(host='0.0.0.0', port=10031)