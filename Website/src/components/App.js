import React, { Component } from 'react'
import { Footer } from './Footers'
import { Header } from './Header'

export default class App extends Component {
  render() {
    return (
      <div id="page-wrapper">

          <header id="header" className="alt">
            <h1><a href="index.html">Solid State</a></h1>
            <nav>
              <a href="#menu">Menu</a>
            </nav>
          </header>

          <nav id="menu">
            <div className="inner">
              <h2>Menu</h2>
              <ul className="links">
                <li><a href="index.html">Home</a></li>
                <li><a href="generic.html">Generic</a></li>
                <li><a href="elements.html">Elements</a></li>
                <li><a href="#">Log In</a></li>
                <li><a href="#">Sign Up</a></li>
              </ul>
              <a href="#" className="close">Close</a>
            </div>
          </nav>

          <Header />

          <section id="wrapper">

              <section id="four" className="wrapper alt style1">
                <div className="inner">
                  <h2 className="major">Our Team</h2>
                  <section className="features">
                    <article>
                      <a href="#" className="image"><img src="images/pic04.jpg" alt="" /></a>
                      <h3 className="major">Sed feugiat lorem</h3>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing vehicula id nulla dignissim dapibus ultrices.</p>
                      <a href="#" className="special">Learn more</a>
                    </article>
                    <article>
                      <a href="#" className="image"><img src="images/pic05.jpg" alt="" /></a>
                      <h3 className="major">Nisl placerat</h3>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing vehicula id nulla dignissim dapibus ultrices.</p>
                      <a href="#" className="special">Learn more</a>
                    </article>
                  </section>
                  <ul className="actions">
                    <li><a href="#" className="button">Browse All</a></li>
                  </ul>
                </div>
              </section>
          </section>

            <section className="wrapper style1 align-center">
              <div className="inner">
                <div className="items style1 medium onscroll-fade-in">
                  <section>
                    <span className="icon style2 major fa-diamond"></span>
                    <h3>Lorem</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-save"></span>
                    <h3>Ipsum</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-bar-chart"></span>
                    <h3>Dolor</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-wifi"></span>
                    <h3>Amet</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-cog"></span>
                    <h3>Magna</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-paper-plane"></span>
                    <h3>Tempus</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-desktop"></span>
                    <h3>Amey</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-refresh"></span>
                    <h3>Elit</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-hashtag"></span>
                    <h3>Morbi</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-bolt"></span>
                    <h3>Turpis</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-envelope"></span>
                    <h3>Ultrices</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-leaf"></span>
                    <h3>Risus</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                </div>
              </div>
            </section>

          <Footer/>
      </div>
    );
  }
}
