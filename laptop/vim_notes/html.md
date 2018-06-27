```html
Content type	name attribute	                                          autocomplete attribute
Name	        name fname mname lname                                    name (full name)
                                                                        given-name (first name)
                                                                        additional-name (middle name)
                                                                        family-name (last name)

Email	       email	                                                     email

Address	     address city region province state zip zip2 postal country  For one address input:
                                                                         street-address
                                                                         For two address inputs:
                                                                         address-line1
                                                                         address-line2
                                                                         address-level1 (state or province)
                                                                         address-level2 (city)
                                                                         postal-code (zip code)
                                                                         country

Phone	      phone mobile country-code area-code exchange suffix ext	     tel

Credit Card	ccname cardnumber cvc ccmonth ccyear exp-date card-type	     cc-name
                                                                         cc-number
                                                                         cc-csc
                                                                         cc-exp-month
                                                                         cc-exp-year
                                                                         cc-exp
                                                                         cc-type

Usernames	  username	                                                   username
Passwords	  password	                                                   current-password (for sign-in forms)
                                                                         new-password (for sign-up and password-change forms)
<!DOCTYPE html>

Elements are designators that define the structure and content of objects within
a page.

    <a>

<!-- Self-Closing Elements -->

<br> <embed> <hr> <img> <input> <link> <meta> <param> <source> <wbr>

Tags. The use of less-than and greater-than angle brackets surrounding an element
creates what is known as a tag.

    <a>...</a>

Attributes are properties used to provide additional information about an element.
The most common attributes include the id attribute, which identifies an element;
the class attribute, which classifies an element; the src attribute, which specifies
a source for embeddable content; and the href attribute, which provides a hyperlink
reference to a linked resource.

    <a href="http://shayhowe.com/">Shay Howe</a>

<!--  Structurally Based Elements -->

<header>, <nav>, <article>, <section>, <aside>, and <footer>

<!-- Bold Text in Action -->

<!-- Strong importance -->
<p><strong>Caution:</strong> Falling rocks.</p>

<!-- Stylistically offset -->
<p>This recipe calls for <b>bacon</b> and <b>baconnaise</b>.</p>

<!-- Italicize Text  -->

<!-- Stressed emphasis -->
<p>I <em>love</em> Chicago!</p>

<!-- Alternative voice or tone -->
<p>The name <i>Shay</i> means a gift.</p>

<!-- Relative and Absolute Paths -->

<!-- Relative Path -->
<a href="about.html">About</a>

<!-- Absolute Path -->
<a href="http://www.google.com/">Google</a>

<!-- Mailto Links -->

<a href="mailto:shay@awesome.com?subject=Reaching%20Out&body=How%20are%20you">Email Me</a>

<!-- Opening Links in a New Window -->

<a href="http://shayhowe.com/" target="_blank">Shay Howe</a>

<!-- Linking to Parts of the Same Page -->

<body id="top">
  ...
  <a href="#top">Back to top</a>
  ...
</body>



%% role attributes:

Widget roles include:

alert
alertdialog
button
checkbox
combobox
dialog
marquee
menuitem
menuitemcheckbox
menuitemradio
option
progressbar
radio
scrollbar
slider
spinbutton
status
tab
tabpanel
textbox
timer
tooltip
treeitem

Landmark roles include:

banner
complementary
contentinfo
main
navigation
search

Document structure roles include:

article
group
heading
list
listitem
note
presentation
separator

```
