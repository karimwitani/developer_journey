# CM 1040 - Web Development

The CM-1040, web development, course aims to give us the basic understanding of how websites are built and served to users.   

The main goals of the course are to:

1. explain the benefits/limitation of client-side interactivity of web applications
2. Undertand web page structure and the Document Object Model
3. Create web page using html/css/javascript
4. Design websites with accessibility in mind

The course has 10 topics:

1. Introduction to the web
2. Designing web sites
3. Intro to HTML
4. Intro to CSS
5. Positioning in CSS
6. Responsive websites
7. Intro to javascript for the web
8. React to the user
9. Javascript templates libraries
10. Web hosting and professional practices

## Topic 1: Introduction to the web

The web is a collection of devices connected to each other through a network. These devices exchange data/ressource among each other and web pages are a type of ressource that is shared.  

A collection of web pages is called a website. Each website can be identified using a unique domain name (e.g: google.com). Each domain name has a corresponding IP (internet protocol) that allows requests to be routed to it correctly. The mapping between IP addresses and domain names is the responsability of DNS (Domain Name Services) which act like phone books that are stored in internet routers.  

The internet is based on a client/server architercture when the client is a computer or phone that requests data and web pages from a remote server that hosts the website and its corresponding data.  

In order to connect billions on servers/clients, the participants on the internet all comply with a set of protocols and standard on how to request/serve data across the network. One such protocole is HTTP (hyper text transfer protocole) which is the standard way that web browsers on clients interact with remote servers.

Data transfer over the internet can be cumbersome if the transfered file is large enough, as is the case of high resolution video streaming. Even in the case of text, formatting text from plain to rich text or microsoft word format can substantially increase the file size. In order to accelerate the transfer, compression techniques are used. Zipping/Unzipping files is another case of a shared protocole being used by participants of the network.

### Semantics & the web

Web pages are documents that will be consumed by users in a very similar manner as newspapers, cookbooks and research papers. The structure of those document gave the reader context on the purpose of each component of the page. The same is true for web pages. Each webpage is divided into sections that each serves its purpose (header, footer, main, aside). This information is transmitted using metadata (data about data) that the web browser is able to parse and interpret.

Divisional blocks are sections of a webpage that have custom tags that are not predefined in HTML (the language defining a web page's structure). This metadata is important for search engines, not just users, for SEO purposes (Search Engine Optimisation).

### Accessing Ressources On The Web

Client request ressources on the internet using web browsers such as Chrome, Firefox and Opera. In order for these browsers to function they make use of engine such as the Gecko engine for Firefox and Chromium for Chrome. These engines take care of rendering pages and executing code under the hood.

Over the recent year Chrome has established itself as the most dominant web browser [link](https://en.wikipedia.org/wiki/Usage_share_of_web_browsers).

![web_browser_usage](https://upload.wikimedia.org/wikipedia/commons/b/b7/StatCounter-browser-ww-yearly-2009-2023.png)

Web browsers use the DOM (Document Object Model) in order access and update content of webpages. It provides a representation of the webpage as a structured group of nested nodes and object that have properties and methods. It essentially turns elemenent expressed in HTML in to objects taht can be manipulated using Javascript.  

During the page load process there is a sequential process that happens where a browser will analyse the structure of the page, list its elements and establish a dependency tree among them.  

## Topic 2: Website Design

Design is a fundamental initial step that should be undertaken before building a website. It is the process of planning, deciding and prototyping what the website should do (features / functionality) and how it should look (semantic structure / styling).  

It is essential because it makes sure that all stakholders involved in building the websiste agree and understand ahead of time on what the end product should look and feel like. This avoids re-work, changes in scopes and wasted time and effort down the line.  

### Design Thinking

Design thinking is an established framework for designing websites and applications. Ot put the end user front and center and revolves around a repeated cycled of:

1. Empathize: Understand the needs/desires of your users by engaging with them directly
2. Define: Clearly articulate the problem based on insights that were gathered in the empathise steps
3. Ideate: Generate a wide range of creative ideas that **MAY** solve the users' pain points
4. Prototype: Create low-fidelity prototypes of the **potential** solutions
5. Test: Gather feedback from your users on the proposed solutions/prototypes and evaluate their effectivness

### Design Principles

Styling is not design. Styles come in and out of fashion while good design principles remain relevant across time. Good design is centered around

1. Simplicity
2. Visual Hierarchy
3. Navigability
4. Consistency
5. Accessibility
6. Responsivness

### HTML: The Page Structure

HTML (Hyper Text Markup Language) is the standard markup landuage used to create web pages. It acts as a skeleton for webpages, giving them their shape by defining the structure and layout of elements in a webpage.  

It was initialy create by by Sir Tim Berners-Lee in the late 1980s while working at CERN (European Organization for Nuclear Research) and the initial version, HTML 1.0, was released in 1993. Today we are at version 5 (HTML5) released in 2014.  

The World Wide Web Consortium (W3C), the primary international standards organization for the World Wide Web oversees the development of HTML and other web standards. Tim Berners-Lee is the director of W3C.  

It uses the concept of opening and closing tags to define the structure of web page using divisonal blocks. Her is a basic HTML page example.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML5 Example</title>
</head>
<body>
    <header>
        <h1>Welcome to My Website</h1>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="home">
            <h2>Home</h2>
            <p>This is the home page of my website.</p>
        </section>

        <section id="about">
            <h2>About</h2>
            <p>Learn more about our company and team.</p>
        </section>

        <section id="services">
            <h2>Services</h2>
            <ul>
                <li>Web Design</li>
                <li>Graphic Design</li>
                <li>Digital Marketing</li>
            </ul>
        </section>

        <section id="contact">
            <h2>Contact</h2>
            <form action="/submit-form" method="POST">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="4" required></textarea>

                <button type="submit">Submit</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 My Website. All rights reserved.</p>
    </footer>
</body>
</html>
```

Each divisional block has an opening and closing tag. ```<tag></tag>```. The tag name conveys information on the purpose of the block. Custom blocks that are not predefined in the standard can be create using divisional blocks `<div></div>`.

- `<html>`: Root element of the HTML document.
- `<head>`: Contains meta-information about the document, such as title, character set, and viewport settings.
- `<body>`: Contains the visible content of the document.
- `<header>`: Represents the header section of the webpage.
- `<nav>`: Represents a navigation bar.
- `<main>`: Represents the main content of the webpage.
- `<section>`: Divides the content into sections.
- `<h1>`, `<h2>`: Heading elements.
- `<p>`: Paragraph elements.
- `<ul>`, `<li>`: Unordered list and list item elements.
- `<form>`, `<input>`, `<textarea>`, `<label>`, `<button>`: Form elements for collecting user input.
- `<footer>`: Represents the footer section of the webpage.

For a complete reference of all the standard HTML tags refer to [link](https://www.w3schools.com/tags/)

### Styling Website Using CSS

CSS (Cascading Style Sheets) are what define the style of webpages. CSS was proposed by Håkon Wium Lie in 1994, while working with Tim Berners-Lee at CERN. Lie presented the first proposal for CSS in 1994, and the first CSS specification, CSS1, was released in 1996 as a part of the World Wide Web Consortium's (W3C) recommendation.  

CSS files work on a priority hierarchy and style can be shared across elements. CSS is applied to elements in HTML documents using **selectors** such as the tag/class/id/attribute of state. Below is an exmaple CSS file

```css
/* Universal Selector */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Type Selector */
h1 {
    color: blue;
}

/* Class Selector */
.highlight {
    background-color: yellow;
}

/* ID Selector */
#special {
    font-weight: bold;
}

/* Descendant Selector */
article p {
    font-style: italic;
}

/* Child Selector */
nav > ul {
    list-style-type: none;
}

/* Adjacent Sibling Selector */
h2 + p {
    font-weight: bold;
}

/* Attribute Selector */
a[target="_blank"] {
    color: red;
}

/* Pseudo-class Selector */
p:hover {
    background-color: lightgray;
}
```

HTML pages are loaded, parsed ad a DOM is created along with its component nodes. Parallel to parsing the HTML the browser will load and parse the CSS. Once both are done it will apply the styles to the appropriate nodes and display the webpage.