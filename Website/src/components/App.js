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

          <section className="wrapper style1 align-center">
            <div className="inner">
              <section className="profile">
                <article>
                  <a href="#" className="image"><img src="images/pic04.jpg" alt="" /></a>
                  <h3 className="major">Amey Jain</h3>
                  <p>Co-founder</p>
                </article>
                <article>
                  <a href="#" className="image"><img src="images/pic05.jpg" alt="" /></a>
                  <h3 className="major">Shubhi Yede</h3>
                  <p>Co-founder</p>
                </article>
              </section>
            </div>
          </section>

            <section className="wrapper style1 align-center">
              <div className="inner">
                <div className="items style1 medium onscroll-fade-in">
                  <section>
                    <span className="icon style2 major fa-diamond"></span>
                    <h3>WIRELESS</h3>
                    <p>Just connect the speaker to same wifi as your smart phone or tablet and you are good to go.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-save"></span>
                    <h3>POWERFUL MIC</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-bar-chart"></span>
                    <h3>EASY CONTROL</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-wifi"></span>
                    <h3>SIMPLE SETUP</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-cog"></span>
                    <h3>SUPIRIOR DESIGN</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
                  </section>
                  <section>
                    <span className="icon style2 major fa-paper-plane"></span>
                    <h3>HIGHLY COMPATIBLE</h3>
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
