----------------------------------
-- Change to html
-- By Joshua
-- At 2013-02-26 15:48:58
----------------------------------
local Data={
	Main=[[
<!DOCTYPE html>
<!--Powered by Do Mark-->
<html>
	<head>
		<meta http-equiv=Content-Type content="text/html;charset=utf-8">
		<title>
			Project - %s
		</title>
	</head>
	<body>
		<link rel=stylesheet href="Style.css" type="text/css">
		<div class="post">
			<div class="entry">
				<a><h2><font color=blue>%s</font></h2></a>
]],
	BCode={
		["%%%%"]="&#37;",
		["%%!"]="&#33;",
		["%%%-"]="&#45;",
		["%%_"]="&#95;",
		["%%<"]="&lt;",
		["%%>"]="&gt;",
		["%%:"]="&#58;",
		["%%%["]="&#91;",
		["%%%]"]="&#93;",
		["%%%$"]="&#36;",
		["%%{"]="&#123;",
		["%%}"]="&#125;",
		["%%@"]="&#64;"
	},
	KChar={
		{"%*(.-)%*","<b>%1</b>"},
		{"!(.-)!","<i>%1</i>"},
		{"_(.-)_","<i>%1</i>"},
		{"%-(.-)%-","<del>%1</del>"},
		{"%[img (.-) (%d+)x(%d+)%]","<img src=\"image/%1\" alt=\"图像文件不存在\" width=%2 height=%3>"},
		{"%[img (.-)%]","<img src=\"image/%1\" alt=\"图像文件不存在\">"},
		{"%[link=(.-)%](.-)%[/link%]","<a href=\"%1\">%2</a>"},
		{"%[color (.-)%](.-)%[/color%]","<font color=%1>%2</font>"},
		{"%[font (.-)%](.-)%[/font%]","<font face=\"%1\">%2</font>"},
		{"%[size (%d+)%](.-)%[/size%]","<font size=%1px>%2</font>"},
		{"%[([^%d%%]-)%]","<%1>"}
	},
	Table=false
}

function Tabs(n)
	return string.rep("\t",n)
end

function BCode(c)
	for i,v in pairs(Data.BCode) do
		c=c:gsub(i,v)
	end
	for i,v in pairs(Data.KChar) do
		c=c:gsub(v[1],v[2])
	end
	return c
end

function ToCode(c,t)
	if not Data.Name then
		if c:find("^===.+===$") then
			Data.Name=c:match("^===(.+)===$")
			return string.format(Data.Main,Data.Name,Data.Name),4
		else
			return c
		end
	elseif c:find("^:.+$") then
		local title=c:match("^:(.+)$")
		return "<h4>"..title.."</h4>\n"
	elseif c:find("^<.-") then
		local s=c:match("^<(.-)$")
		if s=="" then
			return "<blockquote>\n",1
		elseif s:find(">$") then
			return "<blockquote>\n"..Tabs(t+1).."<p>"..BCode(s:sub(0,-1)).."</p>\n"..Tabs(t).."</blockquote>\n"
		else
			return "<blockquote>\n"..Tabs(t+1).."<p>"..BCode(s).."</p>\n",1
		end
	elseif c:find("^.->$") then
		local s=c:match("^(.-)>$")
		if s:sub(-1,-1)=="%" then
			return "<p>"..BCode(c).."</p>\n"
		end
		if s=="" then
			return "</blockquote>\n",0,-1
		else
			return "<p>"..BCode(s).."</p>\n"..Tabs(t-1).."</blockquote>\n",-1
		end
	elseif c:find("^{$") then
		if not Data.Table then
			Data.Table=true
			return "<table border=\"3\" width=\"400\" height=\"250\">\n",1
		else
			return "{\n"
		end
	elseif c:find("^}$") then
		if Data.Table then
			Data.Table=false
			return "</table>\n",0,-1
		else
			return "}\n"
		end
	elseif Data.Table then
		c=BCode(c)
		c=c.."$"
		local r={}
		for i in c:gmatch("(.-)%$") do
			if i:sub(1,1)=="@" then
				table.insert(r,string.format("%s\t<td align=\"left\">%s</td>",Tabs(t),i:sub(2,#i)))
			elseif i:sub(-1,-1)=="@" and c:sub(-2,-2)~="%" then
				table.insert(r,string.format("%s\t<td align=\"right\">%s</td>",Tabs(t),i:sub(1,#i-1)))
			else
				table.insert(r,string.format("%s\t<td>%s</td>",Tabs(t),i))
			end
		end
		return string.format("<tr>\n%s\n%s</tr>\n",table.concat(r,"\n"),Tabs(t))
	else
		if c:sub(1,1)=="@" then
			return "<p style=\"text-align:left;\">"..BCode(c:sub(2,#c)).."</p>\n"
		elseif c:sub(-1,-1)=="@" and c:sub(-2,-2)~="%" then
			return "<p style=\"text-align:right;\">"..BCode(c:sub(1,#c-1)).."</p>\n"
		else
			return "<p>"..BCode(c).."</p>\n"
		end
	end
end

function Main()
	local f=io.open("Project.do","r")
	if not f then
		f=io.open("Project.do","w")
		f:write("===New Project===\n:Title\n<Text>\n")
		f:close()
		f=io.open("Project.do","r")
	end

	local o=io.open("Project.html","w")
	o:write("")
	o:close()

	local o=io.open("Project.html","a")
	local tab=0

	for i in f:lines() do
		local r,n,y=ToCode(i:match("^ *(.-) *$"),tab)
		tab=tab+(y or 0)
		o:write(Tabs(tab),r)
		tab=tab+(n or 0)
	end

	o:write("\t\t\t</div>\n\t\t</div>\n\t</body>\n</html>")
	f:close()
	o:close()
end

Main()
