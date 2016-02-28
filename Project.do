===Do Mark - Version 1.1.0.2===
:简介
<
 研究AI中所开发的一个工具。
 Do Mark（Do标记）属于一种*标记语言*。
 它可以快速的用来生成html工程文档。
>
:使用介绍
<
 你需要创建一个名为!Project.do!的文件于当前目录下。
 运行!Change.lua!，你可以看见程序生成了名为!Project.html!的工程文件。
 另外，该文件的样式表依赖于目录下的!Style.css!。
 :格式
 <
  你可以从附带的_示例_(这个文件)看到效果。
  它是由Project.do生成的。
  它的格式是这样：
  <
   ===工程名===
   正文内容
  >
  需要注意的是，在工程名之前的内容全部都会被忽略，不被转换处理。
  然后是冒号语法（:）它的作用是把加上四级标题。
  接着，是%<和%>，它们是界定符。%<等价于%<blockquote%>，而%>等价于%</blockquote%>。
  另外，Do标记提供了几种特殊格式。
  <
   效果     格式
   *粗体*    %*文本%*
   !斜体!	    %!文本%!
   _下划线_  %_文本%_
   -删除线-  %-文本%-
  >
  除了这些，Do标记还提供了超链接的语法。
  <
   [link=http://srkf.tk/]暗影の森[/link]
   %[link=地址%]文本%[/link%]
   等价于%<a href="地址"%>文本%</a%>
  >
  同样类似的有颜色语法。
  <
   [color blue]示例[/color]
   %[color 颜色英文/代码%]文本%[/color%]
   等价于%<font color=颜色英文/代码%>文本%</font%>
  >
  那么同样还有一个字体的设定。
  <
   [font 宋体]示例[/font]
   %[font 字体%]文本%[/font%]
   等价于%<font face=字体%>文本%</font%>
  >
  ……当然，还有字体的大小。
  <
   [size 16]示例[/size]
   %[size 大小%]文本%[/size%]
   等价于%<font size=大小px%>文本%</font%>
   大小限定为整数。
  >
  嗯，插入图片我当然也是人性化的提供了~
  <
   [link=http://srkf.tk/][img SFicon.jpg 100x100][/link]
   %[img 文件 宽x高%] 或者 %[img 文件%]
   等价于%<img src="/image/文件" alt="图像文件不存在"%>
   宽/高限定为整数（不指定时默认为最大）；文件存放在当前目录下的image文件夹内。
   （如果加上超链接图片会有边框的说，挺漂亮的）
  >
  Do标记里面的表格有另外的存在（Q: Why? A: Why not? 理由很简单，缩进不好看（啊喂））。
  <
   {
    @第一行$第二列@
    第一列@$@第二行
   }
   %{
    %@第一行%$第二列%@
    第一列%@%$%@第二行
   %}
   它们等价于html中的Table（因为略长就不写了）。
   在这里面也存在着特殊语法，它被称为@(at)标记。
   当@在文字左边时，就会左对齐；@在文字右边时则相反。当然也有专属于@的转义符（%%%@）。不过一般不需要转义，除非它在文本的最左边/最右边。@标记也适用于普通文本。
  >
  那么，还有转义符的存在（这是必然的也是必要的）。
  <
   Do标记转义有如下几种：
   %%%% %%%! %%%_ %%%- %%%< %%%> %%%* %%%[  %%%] %%%{ %%%} %%%$ %%%@
   转义后的结果是百分号右边的符号。
  >
  最后，Do标记中，*缩进的格式*和*前导空格/后导空格*都是没有任何意义的。
  Do标记处理器将会淡定的*忽略*掉你*所有的前导空格/后导空格*。
  另外书写Do标记时缩进请使用*空格*而不是Tab。理由很简单：Tab将会被误解进代码里面。
  如果你确实需要在开头放上空格的话我更加推荐你使用表或者右缩进，它们的相关语法我将会在后面的版本添加。
  另外值得注意的一点是不推荐在文本中间内连续放过多的空格，它们在html中的体现只是一个空格（Tab也是一样的）。
 >
 :其它的事情
 <
  Do处理器代码有些混乱（其实是相当混乱），好看的貌似只有这个页面(=ω=)和其源代码文件(=ω=)了~
  看似很神奇但是其实只不过是做了一点文本处理而已。所以吐槽什么的尽管来吧（我已经做好心理准备了，哼！）
  用html代码的时候要注意有可能会被Do转换器理解为是blockquote=~=所以呢，要注意的东西就是直接用html时要用中括号(%[%])取代尖括号(%<%>)。需要使用中括号的时候记得加上转义符呢(%%%[)哦~
  *那么最重要的一点：尽量避免一行的末尾加上%>符号（除非是你要结束一个段落）。它可能会被误解为结束一个段落的符号。如果你确实需要请一定要保证加上转义符。*
 >
>
:附录~颜色列表
<
 {
  @[color antiquewhite]古典白色[/color]$@*antiquewhite*
  @[color aqua]浅绿色[/color]$@*aqua*
  @[color aquamarine]碧绿色[/color]$@*aquamarine*
  @[color azure]天蓝色[/color]$@*azure*
  @[color beige]米色[/color]$@*beige*
  @[color bisque]桔黄色[/color]$@*bisque*
  @[color black]黑色[/color]$@*black*
  @[color blanchedalmond]白杏色[/color]$@*blanchedalmond*
  @[color blue]蓝色[/color]$@*blue*
  @[color blueviolet]蓝紫色[/color]$@*blueviolet*
  @[color brown]褐色[/color]$@*brown*
  @[color burlywood]实木色[/color]$@*burlywood*
  @[color cadetblue]刺桧蓝色[/color]$@*cadetblue*
  @[color chartreuse]亮黄绿色[/color]$@*chartreuse*
  @[color chocolate]巧克力色[/color]$@*chocolate*
  @[color coral]珊瑚色[/color]$@*coral*
  @[color cornflowerblue]矢车菊色[/color]$@*cornflowerblue*
  @[color cornsilk]谷丝色[/color]$@*cornsilk*
  @[color crimson]深红色[/color]$@*crimson*
  @[color cyan]蓝绿色[/color]$@*cyan*
  @[color darkblue]深蓝色[/color]$@*darkblue*
  @[color darkcyan]深青色[/color]$@*darkcyan*
  @[color darkgoldenrod]深金杆色[/color]$@*darkgoldenrod*
  @[color darkgray]深灰色[/color]$@*darkgray*
  @[color darkgreen]深绿色[/color]$@*darkgreen*
  @[color darkkhaki]深黄褐色[/color]$@*darkkhaki*
  @[color darkmagenta]深洋红色[/color]$@*darkmagenta*
  @[color darkolivegreen]深橄榄绿色[/color]$@*darkolivegreen*
  @[color darkorange]深橙色[/color]$@*darkorange*
  @[color darkorchid]深紫色[/color]$@*darkorchid*
  @[color darkred]深红色[/color]$@*darkred*
  @[color darksalmon]深肉色[/color]$@*darksalmon*
  @[color darkseagreen]深海绿色[/color]$@*darkseagreen*
  @[color darkslateblue]深暗灰蓝色[/color]$@*darkslateblue*
  @[color darkslategray]深暗蓝灰色[/color]$@*darkslategray*
  @[color darkturquoise]深青绿色[/color]$@*darkturquoise*
  @[color darkviolet]深紫色[/color]$@*darkviolet*
  @[color deeppink]深粉色[/color]$@*deeppink*
  @[color deepskyblue]深天蓝色[/color]$@*deepskyblue*
  @[color dimgray]暗灰色[/color]$@*dimgray*
  @[color dodgerblue]遮板蓝色[/color]$@*dodgerblue*
  @[color firebrick]砖色[/color]$@*firebrick*
  @[color floralwhite]花白色[/color]$@*floralwhite*
  @[color forestgreen]葱绿色[/color]$@*forestgreen*
  @[color fushcia]紫红色[/color]$@*fushcia*
  @[color gainsboro]庚斯博罗灰色[/color]$@*gainsboro*
  @[color ghostwhite]幽灵白色[/color]$@*ghostwhite*
  @[color gold]金黄色[/color]$@*gold*
  @[color goldenrod]金杆黄色[/color]$@*goldenrod*
  @[color gray]灰色[/color]$@*gray*
  @[color green]绿色[/color]$@*green*
  @[color greenyellow]绿黄色[/color]$@*greenyellow*
  @[color honeydew]蜜汁色[/color]$@*honeydew*
  @[color hotpink]亮粉色[/color]$@*hotpink*
  @[color indianred]印第安红色[/color]$@*indianred*
  @[color indigo]靛青色[/color]$@*indigo*
  @[color ivory]象牙色[/color]$@*ivory*
  @[color khaki]黄褐色[/color]$@*khaki*
  @[color lavender]淡紫色[/color]$@*lavender*
  @[color lavenderblush]浅紫红色[/color]$@*lavenderblush*
  @[color lawngreen]草绿色[/color]$@*lawngreen*
  @[color lemonchiffon]柠檬纱色[/color]$@*lemonchiffon*
  @[color lightblue]浅蓝色[/color]$@*lightblue*
  @[color lightcoral]浅珊瑚色[/color]$@*lightcoral*
 }
>
:版权声明
<
 Do标记由[link=http://srkf.tk/]暗影软件[/link]出品。它是*开源的*，你可以根据你的需要去自由地定制它。
>