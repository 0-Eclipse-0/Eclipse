&setDoctype <html>
eclipse {
 % head % {
  #--{
  % styling % {
  } % styling %
  % script % {
  } % script %
  % ns % {
  } % ns %
  }--#
  &setMData :name: <'Test'> <'Test'>
  &setMData :http-equiv: <'refresh'> <'30'>
  &setMData :charset: <'UTF-8'>
  &setTitle <'Test'>
  &setBase <'https://www.test.com/images'> <'_blank'>
  !include :StyleSheet: :CSS: <style.css>
  !include :Script: <index.js>
 } % head %
 % base % {
  heading.New :1: <'Test'>
  heading.New :2: <'Test'>
  heading.New :3: <'Test'>
  heading.New :4: <'Test'>
  heading.New :5: <'Test'>
  heading.New :6: <'Test'>
  line >> Add
  line >> Break
  % preformat % {
   pgh.New :pre: <'Tests'>
   pgh.New :reg: <'Tests'>
  } % preformat %
  % map % <'planetmap'> {
  } % map %
  % address % {
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
  } % address %
  quote.New :reg: <'Test'>
  % tdir % <'rtl'> {
   quote.New :block: <'Test'>
  } % tdir %
  cite.Add <'Test'>
  abbr.New :Test: <'Tst'>
  % kbd % {
  } % kbd %
  % sample % {
  } % sample %
  % variable % {
  } % variable %
  % code % {
  } % code %
  {=>Test<=}
  &addLink :https://www.test.org: <'Test'>
  &addImage :https://www.test.org/test.png: <'Test'>
  % table % {
   % row % {
    &addHead <'Test'>
    &addHead <'Test'>
    &addHead <'Test'>
    &addHead <'Test'>
   } % row %
   % row % {
    &addData <'Test'>
    &addData <'Test'>
    &addData <'Test'>
    &addData <'Test'>
   } % row %
   % row % {
    &addData <'Test'>
    &addData <'Test'>
    &addData <'Test'>
    &addData <'Test'>
   } % row %
  } % table %
  % ulist % {
   &addItem <'Test'>
   &addItem <'Test'>
   &addItem <'Test'>
   &addItem <'Test'>
  } % ulist %
  % olist % <'1'> {
   &addItem <'Test'>
   &addItem <'Test'>
   &addItem <'Test'>
   &addItem <'Test'>
  } % olist %
  % dlist % {
   &addTerm <'Test'>
   &addDescription <'Test'>
   &addTerm <'Test'>
   &addDescription <'Test'>
  } % dlist %
  % div % {
  } % div %
  % span % {
  } % span %
 } % base %
} eclipse
