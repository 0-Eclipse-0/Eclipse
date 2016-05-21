&setDoctype <html>
::::open.EC:::: {
 :::open.Head::: {
  #--{
  ::open.Style:: {
  } ::close.Style::
  ::open.Script:: {
  } ::close.Script::
  ::open.NS:: {
  } ::close.NS::
  }--#
  &setMData :name: <'Test'> <'Test'>
  &setMData :http-equiv: <'refresh'> <'30'>
  &setMData :charset: <'UTF-8'>
  &setTitle <'Test'>
  &setBase <'https://www.test.com/images'> <'_blank'>
  !include :StyleSheet: :CSS: <style.css>
  !include :Script: <index.js>
 } :::close.Head:::
 :::open.Base::: {
  heading.New :1: <'Test'>
  heading.New :2: <'Test'>
  heading.New :3: <'Test'>
  heading.New :4: <'Test'>
  heading.New :5: <'Test'>
  heading.New :6: <'Test'>
  line >> Add
  line >> Break
  :open.Pre: {
   pgh.New :pre: <'Tests'>
   pgh.New :reg: <'Tests'>
  } :close.Pre:
  :open.Map: <'planetmap'> {
  } :close.Map:
  :open.Address: {
   text.add.in <'Test'>
   text.add.sm <'Test'>
   text.add.em <'Test'>
   text.add.it <'Test'>
   text.add.im <'Test'>
   text.add.sp <'Test'>
   text.add.sb <'Test'>
   text.add.bd <'Test'>
   text.add.dl <'Test'>
   text.add.mk <'Test'>
  } :close.Address:
  quote.New :reg: <'Test'>
  :open.TDir: <'rtl'> {
   quote.New :block: <'Test'>
  } :close.TDir:
  cite.Add <'Test'>
  abbr.New :Test: <'Tst'>
  ::open.Kbd:: {
  } ::close.Kbd::
  ::open.Sample:: {
  } ::close.Sample::
  ::open.Var:: {
  } ::close.Var::
  ::open.Code:: {
  } ::close.Code::
  {=>Test<=}
  &addLink :https://www.test.org: <'Test'>
  &addImage :https://www.test.org/test.png: <'Test'>
  :open.Table: {
   :open.Row: {
    &addHead <'Test'>
    &addHead <'Test'>
    &addHead <'Test'>
    &addHead <'Test'>
   } :close.Row:
   :open.Row: {
    &addData <'Test'>
    &addData <'Test'>
    &addData <'Test'>
    &addData <'Test'>
   } :close.Row:
   :open.Row: {
    &addData <'Test'>
    &addData <'Test'>
    &addData <'Test'>
    &addData <'Test'>
   } :close.Row:
  } :close.Table:
  :open.UList: {
   &addItem <'Test'>
   &addItem <'Test'>
   &addItem <'Test'>
   &addItem <'Test'>
  } :close.UList:
  :open.OList: <'1'> {
   &addItem <'Test'>
   &addItem <'Test'>
   &addItem <'Test'>
   &addItem <'Test'>
  } :close.OList:
  :open.DList: {
   &addTerm <'Test'>
   &addDescription <'Test'>
   &addTerm <'Test'>
   &addDescription <'Test'>
  } :close.DList:
  ::open.Div:: {
  } ::close.Div::
  ::open.Span:: {
  } ::close.Span::
 } :::close.Base:::
} ::::close.EC::::
