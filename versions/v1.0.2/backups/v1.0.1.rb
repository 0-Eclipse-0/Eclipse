name = "example/example2"
extension = ".ec"
filename = name + extension
newFilename = name + ".html"
target = File.new(newFilename, 'w')
target.truncate(0)
File.open(filename, "r") do |f|
 f.each_line do |line|
 ### HTML Tag
 if line.include? '::::open.EC:::: {'
  line.gsub!(/::::open.EC:::: {/, "<html>")
 elsif line.include? '} ::::close.EC::::'
  line.gsub!(/} ::::close.EC::::/, "</html>")
 ### End HTML Tag

 ### Doctype Tag
 elsif line.include? '&setDoctype'
   line.gsub!(/&setDoctype </, '<!DOCTYPE ')
   line.gsub!(/>/, '>')
 ### End Doctype Tag

 ### Cite Tag
 elsif line.include? 'cite.Add @classTrue'
   line.gsub!(/cite.Add @classTrue :/, '<cite class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</cite>')
 elsif line.include? 'cite.Add'
   line.gsub!(/cite.Add <'/, '<cite>')
   line.gsub!(/'>/, '</cite>')
 ### End Cite Tag

 ### Abbreviate Tag
 elsif line.include? 'abbr.New @classTrue'
   line.gsub!(/abbr.New @classTrue :/, '<abbr class="')
   line.gsub!(/: :/, '" title="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</abbr>')
 elsif line.include? 'abbr.New'
   line.gsub!(/abbr.New :/, '<abbr title="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</abbr>')
 ### End Abbreviate Tag

 ### Keyboard Input Tag
 elsif line.include? '::open.Kbd:: @classTrue'
   line.gsub!(/::open.Kbd:: @classTrue :/, '<kbd class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} ::close.Kbd::'
   line.gsub!(/} ::close.Kbd::/, '</kbd>')
 elsif line.include? '::open.Kbd:: {'
   line.gsub!(/::open.Kbd:: {/, '<kbd>')
 elsif line.include? '} ::close.Kbd::'
   line.gsub!(/} ::close.Kbd::/, '</kbd>')
 ### End Keyboard Input Tag

 ### Variable Tag
 elsif line.include? '::open.Var:: @classTrue'
   line.gsub!(/::open.Var:: @classTrue :/, '<var class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} ::close.Var::'
   line.gsub!(/} ::close.Var::/, "</var>")
 elsif line.include? '::open.Var:: {'
   line.gsub!(/::open.Var:: {/, "<var>")
 elsif line.include? '} ::close.Var::'
   line.gsub!(/} ::close.Var::/, "</var>")
 ### End Variable Tag

 ### Code Tag
 elsif line.include? '::open.Code:: @classTrue'
   line.gsub!(/::open.Code:: @classTrue :/, '<code class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} ::close.Code::'
   line.gsub!(/} ::close.Code::/, "</code>")
 elsif line.include? '::open.Code:: {'
   line.gsub!(/::open.Code:: {/, "<code>")
 elsif line.include? '} ::close.Code::'
   line.gsub!(/} ::close.Code::/, "</code>")
 ### End Code Tag

 ### Sample Tag
 elsif line.include? '::open.Sample:: @classTrue'
  line.gsub!(/::open.Sample:: @classTrue :/, '<samp class="')
  line.gsub!(/: {/, '">')
 elsif line.include? '} ::close.Sample::'
  line.gsub!(/} ::close.Sample::/, "</samp>")
 elsif line.include? '::open.Sample:: {'
   line.gsub!(/::open.Sample:: {/, "<samp>")
 elsif line.include? '} ::close.Sample::'
   line.gsub!(/} ::close.Sample::/, "</samp>")
 ### End Sample Tag

 ### Comment Tag(s)
 elsif line.include? '#--{'
   line.gsub!(/#--{/, "<!--")
 elsif line.include? '}--#'
   line.gsub!(/}--#/, "-->")
 elsif line.include? '{=>'
   line.gsub!(/{=>/, "<!--")
   line.gsub!(/<=}/, "-->")
 ### End Comment Tag(s)

 ### Link Tag
 elsif line.include? '&addLink @classTrue'
   line.gsub!(/&addLink @classTrue :/, '<a href="')
   line.gsub!(/: :/, '" class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</a>')
 elsif line.include? '&addLink'
   line.gsub!(/&addLink :/, '<a href="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</a>')
 ### End Link Tag

 ### Image Tag
 elsif line.include? '&addImage @classTrue'
   line.gsub!(/&addImage @classTrue :/, '<img src="')
   line.gsub!(/: :/, '" class="')
   line.gsub!(/: <'/, '" alt="')
   line.gsub!(/'>/, '">')
 elsif line.include? '&addImage'
   line.gsub!(/&addImage :/, '<img src="')
   line.gsub!(/: <'/, '" alt="')
   line.gsub!(/'>/, '">')
 ### End Image Tag

 ### Title Tag
 elsif line.include? '&setTitle'
   line.gsub!(/&setTitle <'/, '<title>')
   line.gsub!(/'>/, '</title>')
 ### End Title Tag

 ### Style Tag
 elsif line.include? '::open.Style:: {'
   line.gsub!(/::open.Style:: {/, '<style>')
 elsif line.include? '} ::close.Style::'
   line.gsub!(/} ::close.Style::/, '</style>')
 ### End Style Tag

 ### MetaData Tag
 elsif line.include? '&setMData'
   if line.include? '&setMData :name:'
     line.gsub!(/&setMData :name: <'/, '<meta name="')
     line.gsub!(/'> <'/, '" content="')
     line.gsub!(/'>/, '">')
   elsif line.include? '&setMData :http-equiv:'
     line.gsub!(/&setMData :http-equiv: <'/, '<meta http-equiv="')
     line.gsub!(/'> <'/, '" content="')
     line.gsub!(/'>/, '">')
   elsif line.include? '&setMData :charset:'
     line.gsub!(/&setMData :charset: <'/, '<meta charset="')
     line.gsub!(/'>/, '">')
   end
 ### End MetaData Tag

 ### Base Tag
 elsif line.include? '&setBase'
   line.gsub!(/&setBase <'/, '<base href="')
   line.gsub!(/'> <'/, '" target="')
   line.gsub!(/'>/, '">')
 ### End Base Tag

 ### Heading Tag(s)
 elsif line.include? 'heading.New'
   if line.include? 'heading.New :1: @classTrue'
     line.gsub!(/heading.New :1: @classTrue :/, '<h1 class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</h1>')
   elsif line.include? 'heading.New :2: @classTrue'
     line.gsub!(/heading.New :2: @classTrue :/, '<h2 class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</h2>')
   elsif line.include? 'heading.New :3: @classTrue'
     line.gsub!(/heading.New :3: @classTrue :/, '<h3 class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</h3>')
   elsif line.include? 'heading.New :4: @classTrue'
     line.gsub!(/heading.New :4: @classTrue :/, '<h4 class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</h4>')
   elsif line.include? 'heading.New :5: @classTrue'
     line.gsub!(/heading.New :5: @classTrue :/, '<h5 class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</h5>')
   elsif line.include? 'heading.New :6: @classTrue'
     line.gsub!(/heading.New :6: @classTrue :/, '<h6 class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</h6>')
   elsif line.include? 'heading.New :1:'
     line.gsub!(/heading.New :1: <'/, '<h1>')
     line.gsub!(/'>/, '</h1>')
   elsif line.include? 'heading.New :2:'
     line.gsub!(/heading.New :2: <'/, '<h2>')
     line.gsub!(/'>/, '</h2>')
   elsif line.include? 'heading.New :3:'
     line.gsub!(/heading.New :3: <'/, '<h3>')
     line.gsub!(/'>/, '</h3>')
   elsif line.include? 'heading.New :4:'
     line.gsub!(/heading.New :4: <'/, '<h4>')
     line.gsub!(/'>/, '</h4>')
   elsif line.include? 'heading.New :5:'
     line.gsub!(/heading.New :5: <'/, '<h5>')
     line.gsub!(/'>/, '</h5>')
   elsif line.include? 'heading.New :6:'
     line.gsub!(/heading.New :6: <'/, '<h6>')
     line.gsub!(/'>/, '</h6>')
   end
 ### End Heading Tag(s)

 ### Line Tag(s)
 elsif line.include? 'line >> Add'
   line.gsub!(/line >> Add/, '<hr>')
 elsif line.include? 'line >> Break'
   line.gsub!(/line >> Break/, '<br>')
 ### Line Tag(s) End

 ### Text Tag(s)
 elsif line.include? 'text.add.'
   if line.include? 'text.add.bd @classTrue'
     line.gsub!(/text.add.bd @classTrue :/, '<b class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</b>')
   elsif line.include? 'text.add.im @classTrue'
     line.gsub!(/text.add.im @classTrue :/, '<strong class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</strong>')
   elsif line.include? 'text.add.em @classTrue'
     line.gsub!(/text.add.em @classTrue :/, '<em class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</em>')
   elsif line.include? 'text.add.it @classTrue'
     line.gsub!(/text.add.it @classTrue :/, '<i class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</i>')
   elsif line.include? 'text.add.sm @classTrue'
     line.gsub!(/text.add.sm @classTrue :/, '<small class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</small>')
   elsif line.include? 'text.add.dl @classTrue'
     line.gsub!(/text.add.dl @classTrue :/, '<del class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</del>')
   elsif line.include? 'text.add.sb @classTrue'
     line.gsub!(/text.add.sb @classTrue :/, '<sub class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</sub>')
   elsif line.include? 'text.add.sp @classTrue'
     line.gsub!(/text.add.sp @classTrue :/, '<sup class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</sup>')
   elsif line.include? 'text.add.in @classTrue'
     line.gsub!(/text.add.in @classTrue :/, '<ins class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</ins>')
   elsif line.include? 'text.add.mk @classTrue'
     line.gsub!(/text.add.mk @classTrue :/, '<mark class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</mark>')
   elsif line.include? 'text.add.bd'
     line.gsub!(/text.add.bd <'/, '<b>')
     line.gsub!(/'>/, '</b>')
   elsif line.include? 'text.add.im'
     line.gsub!(/text.add.im <'/, '<strong>')
     line.gsub!(/'>/, '</strong>')
   elsif line.include? 'text.add.em'
     line.gsub!(/text.add.em <'/, '<em>')
     line.gsub!(/'>/, '</em>')
   elsif line.include? 'text.add.it'
     line.gsub!(/text.add.it <'/, '<i>')
     line.gsub!(/'>/, '</i>')
   elsif line.include? 'text.add.sm'
     line.gsub!(/text.add.sm <'/, '<small>')
     line.gsub!(/'>/, '</small>')
   elsif line.include? 'text.add.dl'
     line.gsub!(/text.add.dl <'/, '<del>')
     line.gsub!(/'>/, '</del>')
   elsif line.include? 'text.add.sb'
     line.gsub!(/text.add.sb <'/, '<sub>')
     line.gsub!(/'>/, '</sub>')
   elsif line.include? 'text.add.sp'
     line.gsub!(/text.add.sp <'/, '<sup>')
     line.gsub!(/'>/, '</sup>')
   elsif line.include? 'text.add.in'
     line.gsub!(/text.add.in <'/, '<ins>')
     line.gsub!(/'>/, '</ins>')
   elsif line.include? 'text.add.mk'
     line.gsub!(/text.add.mk <'/, '<mark>')
     line.gsub!(/'>/, '</mark>')
   end
 ### Text Tag(s) End

 ### Quote Tag(s)
 elsif line.include? 'quote.New'
   if line.include? 'quote.New :block: @classTrue'
     line.gsub!(/quote.New :block: @classTrue :/, '<blockquote class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</blockquote>')
   elsif line.include? 'quote.New :reg: @classTrue'
     line.gsub!(/quote.New :reg: @classTrue :/, '<q class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, '</q>')
   elsif line.include? 'quote.New :block:'
     line.gsub!(/quote.New :block: <'/, '<blockquote>')
     line.gsub!(/'>/, '</blockquote>')
   elsif line.include? 'quote.New :reg:'
     line.gsub!(/quote.New :reg: <'/, '<q>')
     line.gsub!(/'>/, '</q>')
   end
 ### Quote Tag(s) End

 ### Text Direction Tag
 elsif line.include? ':open.TDir:'
   line.gsub!(/:open.TDir: <'/, '<bdo dir="')
   line.gsub!(/'> {/, '">')
 elsif line.include? '} :close.TDir:'
   line.gsub!(/} :close.TDir:/, '</bdo>')
 ### Text Direction Tag End

 ### Address Tag
 elsif line.include? ':open.Address: @classTrue'
   line.gsub!(/:open.Address: @classTrue :/, '<address class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} :close.Address:'
   line.gsub!(/} :close.Address:/, '</address>')
 elsif line.include? ':open.Address: {'
   line.gsub!(/:open.Address: {/, '<address>')
 elsif line.include? '} :close.Address:'
   line.gsub!(/} :close.Address:/, '</address>')
 ### Address Tag End

 ### Paragraph Tag(s)
 elsif line.include? 'pgh.New'
   if line.include? 'pgh.New :pre: @classTrue'
     line.gsub!(/pgh.New :pre: @classTrue :/, '<pre class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, "</pre>")
   elsif line.include? 'pgh.New :reg: @classTrue'
     line.gsub!(/pgh.New :reg: @classTrue :/, '<p class="')
     line.gsub!(/: <'/, '">')
     line.gsub!(/'>/, "</p>")
   elsif line.include? 'pgh.New :pre:'
     line.gsub!(/pgh.New :pre: <'/, "<pre>")
     line.gsub!(/'>/, "</pre>")
   elsif line.include? 'pgh.New :reg:'
     line.gsub!(/pgh.New :reg: <'/, "<p>")
     line.gsub!(/'>/, "</p>")
   end
 ### Paragraph Tag(s) End

 ### Preformat Tag
 elsif line.include? ':open.Pre: @classTrue'
   line.gsub!(/:open.Pre: @classTrue :/, '<pre class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} :close.Pre:'
   line.gsub!(/} :close.Pre:/, '</pre>')
 elsif line.include? ':open.Pre: {'
   line.gsub!(/:open.Pre: {/, '<pre>')
 elsif line.include? '} :close.Pre:'
   line.gsub!(/} :close.Pre:/, '</pre>')

 ### Preformat Tag End

 ### Script Tag
 elsif line.include? '::open.Script:: {'
   line.gsub!(/::open.Script:: {/, '<script>')
 elsif line.include? '} ::close.Script::'
   line.gsub!(/} ::close.Script::/, '</script>')
 ### End Script Tag

 ### Span Tag
 elsif line.include? '::open.Span:: @classTrue'
   line.gsub!(/::open.Span:: @classTrue :/, '<span class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} ::close.Span::'
   line.gsub!(/} ::close.Span::/, '</span>')
 elsif line.include? '::open.Span:: {'
   line.gsub!(/::open.Span:: {/, '<span>')
 elsif line.include? '} ::close.Span::'
   line.gsub!(/} ::close.Span::/, '</span>')
 ### End Span Tag

 ### Div Tag
 elsif line.include? '::open.Div:: @classTrue'
   line.gsub!(/::open.Div:: @classTrue :/, '<div class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} ::close.Div::'
   line.gsub!(/} ::close.Div::/, '</div>')
 elsif line.include? '::open.Div:: {'
   line.gsub!(/::open.Div:: {/, '<div>')
 elsif line.include? '} ::close.Div::'
   line.gsub!(/} ::close.Div::/, '</div>')
 ### End Div Tag

 ### Noscript Tag
 elsif line.include? '::open.NS:: {'
   line.gsub!(/::open.NS:: {/, '<noscript>')
 elsif line.include? '} ::close.NS::'
   line.gsub!(/} ::close.NS::/, '</noscript>')
 ### End Noscript Tag

 ### Head Tag
 elsif line.include? ':::open.Head::: {'
   line.gsub!(/:::open.Head::: {/, "<head>")
 elsif line.include? '} :::close.Head:::'
   line.gsub!(/} :::close.Head:::/, "</head>")
 ### End Head Tag

 ### Body Tag
 elsif line.include? ':::open.Base::: {'
   line.gsub!(/:::open.Base::: {/, "<body>")
 elsif line.include? '} :::close.Base:::'
   line.gsub!(/} :::close.Base:::/, "</body>")
 ### End Body Tag

 ### Ext JS
 elsif line.include? '!include :Script:'
   line.gsub!(/!include :Script: </, '<script src="' )
   line.gsub!(/>/, '"></script>')
 ### End Ext JS

 ### Map Tag
 elsif line.include? ':open.Map: @classTrue'
   line.gsub!(/:open.Map: @classTrue <'/, '<map name="')
   line.gsub!(/'> :/, '" class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} :close.Map:'
  line.gsub!(/} :close.Map:/, '</map>')
 elsif line.include? ':open.Map:'
   line.gsub!(/:open.Map: <'/, '<map name="')
   line.gsub!(/'> {/, '">')
 elsif line.include? '} :close.Map:'
   line.gsub!(/} :close.Map:/, '</map>')
 ### End Map Tag

 ### Table Tag(s)
 elsif line.include? ':open.Table: @classTrue'
   line.gsub!(/:open.Table: @classTrue :/, '<table class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} :close.Table:'
   line.gsub!(/} :close.Table:/, "</table>")
 elsif line.include? ':open.Row: @classTrue'
   line.gsub!(/:open.Row: @classTrue :/, '<tr class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} :close.Row:'
   line.gsub!(/} :close.Row:/, "</tr>")
 elsif line.include? '&addData @classTrue'
   line.gsub!(/&addData @classTrue :/, '<td class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</td>')
 elsif line.include? '&addHead @classTrue'
   line.gsub!(/&addHead @classTrue :/, '<th class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</th>')
 elsif line.include? '&addCaption @classTrue'
   line.gsub!(/&addCaption @classTrue :/, '<caption class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</caption>')
 elsif line.include? ':open.Table: {'
   line.gsub!(/:open.Table: {/, "<table>")
 elsif line.include? '} :close.Table:'
   line.gsub!(/} :close.Table:/, "</table>")
 elsif line.include? ':open.Row: {'
   line.gsub!(/:open.Row: {/, "<tr>")
 elsif line.include? '} :close.Row:'
   line.gsub!(/} :close.Row:/, "</tr>")
 elsif line.include? '&addData'
   line.gsub!(/&addData <'/, '<td>')
   line.gsub!(/'>/, '</td>')
 elsif line.include? '&addHead'
   line.gsub!(/&addHead <'/, '<th>')
   line.gsub!(/'>/, '</th>')
 elsif line.include? '&addCaption'
   line.gsub!(/&addCaption <'/, '<caption>')
   line.gsub!(/'>/, '</caption>')
 ### End Table Tag(s)

 ### List Tag(s)
 elsif line.include? ':open.UList: @classTrue'
   line.gsub!(/:open.UList: @classTrue :/, '<ul class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} :close.UList:'
   line.gsub!(/} :close.UList:/, "</ul>")
 elsif line.include? ':open.OList: @classTrue'
   line.gsub!(/:open.OList: @classTrue <'/, '<ol type="')
   line.gsub!(/'> :/, '" class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} :close.OList:'
   line.gsub!(/} :close.OList:/, "</ol>")
 elsif line.include? '&addItem @classTrue'
   line.gsub!(/&addItem @classTrue :/, '<li class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</li>')
 elsif line.include? ':open.DList: @classTrue'
   line.gsub!(/:open.DList: @classTrue :/, '<dl class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} :close.DList:'
   line.gsub!(/} :close.DList:/, "</dl>")
 elsif line.include? '&addTerm @classTrue'
   line.gsub!(/&addTerm @classTrue :/, '<dt class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</dt>')
 elsif line.include? '&addDescription @classTrue'
   line.gsub!(/&addDescription @classTrue :/, '<dd class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</dd>')
 elsif line.include? ':open.UList: {'
   line.gsub!(/:open.UList: {/, "<ul>")
 elsif line.include? '} :close.UList:'
   line.gsub!(/} :close.UList:/, "</ul>")
 elsif line.include? ':open.OList:'
   line.gsub!(/:open.OList: <'/, '<ol type="')
   line.gsub!(/'> {/, '">')
 elsif line.include? '} :close.OList:'
   line.gsub!(/} :close.OList:/, "</ol>")
 elsif line.include? '&addItem'
   line.gsub!(/&addItem <'/, '<li>')
   line.gsub!(/'>/, '</li>')
 elsif line.include? ':open.DList: {'
   line.gsub!(/:open.DList: {/, "<dl>")
 elsif line.include? '} :close.DList:'
   line.gsub!(/} :close.DList:/, "</dl>")
 elsif line.include? '&addTerm'
   line.gsub!(/&addTerm <'/, '<dt>')
   line.gsub!(/'>/, '</dt>')
 elsif line.include? '&addDescription'
   line.gsub!(/&addDescription <'/, '<dd>')
   line.gsub!(/'>/, '</dd>')
 ### End List Tag(s)

 ### Ext StyleSheet
 elsif line.include? '!include :StyleSheet:'
   line.gsub!(/!include :StyleSheet: :/, '<link rel="stylesheet" type="text/')
   line.gsub!(/: </, '" href="')
   line.gsub!(/>/, '">')
 ### End Ext StyleSheet
 end
  puts line
  target.write(line)
 end
end
