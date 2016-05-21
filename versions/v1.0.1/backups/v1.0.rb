name = "test/test"
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
 elsif line.include? 'cite.Add'
   line.gsub!(/cite.Add <'/, '<cite>')
   line.gsub!(/'>/, '</cite>')
 ### End Cite Tag

 ### Abbreviate Tag
 elsif line.include? 'abbr.New'
   line.gsub!(/abbr.New :/, '<abbr title="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</abbr>')
 ### End Abbreviate Tag

 ### Keyboard Input Tag
 elsif line.include? '::open.Kbd:: {'
   line.gsub!(/::open.Kbd:: {/, '<kbd>')
 elsif line.include? '} ::close.Kbd::'
   line.gsub!(/} ::close.Kbd::/, '</kbd>')
 ### End Keyboard Input Tag

 ### Variable Tag
 elsif line.include? '::open.Var:: {'
   line.gsub!(/::open.Var:: {/, "<var>")
 elsif line.include? '} ::close.Var::'
   line.gsub!(/} ::close.Var::/, "</var>")
 ### End Variable Tag

 ### Code Tag
 elsif line.include? '::open.Code:: {'
   line.gsub!(/::open.Code:: {/, "<code>")
 elsif line.include? '} ::close.Code::'
   line.gsub!(/} ::close.Code::/, "</code>")
 ### End Code Tag

 ### Sample Tag
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
 elsif line.include? '&addLink'
   line.gsub!(/&addLink :/, '<a href="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</a>')
 ### End Link Tag

 ### Image Tag
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
   if line.include? 'heading.New :1:'
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
   if line.include? 'text.add.bd'
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
   if line.include? 'quote.New :block:'
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
 elsif line.include? ':open.Address: {'
   line.gsub!(/:open.Address: {/, '<address>')
 elsif line.include? '} :close.Address:'
   line.gsub!(/} :close.Address:/, '</address>')
 ### Address Tag End

 ### Paragraph Tag(s)
 elsif line.include? 'pgh.New'
   if line.include? 'pgh.New :pre:'
     line.gsub!(/pgh.New :pre: <'/, "<pre>")
     line.gsub!(/'>/, "</pre>")
   elsif line.include? 'pgh.New :reg:'
     line.gsub!(/pgh.New :reg: <'/, "<p>")
     line.gsub!(/'>/, "</p>")
   end
 ### Paragraph Tag(s) End

 ### Preformat Tag
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
 elsif line.include? '::open.Span:: {'
   line.gsub!(/::open.Span:: {/, '<span>')
 elsif line.include? '} ::close.Span::'
   line.gsub!(/} ::close.Span::/, '</span>')
 ### End Span Tag

 ### Div Tag
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
 elsif line.include? ':open.Map:'
   line.gsub!(/:open.Map: <'/, '<map name="')
   line.gsub!(/'> {/, '">')
 elsif line.include? '} :close.Map:'
   line.gsub!(/} :close.Map:/, '</map>')
 ### End Map Tag

 ### Table Tag(s)
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

 else
   puts "Error: Incorrect syntax, spelling, etc."
 end
  puts line
  target.write(line)
 end
end
