name = "test/test"
extension = ".ec"
filename = name + extension
newFilename = name + ".html"
target = File.new(newFilename, 'w')
target.truncate(0)
File.open(filename, "r") do |f|
 f.each_line do |line|
 ### HTML Tag
 if line.include? 'eclipse {'
  line.gsub!(/eclipse {/, "<html>")
 elsif line.include? '} eclipse'
  line.gsub!(/} eclipse/, "</html>")
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
 elsif line.include? 'abbr.Add @classTrue'
   line.gsub!(/abbr.Add @classTrue :/, '<abbr class="')
   line.gsub!(/: :/, '" title="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</abbr>')
 elsif line.include? 'abbr.Add'
   line.gsub!(/abbr.Add :/, '<abbr title="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</abbr>')
 ### End Abbreviate Tag

 ### Keyboard Input Tag
 elsif line.include? '% kbd % @classTrue'
   line.gsub!(/% kbd % @classTrue :/, '<kbd class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % kbd %'
   line.gsub!(/} % kbd %/, '</kbd>')
 elsif line.include? '% kbd % {'
   line.gsub!(/% kbd % {/, '<kbd>')
 elsif line.include? '} ::close.Kbd::'
   line.gsub!(/} % kbd %/, '</kbd>')
 ### End Keyboard Input Tag

 ### Variable Tag
 elsif line.include? '% variable % @classTrue'
   line.gsub!(/% variable % @classTrue :/, '<var class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % variable %'
   line.gsub!(/} % variable %/, "</var>")
 elsif line.include? '% variable % {'
   line.gsub!(/% variable % {/, "<var>")
 elsif line.include? '} % variable %'
   line.gsub!(/} % variable %/, "</var>")
 ### End Variable Tag

 ### Code Tag
 elsif line.include? '% code % @classTrue'
   line.gsub!(/% code % @classTrue :/, '<code class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % code %'
   line.gsub!(/} % code %/, "</code>")
 elsif line.include? '% code % {'
   line.gsub!(/% code % {/, "<code>")
 elsif line.include? '} % code %'
   line.gsub!(/} % code %/, "</code>")
 ### End Code Tag

 ### Sample Tag
 elsif line.include? '% sample % @classTrue'
  line.gsub!(/% sample % @classTrue :/, '<samp class="')
  line.gsub!(/: {/, '">')
 elsif line.include? '} % sample %'
  line.gsub!(/} % sample %/, "</samp>")
 elsif line.include? '% sample % {'
   line.gsub!(/% sample % {/, "<samp>")
 elsif line.include? '} % sample %'
   line.gsub!(/} % sample %/, "</samp>")
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
 elsif line.include? '% styling % {'
   line.gsub!(/% styling % {/, '<style>')
 elsif line.include? '} % styling %'
   line.gsub!(/} % styling %/, '</style>')
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
 elsif line.include? '% tdir %'
   line.gsub!(/% tdir % <'/, '<bdo dir="')
   line.gsub!(/'> {/, '">')
 elsif line.include? '} % tdir %'
   line.gsub!(/} % tdir %/, '</bdo>')
 ### Text Direction Tag End

 ### Address Tag
 elsif line.include? '% address % @classTrue'
   line.gsub!(/% address % @classTrue :/, '<address class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % address %'
   line.gsub!(/} % address %/, '</address>')
 elsif line.include? '% address % {'
   line.gsub!(/% address % {/, '<address>')
 elsif line.include? '} % address %'
   line.gsub!(/} % address %/, '</address>')
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
 elsif line.include? '% preformat % @classTrue'
   line.gsub!(/% preformat % @classTrue :/, '<pre class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % preformat %'
   line.gsub!(/} % preformat %/, '</pre>')
 elsif line.include? '% preformat % {'
   line.gsub!(/% preformat % {/, '<pre>')
 elsif line.include? '} % preformat %'
   line.gsub!(/} % preformat %/, '</pre>')

 ### Preformat Tag End

 ### Script Tag
 elsif line.include? '% script % {'
   line.gsub!(/% script % {/, '<script>')
 elsif line.include? '} % script %'
   line.gsub!(/} % script %/, '</script>')
 ### End Script Tag

 ### Span Tag
 elsif line.include? '% span % @classTrue'
   line.gsub!(/% span % @classTrue :/, '<span class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % span %'
   line.gsub!(/} % span %/, '</span>')
 elsif line.include? '% span % {'
   line.gsub!(/% span % {/, '<span>')
 elsif line.include? '} % span %'
   line.gsub!(/} % span %/, '</span>')
 ### End Span Tag

 ### Div Tag
 elsif line.include? '% div % @classTrue'
   line.gsub!(/% div % @classTrue :/, '<div class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % div %'
   line.gsub!(/} % div %/, '</div>')
 elsif line.include? '% div % {'
   line.gsub!(/% div % {/, '<div>')
 elsif line.include? '} % div %'
   line.gsub!(/} % div %/, '</div>')
 ### End Div Tag

 ### Noscript Tag
 elsif line.include? '% ns % {'
   line.gsub!(/% ns % {/, '<noscript>')
 elsif line.include? '} % ns %'
   line.gsub!(/} % ns %/, '</noscript>')
 ### End Noscript Tag

 ### Head Tag
 elsif line.include? '% head % {'
   line.gsub!(/% head % {/, "<head>")
 elsif line.include? '} % head %'
   line.gsub!(/} % head %/, "</head>")
 ### End Head Tag

 ### Body Tag
 elsif line.include? '% base % {'
   line.gsub!(/% base % {/, "<body>")
 elsif line.include? '} % base %'
   line.gsub!(/} % base %/, "</body>")
 ### End Body Tag

 ### Ext JS
 elsif line.include? '!include :Script:'
   line.gsub!(/!include :Script: </, '<script src="' )
   line.gsub!(/>/, '"></script>')
 ### End Ext JS

 ### Map Tag
 elsif line.include? '% map % @classTrue'
   line.gsub!(/% map % @classTrue <'/, '<map name="')
   line.gsub!(/'> :/, '" class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % map %'
  line.gsub!(/} % map %/, '</map>')
 elsif line.include? '% map %'
   line.gsub!(/% map % <'/, '<map name="')
   line.gsub!(/'> {/, '">')
 elsif line.include? '} % map %'
   line.gsub!(/} % map %/, '</map>')
 ### End Map Tag

 ### Table Tag(s)
 elsif line.include? '% table % @classTrue'
   line.gsub!(/% table % @classTrue :/, '<table class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % table %'
   line.gsub!(/} % table %/, "</table>")
 elsif line.include? '% row % @classTrue'
   line.gsub!(/% row % @classTrue :/, '<tr class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % row %'
   line.gsub!(/} % row %/, "</tr>")
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
 elsif line.include? '% table % {'
   line.gsub!(/% table % {/, "<table>")
 elsif line.include? '} % table %'
   line.gsub!(/} % table %/, "</table>")
 elsif line.include? '% row % {'
   line.gsub!(/% row % {/, "<tr>")
 elsif line.include? '} % row %'
   line.gsub!(/} % row %/, "</tr>")
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
 elsif line.include? '% ulist % @classTrue'
   line.gsub!(/% ulist % @classTrue :/, '<ul class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % ulist %'
   line.gsub!(/} % ulist %/, "</ul>")
 elsif line.include? '% olist % @classTrue'
   line.gsub!(/% olist % @classTrue <'/, '<ol type="')
   line.gsub!(/'> :/, '" class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % olist %'
   line.gsub!(/} % olist %/, "</ol>")
 elsif line.include? '&addItem @classTrue'
   line.gsub!(/&addItem @classTrue :/, '<li class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</li>')
 elsif line.include? '% dlist % @classTrue'
   line.gsub!(/% dlist % @classTrue :/, '<dl class="')
   line.gsub!(/: {/, '">')
 elsif line.include? '} % dlist %'
   line.gsub!(/} % dlist %/, "</dl>")
 elsif line.include? '&addTerm @classTrue'
   line.gsub!(/&addTerm @classTrue :/, '<dt class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</dt>')
 elsif line.include? '&addDescription @classTrue'
   line.gsub!(/&addDescription @classTrue :/, '<dd class="')
   line.gsub!(/: <'/, '">')
   line.gsub!(/'>/, '</dd>')
 elsif line.include? '% ulist % {'
   line.gsub!(/% ulist % {/, "<ul>")
 elsif line.include? '} % ulist %'
   line.gsub!(/} % ulist %/, "</ul>")
 elsif line.include? '% olist %'
   line.gsub!(/% olist % <'/, '<ol type="')
   line.gsub!(/'> {/, '">')
 elsif line.include? '} % olist %'
   line.gsub!(/} % olist %/, "</ol>")
 elsif line.include? '&addItem'
   line.gsub!(/&addItem <'/, '<li>')
   line.gsub!(/'>/, '</li>')
 elsif line.include? '% dlist % {'
   line.gsub!(/% dlist % {/, "<dl>")
 elsif line.include? '} % dlist %'
   line.gsub!(/} % dlist %/, "</dl>")
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
